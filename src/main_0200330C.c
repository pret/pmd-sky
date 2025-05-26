#include "main_0200330C.h"

void ZInit8(int* ptr)
{
    ptr[0]=0;
    ptr[1]=0;
}

u8 PointsToZero(int* ptr)
{
    if (*ptr == 0) {
        return 1;
    } else {
        return 0;
    }
}

void MemZero(u8* ptr, s32 len) {
    while (len>0) {
        len-=1;
        *ptr++=0;
    }
}

void MemZero16(u16* ptr, s32 len) {
    while (len>0) {
        len-=2;
        *ptr++=0;
    }
}

void MemZero32(u32* ptr, s32 len) {
    while (len>0) {
        len-=4;
        *ptr++=0;
    }
}

void MemsetSimple(u8* ptr, u8 val, s32 len) {
    while (len>0) {
        len--;
        *ptr++=val;
    }
}

void Memset32(u32* ptr, u32 val, s32 len) {
    while (len>0) {
        len-=4;
        *ptr++=val;
    }
}

void MemcpySimple(u8* dest, u8* src, s32 n)
{
    while (n>0) {
        *dest++ = *src++;
        n -= 1;
    }
}

void Memcpy16(u16* dest, u16* src, s32 n)
{
    while (n>0) {
        *dest++ = *src++;
        n -= 2;
    }
}

void Memcpy32(u32* dest, u32* src, s32 n)
{
    while (n>0) {
        *dest++ = *src++;
        n -= 4;
    }
}
