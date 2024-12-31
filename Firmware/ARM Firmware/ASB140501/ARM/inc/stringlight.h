#ifndef STRINGLIGHT_H_INCLUDED
#define STRINGLIGHT_H_INCLUDED

#include "board.h"
// the aim is to get rid of these
#include <ctype.h>
#include <string.h>
//

void _strncpySpace(char* pStr1, const char* pStr2, unsigned long nCount);
void _strlcpy(char* dst, const char* src, unsigned long bufsize);
// int  _strnicmp(const char *pS1, const char *pS2, unsigned long n);

#endif
