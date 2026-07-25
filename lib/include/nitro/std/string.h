#ifndef NITRO_STD_STRING_H_
#define NITRO_STD_STRING_H_

#include <stdarg.h>

#ifdef __cplusplus
extern "C" {
#endif

#include <nitro/misc.h>
#include <nitro/types.h>

#define STD_StrCpy     Std_CopyString
#define STD_StrLCpy    Std_CopyLString
#define STD_StrStr     Std_SearchString
#define STD_StrLen     Std_GetStringLength
#define STD_StrCat     Std_ConcatenateString
#define STD_StrCmp     Std_CompareString__020852CC
#define STD_StrNCmp    Std_CompareNString
#define STD_StrLCmp    Std_CompareLString

extern char * Std_CopyString(char * destp, const char * srcp);
extern int Std_CopyLStringZeroFill(char * destp, const char * srcp, int n);
extern int Std_CopyLString(char * destp, const char * srcp, int siz);
extern char * Std_SearchString(const char * srcp, const char * str);
extern int Std_GetStringLength(const char * str);
extern char * Std_ConcatenateString(char * str1, const char * str2);
extern int Std_CompareString__020852CC(const char * str1, const char * str2);
extern int Std_CompareNString(const char * str1, const char * str2, int len);
extern int Std_CompareLString(const char * str1, const char * str2);
extern int Std_TsScanf(const char * src, const char * fmt, ...);
extern int Std_TvsScanf(const char * src, const char * fmt, va_list vlist);
extern int Std_TSPrintf(char * dst, const char * fmt, ...);
// extern int Std_TVSPrintf(char * dst, const char * fmt, va_list vlist);
// extern int Std_TSNPrintf(char * dst, size_t len, const char * fmt, ...);
// extern int Std_TVSNPrintf(char * dst, size_t len, const char * fmt, va_list vlist);

#ifdef __cplusplus
}
#endif

#endif
