#ifndef _FAT16_H_INCLUDED
#define _FAT16_H_INCLUDED

#define MAXDIRENTRIES 8

typedef struct
{
    unsigned long sector;
    unsigned long index;
} entryTYPE;

typedef struct
{
    char name[11];                 /* name of file */
    unsigned char attributes;      /* file attributes */
    entryTYPE     entry;           /* file entry location */
    unsigned long sector;          /* sector index in file */
    unsigned long size;            /* file size */
    unsigned long cluster;         /* current cluster */
    unsigned long start_cluster;   /* first cluster of file */
    char          long_name[261];
} fileTYPE;

typedef struct
{
    unsigned char       Name[8];            /* filename, blank filled */
#define SLOT_EMPTY      0x00                /* slot has never been used */
#define SLOT_E5         0x05                /* the real value is 0xe5 */
#define SLOT_DELETED    0xe5                /* file in this slot deleted */
    unsigned char       Extension[3];       /* extension, blank filled */
    unsigned char       Attributes;         /* file attributes */
#define ATTR_NORMAL     0x00                /* normal file */
#define ATTR_READONLY   0x01                /* file is readonly */
#define ATTR_HIDDEN     0x02                /* file is hidden */
#define ATTR_SYSTEM     0x04                /* file is a system file */
#define ATTR_VOLUME     0x08                /* entry is a volume label */
#define ATTR_DIRECTORY  0x10                /* entry is a directory name */
#define ATTR_ARCHIVE    0x20                /* file is new or modified */
#define ATTR_LFN        0x0F                /* long file name entry */
    unsigned char       LowerCase;          /* NT VFAT lower case flags */
#define LCASE_BASE      0x08                /* filename base in lower case */
#define LCASE_EXT       0x10                /* filename extension in lower case */
    unsigned char       CreateHundredth;    /* hundredth of seconds in CTime */
    unsigned short      CreateTime;         /* create time */
    unsigned short      CreateDate;         /* create date */
    unsigned short      AccessDate;         /* access date */
    unsigned short      HighCluster;        /* high bytes of cluster number */
    unsigned short      ModifyTime;         /* last update time */
    unsigned short      ModifyDate;         /* last update date */
    unsigned short      StartCluster;       /* starting cluster of file */
    unsigned long       FileSize;           /* size of file in bytes */
} DIRENTRY;

typedef union {
    unsigned short fat16[256];
    unsigned long  fat32[256];
} FATBUFFER;

#define FILETIME(h,m,s) (((h<<11)&0xF800)|((m<<5)&0x7E0)|((s/2)&0x1F))
#define FILEDATE(y,m,d) ((((y-1980)<<9)&0xFE00)|((m<<5)&0x1E0)|(d&0x1F))

// global sector buffer, data for read/write actions is stored here.
// BEWARE, this buffer is also used and thus trashed by all other functions
extern unsigned char sector_buffer[512]; // sector buffer
extern unsigned char cluster_size;
extern unsigned long cluster_mask;
extern unsigned char fat32;

// constants
#define DIRECTORY_ROOT 0

// file seeking
#define SEEK_SET  0
#define SEEK_CUR  1

// scanning flags
#define SCAN_INIT  0       // start search from beginning of directory
#define SCAN_NEXT  1       // find next file in directory
#define SCAN_PREV -1       // find previous file in directory
#define SCAN_NEXT_PAGE   2 // find next 8 files in directory
#define SCAN_PREV_PAGE  -2 // find previous 8 files in directory
#define SCAN_INIT_FIRST  3 // search for an entry with given cluster number
#define SCAN_INIT_NEXT   4 // search for entries higher than the first one

// options flags
#define SCAN_DIR   1 // include subdirectories
#define SCAN_LFN   2 // include long file names
#define FIND_DIR   4 // find first directory beginning with given charater
#define FIND_FILE  8 // find first file entry beginning with given charater


// functions
unsigned char FindDrive(void);
unsigned long GetFATLink(unsigned long cluster);
unsigned char FileNextSector(fileTYPE *file);
unsigned char FileOpen(fileTYPE *file, char *name);
unsigned char FileSeek(fileTYPE *file, unsigned long offset, unsigned long origin);
unsigned char FileRead(fileTYPE *file, unsigned char *pBuffer);
unsigned char FileWrite(fileTYPE *file, unsigned char *pBuffer);
unsigned char FileReadEx(fileTYPE *file, unsigned char *pBuffer, unsigned long nSize);

unsigned char FileCreate(unsigned long iDirectory, fileTYPE *file);
unsigned char UpdateEntry(fileTYPE *file);

char ScanDirectory(unsigned long mode, char *extension, unsigned char options);
void ChangeDirectory(unsigned long iStartCluster);

#endif

