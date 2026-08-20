#include "main_02009BE8.h"

void sub_02009BE8(u32 value, s32 flag)
{
    u32 v = (*(vu16 *) 0x0400004A & ~0x3F00) | (value << 8);

    if (flag != 0) {
        v |= 0x2000;
    }

    *(vu16 *) 0x0400004A = v;
}

void sub_02009C10(u32 value, s32 flag)
{
    u32 v = (*(vu16 *) 0x0400004A & ~0x3F) | (value);

    if (flag != 0) {
        v |= 0x20;
    }

    *(vu16 *) 0x0400004A = v;
}

void sub_02009C38(u32 value)
{
    *(vu16 *) 0x0400000A = (*(vu16 *) 0x0400000A & ~3) | value;
}

void sub_02009C54(u32 value)
{
    *(vu16 *) 0x04000008 = (*(vu16 *) 0x04000008 & ~3) | value;
}

void sub_02009C70(u32 value)
{
    *(vu16 *) 0x0400000C = (*(vu16 *) 0x0400000C & ~3) | value;
}

void sub_02009C8C(u32 value)
{
    *(vu16 *) 0x0400000E = (*(vu16 *) 0x0400000E & ~3) | value;
}

void sub_02009CA8(u32 value, s32 flag)
{
    u32 v = (*(vu16 *) 0x04001048 & ~0x3F) | (value);

    if (flag != 0) {
        v |= 0x20;
    }

    *(vu16 *) 0x04001048 = v;
}

void sub_02009CD0(u32 value, s32 flag)
{
    u32 v = (*(vu16 *) 0x04001048 & ~0x3F00) | (value << 8);

    if (flag != 0) {
        v |= 0x2000;
    }

    *(vu16 *) 0x04001048 = v;
}

void sub_02009CF8(u32 value, s32 flag)
{
    u32 v = (*(vu16 *) 0x0400104A & ~0x3F00) | (value << 8);

    if (flag != 0) {
        v |= 0x2000;
    }

    *(vu16 *) 0x0400104A = v;
}

void sub_02009D20(u32 value, s32 flag)
{
    u32 v = (*(vu16 *) 0x0400104A & ~0x3F) | (value);

    if (flag != 0) {
        v |= 0x20;
    }

    *(vu16 *) 0x0400104A = v;
}
