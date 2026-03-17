#include "main_02059A74.h"

extern u32 _020A3498[];

extern void sub_02050974(void *v0, u32 v1, u32 v2);
extern void sub_02059824(void *v0, u32 v1);
extern void sub_020509BC(void *v0);
extern void sub_020584F8(void *v0);
extern void CopyBitsFrom(void *read_info, void *buf_read, s32 nbits);
extern void CopyBitsTo(void *ctx, void *src, s32 nbits);

u32 sub_02059A74(u32 a, u32 b)
{
    u32 obj1[4];
    u32 obj2[2];

    sub_02050974(obj1, a, b);
    sub_02059824(obj1, 0);
    sub_02059824(obj1, 1);
    sub_02059824(obj1, 2);
    sub_020509BC(obj1);

    obj2[1] = _020A3498[2];
    obj2[0] = _020A3498[1];

    sub_020584F8(obj2);

    return obj1[2];
}

void sub_02059AE8(void *p0, void *p1)
{
    CopyBitsFrom(p0, p1, 7);
}

void sub_02059AF8(void *dest, void *src)
{
    CopyBitsTo(dest, src, 7);
}
