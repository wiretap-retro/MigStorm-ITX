{==============================================================================|
| Project : Delphree - Synapse                                   | 005.000.000 |
|==============================================================================|
| Content: Serial port support                                                 |
|==============================================================================|
| Copyright (c)2001-2002, Lukas Gebauer                                        |
| All rights reserved.                                                         |
|                                                                              |
| Redistribution and use in source and binary forms, with or without           |
| modification, are permitted provided that the following conditions are met:  |
|                                                                              |
| Redistributions of source code must retain the above copyright notice, this  |
| list of conditions and the following disclaimer.                             |
|                                                                              |
| Redistributions in binary form must reproduce the above copyright notice,    |
| this list of conditions and the following disclaimer in the documentation    |
| and/or other materials provided with the distribution.                       |
|                                                                              |
| Neither the name of the Ararat s.r.o. nor the names of its contributors may  |
| be used to endorse or promote products derived from this software without    |
| specific prior written permission.                                           |
|                                                                              |
| THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"  |
| AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE    |
| IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE   |
| ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR  |
| ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL       |
| DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR   |
| SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER   |
| CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT           |
| LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY    |
| OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH  |
| DAMAGE.                                                                      |
|==============================================================================|
| The Initial Developer of the Original Code is Lukas Gebauer (Czech Republic).|
| Portions created by Lukas Gebauer are Copyright (c)2001.                     |
| All Rights Reserved.                                                         |
|==============================================================================|
| Contributor(s):                                                              |
|  (c)2002, Hans-Georg Joepgen (cpom Comport Ownership Manager and bugfixes    |
|==============================================================================|
| History: see HISTORY.HTM from distribution package                           |
|          (Found at URL: http://www.ararat.cz/synapse/)                       |
|==============================================================================}

{$Q-}
{$WEAKPACKAGEUNIT ON}

unit SynaSer;

interface

uses
{$IFDEF LINUX}
  Libc, Types, KernelIoctl,
{$ELSE}
  Windows, Classes,
{$ENDIF}
  SysUtils;

const
  LockfileDirectory = '/var/lock'; {HGJ}
  PortIsClosed = -1;               {HGJ}
  ErrAlreadyOwned = 9991;          {HGJ}
  ErrAlreadyInUse = 9992;          {HGJ}
  ErrWrongParameter = 9993;        {HGJ}
  ErrPortNotOpen = 9994;           {HGJ}
  ErrNoDeviceAnswer =  9995;       {HGJ}
  ErrMaxBuffer = 9996;
  ErrTimeout = 9997;
  ErrNotRead = 9998;
  ErrFrame = 9999;
  ErrOverrun = 10000;
  ErrRxOver = 10001;
  ErrRxParity = 10002;
  ErrTxFull = 10003;

  dcb_Binary = $00000001;
  dcb_ParityCheck = $00000002;
  dcb_OutxCtsFlow = $00000004;
  dcb_OutxDsrFlow = $00000008;
  dcb_DtrControlMask = $00000030;
  dcb_DtrControlDisable = $00000000;
  dcb_DtrControlEnable = $00000010;
  dcb_DtrControlHandshake = $00000020;
  dcb_DsrSensivity = $00000040;
  dcb_TXContinueOnXoff = $00000080;
  dcb_OutX = $00000100;
  dcb_InX = $00000200;
  dcb_ErrorChar = $00000400;
  dcb_NullStrip = $00000800;
  dcb_RtsControlMask = $00003000;
  dcb_RtsControlDisable = $00000000;
  dcb_RtsControlEnable = $00001000;
  dcb_RtsControlHandshake = $00002000;
  dcb_RtsControlToggle = $00003000;
  dcb_AbortOnError = $00004000;
  dcb_Reserveds = $FFFF8000;

{$IFDEF LINUX}
const
  INVALID_HANDLE_VALUE = THandle(-1);
  CS7fix = $0000020;

type
  TDCB = packed record
    DCBlength: DWORD;
    BaudRate: DWORD;
    Flags: Longint;
    wReserved: Word;
    XonLim: Word;
    XoffLim: Word;
    ByteSize: Byte;
    Parity: Byte;
    StopBits: Byte;
    XonChar: CHAR;
    XoffChar: CHAR;
    ErrorChar: CHAR;
    EofChar: CHAR;
    EvtChar: CHAR;
    wReserved1: Word;
  end;
  PDCB = ^TDCB;

const
  MaxRates = 30;
  Rates: array[0..MaxRates, 0..1] of cardinal =
  (
    (0, B0),
    (50, B50),
    (75, B75),
    (110, B110),
    (134, B134),
    (150, B150),
    (200, B200),
    (300, B300),
    (600, B600),
    (1200, B1200),
    (1800, B1800),
    (2400, B2400),
    (4800, B4800),
    (9600, B9600),
    (19200, B19200),
    (38400, B38400),
    (57600, B57600),
    (115200, B115200),
    (230400, B230400),
    (460800, B460800),
    (500000, B500000),
    (576000, B576000),
    (921600, B921600),
    (1000000, B1000000),
    (1152000, B1152000),
    (1500000, B1500000),
    (2000000, B2000000),
    (2500000, B2500000),
    (3000000, B3000000),
    (3500000, B3500000),
    (4000000, B4000000)
    );
{$ENDIF}

type

  THookSerialReason = (
    HR_SerialClose,
    HR_Connect,
    HR_CanRead,
    HR_CanWrite,
    HR_ReadCount,
    HR_WriteCount
    );

  THookSerialStatus = procedure(Sender: TObject; Reason: THookSerialReason;
    const Value: string) of object;

  ESynaSerError = class(Exception)
  public
    ErrorCode: integer;
    ErrorMessage: string;
  end;

  TBlockSerial = class(TObject)
  protected
    FOnStatus: THookSerialStatus;
    Fhandle: THandle;
    FLastError: integer;
    FBuffer: string;
    FRaiseExcept: boolean;
    FRecvBuffer: integer;
    FSendBuffer: integer;
    FModemWord: integer;
    FRTSToggle: Boolean;
    FDeadlockTimeout: integer;
    FInstanceActive: boolean;      {HGJ}
    FTestDSR: Boolean;
    FTestCTS: Boolean;
    FMaxLineLength: Integer;
    FLinuxLock: Boolean;
{$IFNDEF LINUX}
    FEventHandle: THandle;
    function CanEvent(Event: dword; Timeout: integer): boolean;
    procedure DecodeCommError(Error: DWord);
{$ENDIF}
    procedure SetSizeRecvBuffer(size: integer);
    function GetDSR: Boolean;
    procedure SetDTRF(Value: Boolean);
    function GetCTS: Boolean;
    procedure SetRTSF(Value: Boolean);
    function GetCarrier: Boolean;
    function GetRing: Boolean;
    procedure DoStatus(Reason: THookSerialReason; const Value: string);
    procedure GetComNr(Value: string);
    function  PreTestFailing: boolean; {HGJ}
    function  TestCtrlLine: Boolean;
{$IFDEF LINUX}
    procedure DcbToTermios(const dcb: TDCB; var term: termios);
    procedure TermiosToDcb(const term: termios; var dcb: TDCB);
    function ReadLockfile: integer;
    function LockfileName: String;
    procedure CreateLockfile(PidNr: integer);
    procedure ErrorMethod(ErrNumber: integer); {HGJ}
{$ENDIF}
  public
    DCB: Tdcb;
    FComNr: integer;
{$IFDEF LINUX}
    TermiosStruc: termios;
{$ENDIF}
    constructor Create;
    destructor Destroy; override;
    function GetVersion: string;
    procedure CreateSocket;
    procedure CloseSocket;
  //stopbits is: 0- 1 stop bit, 1- 1.5 stop bits, 2- 2 stop bits
    procedure Connect(comport: string; baud, bits: integer; parity: char; stop: integer;
      softflow, hardflow: boolean);
    procedure SetCommState;
    procedure GetCommState;
    function SendBuffer(buffer: pointer; length: integer): integer;
    procedure SendByte(data: byte);
    procedure SendString(data: string);
    function RecvBuffer(buffer: pointer; length: integer): integer;
    function RecvBufferEx(buffer: pointer; length: integer; timeout: integer): integer;
    function RecvPacket(Timeout: Integer): string;
    function RecvByte(timeout: integer): byte;
    function RecvTerminated(Timeout: Integer; const Terminator: string): string;
    function Recvstring(timeout: integer): string;
    function WaitingData: integer;
    function WaitingDataEx: integer;
    function SendingData: integer;
    procedure EnableRTSToggle(value: boolean);
    procedure EnableSoftRTSToggle(value: boolean);
    procedure Flush;
    procedure Purge;
    function CanRead(Timeout: integer): boolean;
    function CanWrite(Timeout: integer): boolean;
    function CanReadEx(Timeout: integer): boolean;
    function ModemStatus: integer;
    procedure SetBreak(Duration: integer);
    function ATCommand(value: string): string;
    function SerialCheck(SerialResult: integer): integer;
    procedure ExceptCheck;
    procedure ErrorMethod(ErrNumber: integer); {HGJ}
{$IFDEF LINUX}
    function  cpomComportAccessible: boolean; {HGJ}
    procedure cpomReleaseComport;  {HGJ}
{$ENDIF}
  published
    class function GetErrorDesc(ErrorCode: integer): string;
    property Handle: THandle read Fhandle write FHandle;
    property LastError: integer read FLastError;
    property LineBuffer: string read FBuffer write FBuffer;
    property RaiseExcept: boolean read FRaiseExcept write FRaiseExcept;
    property SizeRecvBuffer: integer read FRecvBuffer write SetSizeRecvBuffer;
    property OnStatus: THookSerialStatus read FOnStatus write FOnStatus;
    property RTS: Boolean write SetRTSF;
    property CTS: boolean read GetCTS;
    property DTR: Boolean write SetDTRF;
    property DSR: boolean read GetDSR;
    property Carrier: boolean read GetCarrier;
    property Ring: boolean read GetRing;
    property InstanceActive: boolean read FInstanceActive; {HGJ}
    property TestDSR: boolean read FTestDSR write FTestDSR;
    property TestCTS: boolean read FTestCTS write FTestCTS;
    property MaxLineLength: Integer read FMaxLineLength Write FMaxLineLength;
    property DeadlockTimeout: Integer read FDeadlockTimeout Write FDeadlockTimeout;
    property LinuxLock: Boolean read FLinuxLock write FLinuxLock;
  end;

implementation

constructor TBlockSerial.Create;
begin
  inherited create;
  FRaiseExcept := false;
  FHandle := INVALID_HANDLE_VALUE;
  FComNr:= PortIsClosed;               {HGJ}
  FInstanceActive:= false;             {HGJ}
  Fbuffer := '';
  FRTSToggle := False;
  FMaxLineLength := 0;
  FTestDSR := False;
  FTestCTS := False;
  FDeadlockTimeout := 30000;
  FLinuxLock := True;
{$IFNDEF LINUX}
  FEventHandle := INVALID_HANDLE_VALUE;
{$ENDIF}
end;

destructor TBlockSerial.Destroy;
begin
  CloseSocket;
{$IFNDEF LINUX}
  if FEventHandle <> INVALID_HANDLE_VALUE then
    CloseHandle(FEventHandle);
{$ENDIF}
  inherited destroy;
end;

function TBlockSerial.GetVersion: string;
begin
	Result := 'SynaSer 5.0.0';
end;

procedure TBlockSerial.CreateSocket;
begin
// dummy for compatibility with TBlockSocket classes
end;

procedure TBlockSerial.CloseSocket;
begin
  if Fhandle <> INVALID_HANDLE_VALUE then
  begin
    Purge;
    RTS := False;
    DTR := False;
    FileClose(integer(FHandle));
  end;
  if InstanceActive then
  begin
    {$IFDEF LINUX}
    if FLinuxLock then
      cpomReleaseComport;
    {$ENDIF}
    FInstanceActive:= false
  end;
  Fhandle := INVALID_HANDLE_VALUE;
  FComNr:= PortIsClosed;
  DoStatus(HR_SerialClose, '');
end;

procedure TBlockSerial.GetComNr(Value: string);
begin
  FComNr := PortIsClosed;
  if pos('COM', uppercase(Value)) = 1 then
  begin
    FComNr := StrToIntdef(copy(Value, 4, Length(Value) - 3), PortIsClosed + 1) - 1;
  end;
  if pos('/DEV/TTYS', uppercase(Value)) = 1 then
  begin
    FComNr := StrToIntdef(copy(Value, 10, Length(Value) - 9), PortIsClosed - 1) + 1;
  end;
end;

procedure TBlockSerial.Connect(comport: string; baud, bits: integer;
  parity: char; stop: integer; softflow, hardflow: boolean);
{$IFNDEF LINUX}
var
  CommTimeouts: TCommTimeouts;
{$ENDIF}
begin
  // Is this TBlockSerial Instance already busy?
  if InstanceActive then           {HGJ}
  begin                            {HGJ}
    ErrorMethod(ErrAlreadyInUse);  {HGJ}
    Exit;                          {HGJ}
  end;                             {HGJ}
  FBuffer := '';
  GetComNr(comport);
  if FComNr = PortIsClosed then
  begin
    ErrorMethod(ErrWrongParameter);
    Exit;
  end;
  SetLastError (0);
{$IFDEF LINUX}
  comport := '/dev/ttyS' + IntToStr(FComNr);
  // Comport already owned by another process?          {HGJ}
  if FLinuxLock then
    if not cpomComportAccessible then
    begin
      ErrorMethod(ErrAlreadyOwned);
      Exit;
    end;
  FHandle := THandle(Libc.open(pchar(comport), O_RDWR or O_SYNC));
  SerialCheck(integer(FHandle));
  if FLastError <> 0 then
  begin
  if FLinuxLock then
    cpomReleaseComport;
  end;
  ExceptCheck;
  if FLastError <> 0 then
    Exit;
{$ELSE}
  comport := '\\.\COM' + IntToStr(FComNr + 1);
  FHandle := THandle(CreateFile(PChar(comport), GENERIC_READ or GENERIC_WRITE,
    0, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL or FILE_FLAG_OVERLAPPED, 0));
  SerialCheck(integer(FHandle));
  ExceptCheck;
  if FLastError <> 0 then
    Exit;
  SetCommMask(FHandle, 0);
  FEventhandle := CreateEvent(nil, True, False, nil);
  CommTimeOuts.ReadIntervalTimeout := MAXWORD;
  CommTimeOuts.ReadTotalTimeoutMultiplier := 0;
  CommTimeOuts.ReadTotalTimeoutConstant := 0;
  CommTimeOuts.WriteTotalTimeoutMultiplier := 0;
  CommTimeOuts.WriteTotalTimeoutConstant := 0;
  SetCommTimeOuts(FHandle, CommTimeOuts);
{$ENDIF}
  GetCommState;
  dcb.BaudRate := baud;
  dcb.ByteSize := bits;
  case parity of
    'N', 'n': dcb.parity := 0;
    'O', 'o': dcb.parity := 1;
    'E', 'e': dcb.parity := 2;
    'M', 'm': dcb.parity := 3;
    'S', 's': dcb.parity := 4;
  end;
  if dcb.Parity > 0 then
    dcb.Flags := dcb.Flags or dcb_ParityCheck
  else
    dcb.Flags := dcb.Flags and (not dcb_ParityCheck);
  dcb.StopBits := stop;
  dcb.Flags := dcb.Flags and (not dcb_RtsControlMask);
  if hardflow then
    dcb.Flags := dcb.Flags or dcb_OutxCtsFlow or dcb_RtsControlHandshake
  else
  begin
    dcb.Flags := dcb.Flags and (not dcb_OutxCtsFlow);
    dcb.Flags := dcb.Flags or dcb_RtsControlEnable;
  end;
  if softflow then
    dcb.Flags := dcb.Flags or dcb_OutX or dcb_InX
  else
    dcb.Flags := dcb.Flags and (not (dcb_OutX or dcb_InX));
  dcb.Flags := dcb.Flags and (not dcb_DtrControlMask);
  dcb.Flags := dcb.Flags or dcb_DtrControlEnable;
  SetCommState;
  if FLastError <> 0 then  {HGJ}
  begin                   {HGJ}
    FileClose(FHandle);   {HGJ}
    {$IFDEF LINUX}
    if FLinuxLock then
      cpomReleaseComport;
    {$ENDIF}
    ExceptCheck;
    Exit;                 {HGJ}
  end;                    {HGJ}
  SizeRecvBuffer := 4096;
  FInstanceActive:= True; {HGJ}
  if not TestCtrlLine then  {HGJ}
  begin                                  {HGJ}
    FLastError := ErrNoDeviceAnswer;     {HGJ}
    FileClose(integer(FHandle));         {HGJ}
    {$IFDEF LINUX}
    if FLinuxLock then
      cpomReleaseComport;                {HGJ}
    {$ENDIF}                             {HGJ}
    FInstanceActive := false;            {HGJ}
    Fhandle := INVALID_HANDLE_VALUE;     {HGJ}
    FComNr:= PortIsClosed;               {HGJ}
  end;                                   {HGJ}
  if FLastError = 0 then
  begin
    Purge;
    RTS := True;
    DTR := True;
  end;
  ExceptCheck;
  DoStatus(HR_Connect, comport);
end;

function TBlockSerial.SendBuffer(buffer: pointer; length: integer): integer;
{$IFNDEF LINUX}
var
  Overlapped: TOverlapped;
  X, Err: DWord;
{$ENDIF}
begin
  Result := 0;
  if PreTestFailing then   {HGJ}
    Exit;                  {HGJ}
  if FRTSToggle then
  begin
    Flush;
    RTS := True;
  end;
{$IFDEF LINUX}
  result := FileWrite(integer(Fhandle), Buffer^, Length);
  serialcheck(result);
{$ELSE}
  FillChar(Overlapped, Sizeof(Overlapped), 0);
  ResetEvent(FEventHandle);
  Overlapped.hEvent := FEventHandle;
  x := DWord(WriteFile(FHandle, Buffer^, Length, DWord(Result), @Overlapped));
  if (x = 0) or (x = DWord(INVALID_HANDLE_VALUE)) then
    FLastError := GetLastError;
  if FlastError = ERROR_IO_PENDING then
  begin
    x := WaitForSingleObject(FEventHandle, FDeadlockTimeout);
    SerialCheck(integer(GetOverlappedResult(FHandle, Overlapped, Dword(Result), False)));
    if FLastError = ERROR_IO_INCOMPLETE then
      CancelIO(FHandle);
    if x = WAIT_TIMEOUT then
    	FLastError := ErrTimeout;
  end;
  ResetEvent(FEventHandle);
  ClearCommError(FHandle, err, nil);
  if err <> 0 then
    DecodeCommError(err);
{$ENDIF}
  if FRTSToggle then
  begin
    Flush;
    RTS := False;
  end;
  ExceptCheck;
  DoStatus(HR_WriteCount, IntToStr(Result));
end;

procedure TBlockSerial.SendByte(data: byte);
begin
  SendBuffer(@Data, 1);
end;

procedure TBlockSerial.SendString(data: string);
begin
  SendBuffer(Pointer(Data), Length(Data));
end;

function TBlockSerial.RecvBuffer(buffer: pointer; length: integer): integer;
{$IFDEF LINUX}
begin
  Result := 0;
  if PreTestFailing then   {HGJ}
    Exit;                  {HGJ}
  result := FileRead(integer(FHandle), Buffer^, length);
  serialcheck(result);
{$ELSE}
var
  Overlapped: TOverlapped;
  x, Err: DWord;
begin
  Result := 0;
  if PreTestFailing then   {HGJ}
    Exit;                  {HGJ}
  FillChar(Overlapped, Sizeof(Overlapped), 0);
  Overlapped.hEvent := FEventHandle;
  x := DWord(ReadFile(FHandle, Buffer^, length, Dword(Result), @Overlapped));
  if (x = 0) or (x = Dword(INVALID_HANDLE_VALUE)) then
    FLastError := GetLastError;
  if FlastError = ERROR_IO_PENDING then
  begin
    x := WaitForSingleObject(FEventHandle, FDeadlockTimeout);
    SerialCheck(integer(GetOverlappedResult(Handle, Overlapped, DWord(Result), False)));
    if FLastError = ERROR_IO_INCOMPLETE then
      CancelIO(FHandle);
    if x = WAIT_TIMEOUT then
    	FLastError := ErrTimeout;
  end;
  ResetEvent(FEventHandle);
  ClearCommError(FHandle, err, nil);
  if err <> 0 then
    DecodeCommError(err);
{$ENDIF}
  ExceptCheck;
  DoStatus(HR_ReadCount, IntToStr(Result));
end;

function TBlockSerial.RecvBufferEx(buffer: pointer; length: integer; timeout: integer): integer;
var
  s, ss, st: string;
  x, l, lss: integer;
  fb, fs: integer;
  max: integer;
begin
  Result := 0;
  if PreTestFailing then   {HGJ}
    Exit;                  {HGJ}
  FLastError := 0;
  x := system.length(FBuffer);
  if length <= x then
  begin
    fb := length;
    fs := 0;
  end
  else
  begin
    fb := x;
    fs := length - x;
  end;
  ss := '';
  if fb > 0 then
  begin
    s := copy(FBuffer, 1, fb);
    delete(Fbuffer, 1, fb);
  end;
  if fs > 0 then
  begin
    Max := FRecvBuffer;
    if Max = 0 then
    	Max := 1024;
    ss := '';
    while system.length(ss) < fs do
    begin
      if canread(timeout) then
      begin
        l := WaitingData;
        if l > max then
          l := max;
        if (system.length(ss) + l) > fs then
          l := fs - system.length(ss);
        setlength(st, l);
        x := RecvBuffer(Pointer(st), l);
        if FlastError <> 0 then
          break;
        lss := system.length(ss);
        setlength(ss, lss + x);
        Move(pointer(st)^, Pointer(@ss[lss + 1])^, x);
              {It is 3x faster then ss:=ss+copy(st,1,x);}
        sleep(0);
      end
      else
        FLastError := ErrTimeout;
      if Flasterror <> 0 then
        break;
    end;
    fs := system.length(ss);
  end;
  result := fb + fs;
  s := s + ss;
  move(pointer(s)^, buffer^, result);
  ExceptCheck;
end;

function TBlockSerial.RecvPacket(Timeout: Integer): string;
var
  x: integer;
  s: string;
begin
  Result := '';
  if PreTestFailing then   {HGJ}
    Exit;                  {HGJ}
  FLastError := 0;
  x := -1;
  if FBuffer <> '' then
  begin
    Result := FBuffer;
    FBuffer := '';
  end
  else
    repeat
      if CanRead(Timeout) then
      begin
        x := WaitingData;
        if x > 0 then
        begin
          SetLength(s, x);
          x := RecvBuffer(Pointer(s), x);
          Result := Copy(s, 1, x);
        end;
      end
      else
        FLastError := ErrTimeout;
    until not((FlastError = 0) and (x = 0));
  ExceptCheck;
  if x = 0 then
    FLastError := integer(-1);
end;

function TBlockSerial.RecvByte(timeout: integer): byte;
var
  s: String;
  x: integer;
begin
  Result := 0;
  if PreTestFailing then   {HGJ}
    Exit;                  {HGJ}
  if CanRead(timeout) then
  begin
    x := WaitingData;
    if x > 0 then
    begin
      SetLength(s, 1);
      x := RecvBuffer(Pointer(s), 1);
      SetLength(s, x);
	    if s <> '' then
        Result := Ord(s[1])
      else
        FLastError := ErrNotRead;
    end
    else
      FLastError := ErrNotRead;
  end
 	else
   	FLastError := ErrTimeout;
  ExceptCheck;
end;

function TBlockSerial.RecvTerminated(Timeout: Integer; const Terminator: string): string;
var
  x: Integer;
  s: string;
  l: Integer;
begin
  Result := '';
  if PreTestFailing then   {HGJ}
    Exit;                  {HGJ}
  s := '';
  l := Length(Terminator);
  if l = 0 then
    Exit;
  FLastError := 0;
  repeat
    x := 0;
    if x > 0 then {nothing; work around for warning bug};   {HGJ}
    if FBuffer = '' then
    begin
      FBuffer := RecvPacket(Timeout);
      if FLastError <> 0 then
        Break;
    end;
    s := s + FBuffer;
    FBuffer := '';
    x := Pos(Terminator, s);
    if x > 0 then
    begin
      FBuffer := Copy(s, x + l, Length(s) - x - l + 1);
      s := Copy(s, 1, x - 1);
    end;
    if (FMaxLineLength <> 0) and (Length(s) > FMaxLineLength) then
    begin
      FLastError := ErrMaxBuffer;
      Break;
    end;
  until x > 0;
  if FLastError = 0 then
    Result := s
  else
    Result := '';
  ExceptCheck;
end;

function TBlockSerial.RecvString(Timeout: Integer): string;
var
  s: string;
begin
  Result := '';
  s := RecvTerminated(Timeout, #13 + #10);
  if FLastError = 0 then
    Result := s;
end;

{$IFDEF LINUX}
function TBlockSerial.WaitingData: integer;
begin
  serialcheck(ioctl(integer(FHandle), FIONREAD, @result));
  ExceptCheck;
end;
{$ELSE}
function TBlockSerial.WaitingData: integer;
var
  stat: TComStat;
  err: DWORD;
  x: integer;
begin
  x := integer(ClearCommError(FHandle, err, @stat));
  serialcheck(x);
  ExceptCheck;
  result := stat.cbInQue;
end;
{$ENDIF}

function TBlockSerial.WaitingDataEx: integer;
begin
	if FBuffer <> '' then
  	Result := Length(FBuffer)
  else
  	Result := Waitingdata;
end;

{$IFDEF LINUX}
function TBlockSerial.SendingData: integer;
begin
  FLastError := 0;
  Result := 0;
end;
{$ELSE}
function TBlockSerial.SendingData: integer;
var
  stat: TComStat;
  err: DWORD;
  x: integer;
begin
  x := integer(ClearCommError(FHandle, err, @stat));
  serialcheck(x);
  ExceptCheck;
  result := stat.cbOutQue;
end;
{$ENDIF}

{$IFDEF LINUX}
procedure TBlockSerial.DcbToTermios(const dcb: TDCB; var term: termios);
var
  n: integer;
  x: cardinal;
begin
  //others
  cfmakeraw(term);
  term.c_cflag := term.c_cflag or CREAD;
  term.c_cflag := term.c_cflag or CLOCAL;
  term.c_cflag := term.c_cflag or HUPCL;
  //hardware handshake
  if (dcb.flags and dcb_RtsControlHandshake) > 0 then
    term.c_cflag := term.c_cflag or CRTSCTS
  else
    term.c_cflag := term.c_cflag and (not CRTSCTS);
  //software handshake
  if (dcb.flags and dcb_OutX) > 0 then
    term.c_iflag := term.c_iflag or IXON or IXOFF or IXANY
  else
    term.c_iflag := term.c_iflag and (not (IXON or IXOFF or IXANY));
  //size of byte
  term.c_cflag := term.c_cflag and (not CSIZE);
  case dcb.bytesize of
    5:
      term.c_cflag := term.c_cflag or CS5;
    6:
      term.c_cflag := term.c_cflag or CS6;
    7:
      term.c_cflag := term.c_cflag or CS7fix;
    8:
      term.c_cflag := term.c_cflag or CS8;
  end;
  //parity
  if (dcb.flags and dcb_ParityCheck) > 0 then
    term.c_cflag := term.c_cflag or PARENB
  else
    term.c_cflag := term.c_cflag and (not PARENB);
  case dcb.parity of
    1: //'O'
      term.c_cflag := term.c_cflag and PARODD;
    2: //'E'
      term.c_cflag := term.c_cflag and (not PARODD);
  end;
  //stop bits
  if dcb.stopbits > 0 then
    term.c_cflag := term.c_cflag or CSTOPB
  else
    term.c_cflag := term.c_cflag and (not CSTOPB);
  //set baudrate;
  x := 0;
  for n := 0 to Maxrates do
    if rates[n, 0] = dcb.BaudRate then
    begin
      x := rates[n, 1];
      break;
    end;
  cfsetospeed(term, x);
  cfsetispeed(term, x);
end;

procedure TBlockSerial.TermiosToDcb(const term: termios; var dcb: TDCB);
var
  n: integer;
  x: cardinal;
begin
  //set baudrate;
  dcb.baudrate := 0;
  x := cfgetospeed(term);
  for n := 0 to Maxrates do
    if rates[n, 1] = x then
    begin
      dcb.baudrate := rates[n, 0];
      break;
    end;
  //hardware handshake
  if (term.c_cflag and CRTSCTS) > 0 then
    dcb.flags := dcb.flags or dcb_RtsControlHandshake or dcb_OutxCtsFlow
  else
    dcb.flags := dcb.flags and (not (dcb_RtsControlHandshake or dcb_OutxCtsFlow));
  //software handshake
  if (term.c_cflag and IXOFF) > 0 then
    dcb.flags := dcb.flags or dcb_OutX or dcb_InX
  else
    dcb.flags := dcb.flags and (not (dcb_OutX or dcb_InX));
  //size of byte
  case term.c_cflag and CSIZE of
    CS5:
      dcb.bytesize := 5;
    CS6:
      dcb.bytesize := 6;
    CS7fix:
      dcb.bytesize := 7;
    CS8:
      dcb.bytesize := 8;
  end;
  //parity
  if (term.c_cflag and PARENB) > 0 then
    dcb.flags := dcb.flags or dcb_ParityCheck
  else
    dcb.flags := dcb.flags and (not dcb_ParityCheck);
  dcb.parity := 0;
  if (term.c_cflag and PARODD) > 0 then
    dcb.parity := 1
  else
    dcb.parity := 2;
  //stop bits
  if (term.c_cflag and CSTOPB) > 0 then
    dcb.stopbits := 2
  else
    dcb.stopbits := 0;
end;
{$ENDIF}

{$IFDEF LINUX}
procedure TBlockSerial.SetCommState;
begin
  DcbToTermios(dcb, termiosstruc);
  SerialCheck(tcsetattr(integer(FHandle), TCSANOW, termiosstruc));
  ExceptCheck;
end;
{$ELSE}
procedure TBlockSerial.SetCommState;
begin
  SerialCheck(integer(windows.SetCommState(Fhandle, dcb)));
  ExceptCheck;
end;
{$ENDIF}

{$IFDEF LINUX}
procedure TBlockSerial.GetCommState;
begin
  SerialCheck(tcgetattr(integer(FHandle), termiosstruc));
  ExceptCheck;
  TermiostoDCB(termiosstruc, dcb);
end;
{$ELSE}
procedure TBlockSerial.GetCommState;
begin
  SerialCheck(integer(windows.GetCommState(Fhandle, dcb)));
  ExceptCheck;
end;
{$ENDIF}

procedure TBlockSerial.SetSizeRecvBuffer(size: integer);
begin
{$IFNDEF LINUX}
  SetupComm(Fhandle, size, 0);
  GetCommState;
  dcb.XonLim := size div 4;
  dcb.XoffLim := size div 4;
  SetCommState;
{$ENDIF}
  FRecvBuffer := size;
end;

function TBlockSerial.GetDSR: Boolean;
begin
  ModemStatus;
{$IFDEF LINUX}
  Result := (FModemWord and TIOCM_DSR) > 0;
{$ELSE}
  Result := (FModemWord and MS_DSR_ON) > 0;
{$ENDIF}
end;

procedure TBlockSerial.SetDTRF(Value: Boolean);
begin
{$IFDEF LINUX}
  ModemStatus;
  if Value then
    FModemWord := FModemWord or TIOCM_DTR
  else
    FModemWord := FModemWord and not TIOCM_DTR;
  ioctl(integer(FHandle), TIOCMSET, @FModemWord);
{$ELSE}
  if Value then
    EscapeCommFunction(FHandle, SETDTR)
  else
    EscapeCommFunction(FHandle, CLRDTR);
{$ENDIF}
end;

function TBlockSerial.GetCTS: Boolean;
begin
  ModemStatus;
{$IFDEF LINUX}
  Result := (FModemWord and TIOCM_CTS) > 0;
{$ELSE}
  Result := (FModemWord and MS_CTS_ON) > 0;
{$ENDIF}
end;

procedure TBlockSerial.SetRTSF(Value: Boolean);
begin
{$IFDEF LINUX}
  ModemStatus;
  if Value then
    FModemWord := FModemWord or TIOCM_RTS
  else
    FModemWord := FModemWord and not TIOCM_RTS;
  ioctl(integer(FHandle), TIOCMSET, @FModemWord);
{$ELSE}
  if Value then
    EscapeCommFunction(FHandle, SETRTS)
  else
    EscapeCommFunction(FHandle, CLRRTS);
{$ENDIF}
end;

function TBlockSerial.GetCarrier: Boolean;
begin
  ModemStatus;
{$IFDEF LINUX}
  Result := (FModemWord and TIOCM_CAR) > 0;
{$ELSE}
  Result := (FModemWord and MS_RLSD_ON) > 0;
{$ENDIF}
end;

function TBlockSerial.GetRing: Boolean;
begin
  ModemStatus;
{$IFDEF LINUX}
  Result := (FModemWord and TIOCM_RNG) > 0;
{$ELSE}
  Result := (FModemWord and MS_RING_ON) > 0;
{$ENDIF}
end;

{$IFNDEF LINUX}
function TBlockSerial.CanEvent(Event: dword; Timeout: integer): boolean;
var
  ex: DWord;
  y: Integer;
  Overlapped: TOverlapped;
begin
  FillChar(Overlapped, Sizeof(Overlapped), 0);
  ResetEvent(FEventHandle);
  Overlapped.hEvent := FEventHandle;
  SetCommMask(FHandle, Event);
  y := integer(WaitCommEvent(FHandle, ex, @Overlapped));
  if (y = 0) or (y = integer(INVALID_HANDLE_VALUE)) then
    FLastError := GetLastError;
  if FLastError = ERROR_IO_PENDING then
  begin
    WaitForSingleObject(FEventHandle, Timeout);
    GetOverlappedResult(FHandle, Overlapped, DWord(y), False);
    if GetLastError = ERROR_IO_INCOMPLETE then
      CancelIO(FHandle);
    ResetEvent(FEventHandle);
    FLastError := 0;
  end;
  Result := (ex and Event) = Event;
  SetCommMask(FHandle, 0);
end;
{$ENDIF}

{$IFDEF LINUX}
function TBlockSerial.CanRead(Timeout: integer): boolean;
var
  FDSet: TFDSet;
  TimeVal: PTimeVal;
  TimeV: TTimeVal;
  x: Integer;
begin
  TimeV.tv_usec := (Timeout mod 1000) * 1000;
  TimeV.tv_sec := Timeout div 1000;
  TimeVal := @TimeV;
  if Timeout = -1 then
    TimeVal := nil;
  FD_ZERO(FDSet);
  FD_SET(integer(FHandle), FDSet);
  x := Select(integer(FHandle) + 1, @FDSet, nil, nil, TimeVal);
  SerialCheck(x);
  if FLastError <> 0 then
    x := 0;
  Result := x > 0;
  ExceptCheck;
  if Result then
    DoStatus(HR_CanRead, '');
end;
{$ELSE}
function TBlockSerial.CanRead(Timeout: integer): boolean;
begin
  Result := WaitingData > 0;
  if not Result then
    Result := CanEvent(EV_RXCHAR, Timeout);
  if Result then
    DoStatus(HR_CanRead, '');
end;
{$ENDIF}

{$IFDEF LINUX}
function TBlockSerial.CanWrite(Timeout: integer): boolean;
var
  FDSet: TFDSet;
  TimeVal: PTimeVal;
  TimeV: TTimeVal;
  x: Integer;
begin
  TimeV.tv_usec := (Timeout mod 1000) * 1000;
  TimeV.tv_sec := Timeout div 1000;
  TimeVal := @TimeV;
  if Timeout = -1 then
    TimeVal := nil;
  FD_ZERO(FDSet);
  FD_SET(integer(FHandle), FDSet);
  x := Select(integer(FHandle) + 1, nil, @FDSet, nil, TimeVal);
  SerialCheck(x);
  if FLastError <> 0 then
    x := 0;
  Result := x > 0;
  ExceptCheck;
  if Result then
    DoStatus(HR_CanWrite, '');
end;
{$ELSE}
function TBlockSerial.CanWrite(Timeout: integer): boolean;
begin
  Result := SendingData = 0;
  if not Result then
	  Result := CanEvent(EV_TXEMPTY, Timeout);
  if Result then
    DoStatus(HR_CanWrite, '');
end;
{$ENDIF}

function TBlockSerial.CanReadEx(Timeout: integer): boolean;
begin
	if Fbuffer<>'' then
  	Result := True
  else
  	Result := CanRead(Timeout);
end;

procedure TBlockSerial.EnableRTSToggle(Value: boolean);
begin
{$IFDEF LINUX}
  EnableSoftRTSToggle(Value);
{$ELSE}
  GetCommState;
  if value
    then dcb.Flags := dcb.Flags or dcb_RtsControlToggle
  else
    dcb.flags := dcb.flags and (not dcb_RtsControlToggle);
  SetCommState;
{$ENDIF}
end;

procedure TBlockSerial.EnableSoftRTSToggle(Value: boolean);
begin
  FRTSToggle := Value;
end;

procedure TBlockSerial.Flush;
begin
{$IFDEF LINUX}
  SerialCheck(tcdrain(integer(FHandle)));
{$ELSE}
  SerialCheck(integer(Flushfilebuffers(FHandle)));
{$ENDIF}
  ExceptCheck;
end;

{$IFDEF LINUX}
procedure TBlockSerial.Purge;
begin
  SerialCheck(ioctl(integer(FHandle), TCFLSH, TCIOFLUSH));
  FBuffer := '';
  ExceptCheck;
end;
{$ELSE}
procedure TBlockSerial.Purge;
var
  x: integer;
begin
  x := PURGE_TXABORT or PURGE_TXCLEAR or PURGE_RXABORT or PURGE_RXCLEAR;
  SerialCheck(integer(PurgeComm(FHandle, x)));
  FBuffer := '';
  ExceptCheck;
end;
{$ENDIF}

function TBlockSerial.ModemStatus: integer;
begin
{$IFDEF LINUX}
  SerialCheck(ioctl(integer(FHandle), TIOCMGET, @Result));
{$ELSE}
  SerialCheck(integer(GetCommModemStatus(FHandle, dword(Result))));
{$ENDIF}
  ExceptCheck;
  FModemWord := Result;
end;

procedure TBlockSerial.SetBreak(Duration: integer);
begin
{$IFDEF LINUX}
  SerialCheck(tcsendbreak(integer(FHandle), Duration));
{$ELSE}
  SetCommBreak(FHandle);
  Sleep(Duration);
  SerialCheck(integer(ClearCommBreak(FHandle)));
{$ENDIF}
end;

{$IFNDEF LINUX}
procedure TBlockSerial.DecodeCommError(Error: DWord);
begin
  if (Error and DWord(CE_FRAME)) > 1 then
    FLastError := ErrFrame;
  if (Error and DWord(CE_OVERRUN)) > 1 then
    FLastError := ErrOverrun;
  if (Error and DWord(CE_RXOVER)) > 1 then
    FLastError := ErrRxOver;
  if (Error and DWord(CE_RXPARITY)) > 1 then
    FLastError := ErrRxParity;
  if (Error and DWord(CE_TXFULL)) > 1 then
    FLastError := ErrTxFull;
end;
{$ENDIF}

function TBlockSerial.PreTestFailing: Boolean; {HGJ}
begin                                          {HGJ}
  if not FInstanceActive then                  {HGJ}
  begin
    ErrorMethod(ErrPortNotOpen);               {HGJ}
    result:= true;                             {HGJ}
    Exit;                                      {HGJ}
  end;                                         {HGJ}
  Result := not TestCtrlLine;
  if result then
    ErrorMethod(ErrNoDeviceAnswer)             {HGJ}
end;

function TBlockSerial.TestCtrlLine: Boolean;
begin
  result := ((not FTestDSR) or DSR) and ((not FTestCTS) or CTS);
end;

function TBlockSerial.ATCommand(value: string): string;
var
  s: string;
begin
  result := '';
  SendString(value + #$0D);
  repeat
    s := RecvTerminated(1000, #$0D);
    if s <> '' then
      if s[1] = #$0a then
        s := Copy(s, 2, Length(s) - 1);
    if (s <> value) and (s <> value + #$0d) then
      result := result + s + #$0D + #$0A;
    if s = 'OK' then
      break;
    if s = 'ERROR' then
      break;
  until FLastError <> 0;
end;

function TBlockSerial.SerialCheck(SerialResult: integer): integer;
begin
  if SerialResult = integer(INVALID_HANDLE_VALUE) then
    result := GetLastError
  else
    result := 0;
  FLastError := result;
end;

procedure TBlockSerial.ExceptCheck;
var
  e: ESynaSerError;
  s: string;
begin
  if FRaiseExcept and (FLastError <> 0) then
  begin
    s := GetErrorDesc(LastError);
    e := ESynaSerError.CreateFmt('Communication error %d: %s', [LastError, s]);
    e.ErrorCode := FLastError;
    e.ErrorMessage := s;
    raise e;
  end;
end;

procedure TBlockSerial.ErrorMethod(ErrNumber: integer);
begin
  FLastError := ErrNumber;
  ExceptCheck;
end;

procedure TBlockSerial.DoStatus(Reason: THookSerialReason; const Value: string);
begin
  if assigned(OnStatus) then
    OnStatus(Self, Reason, Value);
end;

{======================================================================}

{$IFDEF LINUX}
class function TBlockSerial.GetErrorDesc(ErrorCode: integer): string;
begin
  case ErrorCode of
    ErrAlreadyOwned:   Result:= 'Port owned by other process';{HGJ}
    ErrAlreadyInUse:   Result:= 'Instance already in use';    {HGJ}
    ErrWrongParameter: Result:= 'Wrong paramter at call';     {HGJ}
    ErrPortNotOpen:    Result:= 'Instance not yet connected'; {HGJ}
    ErrNoDeviceAnswer: Result:= 'No device answer detected';  {HGJ}
    ErrMaxBuffer:      Result:= 'Maximal buffer length exceeded';
    ErrTimeout:        Result:= 'Timeout during operation';
    ErrNotRead:        Result:= 'Reading of data failed';
    ErrFrame:          Result:= 'Receive framing error';
    ErrOverrun:        Result:= 'Receive Overrun Error';
    ErrRxOver:         Result:= 'Receive Queue overflow';
    ErrRxParity:       Result:= 'Receive Parity Error';
    ErrTxFull:         Result:= 'Tranceive Queue is full';
  else
    Result := 'SynaSer error: ' + IntToStr(ErrorCode);
  end;
end;
{$ELSE}
class function TBlockSerial.GetErrorDesc(ErrorCode: integer): string;
var
  x: integer;
begin
  Result:= '';
  case ErrorCode of
    ErrAlreadyOwned:   Result:= 'Port owned by other process';{HGJ}
    ErrAlreadyInUse:   Result:= 'Instance already in use';    {HGJ}
    ErrWrongParameter: Result:= 'Wrong paramter at call';     {HGJ}
    ErrPortNotOpen:    Result:= 'Instance not yet connected'; {HGJ}
    ErrNoDeviceAnswer: Result:= 'No device answer detected';  {HGJ}
    ErrMaxBuffer:      Result:= 'Maximal buffer length exceeded';
    ErrTimeout:        Result:= 'Timeout during operation';
    ErrNotRead:        Result:= 'Reading of data failed';
    ErrFrame:          Result:= 'Receive framing error';
    ErrOverrun:        Result:= 'Receive Overrun Error';
    ErrRxOver:         Result:= 'Receive Queue overflow';
    ErrRxParity:       Result:= 'Receive Parity Error';
    ErrTxFull:         Result:= 'Tranceive Queue is full';
  end;
  if Result = '' then
  begin
    setlength(result, 1023);
    x := Formatmessage(FORMAT_MESSAGE_FROM_SYSTEM, nil, ErrorCode, 0, pchar(result), 1023, nil);
    result := copy(result, 1, x);
    if (Result <> '') then
      if Pos(#$0d+#$0a, Result) = (Length(Result) - 1) then
        Result := Copy(Result, 1, Length(Result) - 2);
  end;
end;
{$ENDIF}


{---------- cpom Comport Ownership Manager Routines -------------
 by Hans-Georg Joepgen of Stuttgart, Germany.
 Copyright (c) 2002, by Hans-Georg Joepgen

  Stefan Krauss of Stuttgart, Germany, contributed literature and Internet
  research results, invaluable advice and excellent answers to the Comport
  Ownership Manager.
}

{$IFDEF LINUX}

function TBlockSerial.LockfileName: String;
begin
  result := LockfileDirectory + '/LCK..ttyS' + IntToStr(FComNr);
end;

procedure TBlockSerial.CreateLockfile(PidNr: integer);
var
  f: TextFile;
  s: string;
begin
  // Create content for file
  s := IntToStr(PidNr);
  while length(s) < 10 do
    s := ' ' + s;
  // Create file
  AssignFile(f, LockfileName);
  Rewrite(f);
  writeln(f, s);
  CloseFile(f);
  // Allow all users to enjoy the benefits of cpom
  s := 'chmod a+rw ' + LockfileName;
  Libc.system(pchar(s));
end;

function TBlockSerial.ReadLockfile: integer;
{Returns PID from Lockfile. Lockfile must exist.}
var
  f: TextFile;
  s: string;
begin
  AssignFile(f, LockfileName);
  Reset(f);
  readln(f, s);
  CloseFile(f);
  Result := StrToIntDef(s, -1)
end;

function TBlockSerial.cpomComportAccessible: boolean;
var
  MyPid: integer;
  Filename: string;
begin
  Filename := LockfileName;
  MyPid := Libc.getpid;
  // Make sure, the Lock Files Directory exists. We need it.
  if not DirectoryExists(LockfileDirectory) then
    MkDir(LockfileDirectory);
  // Check the Lockfile
  if not FileExists (Filename) then
  begin // comport is not locked. Lock it for us.
    CreateLockfile(MyPid);
    result := true;
    exit;  // done.
  end;
  // Is port owned by orphan? Then it's time for error recovery.
  if Libc.getsid(ReadLockfile) = -1 then
  begin //  Lockfile was left from former desaster
    DeleteFile(Filename); // error recovery
    CreateLockfile(MyPid);
    result := true;
    exit;
  end;
  result := false // Sorry, port is owned by living PID and locked
end;

procedure TBlockSerial.cpomReleaseComport;
begin
  DeleteFile(LockfileName);
end;

{$ENDIF}
{----------------------------------------------------------------}


end.
