
#include "stringlight.h"

void _strncpySpace(char* pStr1, const char* pStr2, unsigned long nCount)
{
// customized strncpy() function to fill remaing destination string part with spaces

    while (*pStr2 && nCount)
    {
        *pStr1++ = *pStr2++; // copy strings
        nCount--;
    }

    while (nCount--)
        *pStr1++ = ' '; // fill remaining space with spaces

}

// safe, copies bufsize-1 max and adds terminator
void _strlcpy(char* dst, const char* src, unsigned long bufsize)
{
  unsigned long srclen =strlen(src);
  unsigned long result =srclen; /* Result is always the length of the src string */
  if(bufsize>0)
  {
    if(srclen>=bufsize)
       srclen=bufsize-1;
    if(srclen>0)
       memcpy(dst,src,srclen);
    dst[srclen]='\0';
  }
  //return result;
}
/*
int _strnicmp(const char *pS1, const char *pS2, unsigned long n)
{
    char c1, c2;
    int v;

    do
    {
        c1 = *pS1++;
        c2 = *pS2++;
        v = (unsigned int)tolower(c1) - (unsigned int)tolower(c2);
    }
    while ((v == 0) && (c1 != '\0') && (c2 != '\0') && (--n > 0));

    return v;
}
*/
