#include "main_020251AC.h"

void SetQuestionMarks(char *s)
{
    #ifdef JAPAN
        s[0]=0xf;
        s[1]=0xf;
        s[2]=0xf;
    #else
        s[0]=0x3f;
        s[1]=0x3f;
        s[2]=0x3f;
    #endif
    s[3]=0;
}

void StrcpySimple(unsigned char* dest, const unsigned char* src)
{
    unsigned char* dest_tmp;
    do {
        dest_tmp = dest;
        *dest++ = *src++;
    } while (*dest_tmp!=0);
}

void StrncpySimple(unsigned char* dest, const unsigned char* src, s32 n)
{
    s32 bytes_copied = 0;
    unsigned char* dest_tmp;
    while (bytes_copied < n) {
        dest_tmp = dest;
        *dest++ = *src++;
        if (*dest_tmp == 0) {
            bytes_copied+=1;
            while (bytes_copied < n) {
                *dest++=0;
                bytes_copied+=1;
            }
            return;
        }
        bytes_copied++;
    }
}

void StrncpySimpleNoPad(unsigned char* dest, const unsigned char* src, s32 n)
{
    s32 bytes_copied = 0;
    unsigned char* dest_tmp;
    while (bytes_copied < n) {
        dest_tmp = dest;
        *dest++ = *src++;
        if (*dest_tmp == 0) {
            return;
        }
        bytes_copied++;
    }
    *dest=0;
}

int StrncmpSimple(const unsigned char* s1, const unsigned char* s2, s32 n)
{
    s32 bytes_compared = 0;
    do {
        unsigned char c1 = *(s1+bytes_compared);
        unsigned char c2 = *(s2+bytes_compared);
        bytes_compared++;
        if (c1!=c2) {
            if (c1<c2) {
                return -1;
            } else {
                return 1;
            }
        } else {
            if (c1==0) {
                return 0;
            }
        }
    } while (bytes_compared < n);
    return 0;
}
