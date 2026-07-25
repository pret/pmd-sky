#include <nitro.h>

#ifndef SDK_FINALROM
    char * Std_CopyString (char * destp, const char * srcp)
    {
        char * retval = destp;

        SDK_ASSERT(destp && srcp);

        while (*srcp) {
            *destp++ = (char)*srcp++;
        }

        *destp = '\0';

        return retval;
    }

    int Std_CopyLStringZeroFill (char * destp, const char * srcp, int n)
    {
        int i;
        const char * s = srcp;

        SDK_ASSERT(destp && srcp && n >= 0);

        for (i = 0; i < n - 1; i++) {
            destp[i] = (char)*s;
            if (*s) {
                s++;
            }
        }

        destp[i] = '\0';

        return Std_GetStringLength(srcp);
    }
#endif

int Std_CopyLString (char * destp, const char * srcp, int siz)
{
    int i;
    const char * s = srcp;

    SDK_ASSERT(destp && srcp && siz >= 0);

    for (i = 0; i < siz - 1; i++) {
        destp[i] = (char)*s;
        if (*s) {
            s++;
        } else {
            break;
        }
    }

    if ((i >= siz - 1) && (siz != 0)) {
        destp[i] = '\0';
    }

    return Std_GetStringLength(srcp);
}

#ifndef SDK_FINALROM
    char * Std_SearchString (const char * srcp, const char * str)
    {
        int i;
        int n;

        SDK_ASSERT(srcp && str);

        for (i = 0; srcp[i]; i++) {
            n = 0;
            while (str[n] && srcp[i + n] == str[n]) {
                n++;
            }

            if (str[n] == '\0') {
                return (char *)&srcp[i];
            }
        }

        return NULL;
    }
#endif

int Std_GetStringLength (const char * str)
{
    int n = 0;
    while (str[n]) {
        n++;
    }
    return n;
}

#ifndef SDK_FINALROM
    char * Std_ConcatenateString (char * str1, const char * str2)
    {
        int n = Std_GetStringLength(str1);
        (void)Std_CopyString(&str1[n], str2);
        return str1;
    }
#endif

int Std_CompareString__020852CC (const char * str1, const char * str2)
{
    while (*str1 == *str2 && *str1) {
        str1++;
        str2++;
    }

    return (*str1 - *str2);
}

int Std_CompareNString (const char * str1, const char * str2, int len)
{
    if (len) {
        int i;
        for (i = 0; i < len; ++i) {
            int c = (int)(MI_ReadByte(str1 + i));
            int d = (int)(MI_ReadByte(str2 + i));
            if (c != d) {
                return (int)(c - d);
            }
        }
    }

    return 0;
}

#ifndef SDK_FINALROM
    int Std_CompareLString (const char * str1, const char * str2)
    {
        return Std_CompareNString(str1, str2, Std_GetStringLength(str2));
    }
#endif

SDK_WEAK_SYMBOL int Std_TsScanf (const char * src, const char * fmt, ...)
{
    int ret;
    va_list va;
    va_start(va, fmt);
    ret = Std_TvsScanf(src, fmt, va);
    va_end(va);
    return ret;
}
