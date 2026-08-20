#include "main_0201BFF0.h"

void CopyAndInterleave(void *dst, void *src, s32 len);

void CopyAndInterleaveWrapper(void* dst, void* src, s32 len)
{
    CopyAndInterleave(dst, src, len >> 1);
}
