#include "main_0206C0D8.h"

extern void sub_0207A8F4(s32 a, s32 b, s32 c);

extern void sub_0207A7EC(s32 a, s32 b, s32 c);

extern struct unk_020B0B70 _020B0B70;

extern s16 _020B0B6C;

extern u8 _020B0B74[8];

void sub_0206C0D8(s16 *out)
{
    *out = _020B0B6C;
}

void sub_0206C0EC(s16 v)
{
    _020B0B6C = v;
}

void sub_0206C0FC(s16 *out)
{
    *out = _020B0B70.field_0x2;
}

void sub_0206C110(s16 v)
{
    _020B0B70.field_0x2 = v;
}

void sub_0206C120(s16 *out)
{
    *out = _020B0B70.field_0x0;
}

void sub_0206C134(s16 v)
{
    _020B0B70.field_0x0 = v;
}

void sub_0206C144(u8 *dst)
{
    u8 *src = _020B0B74;
    u32 n = 8;

    do {
        *dst++ = *src++;
    } while (--n != 0);
}

void sub_0206C164(u8 *src)
{
    u8 *dst = _020B0B74;
    u32 n = 8;

    do {
        *dst++ = *src++;
    } while (--n != 0);
}

void sub_0206C184(s32 unused, s32 a)
{
    sub_0207A7EC(0, -1, a);
}

s32 sub_0206C19C(s32 unused, s32 a)
{
    sub_0207A8F4(0, -1, a);

    return a;
}
