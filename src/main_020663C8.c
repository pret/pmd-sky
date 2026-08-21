#include "main_020663C8.h"

extern void sub_02046D20(s32 a);

extern s32 sub_02046C78(s32 a);

extern void sub_02046C30(s32 a, s32 b, s32 c);

extern void sub_02046BE8(s32 a, s32 b, s32 c);

extern void sub_02046BA0(s32 a);

extern s32 sub_02046B04(s32 a);

extern void sub_02046A20(s32 a, s32 b, s32 c, s32 d, s32 e, s32 f, s32 g);

extern void sub_02046A9C(s32 a, s32 b, s32 c, s32 d, s32 e);

void sub_020663C8(s32 a, s32 b, s32 c, s32 d, s8 e)
{
    sub_02046A9C(a, b, c, d, e);
}

void sub_020663DC(s32 a, s32 b, s32 c, s32 d, s32 e, u16 f)
{
    sub_02046A20(a, b, c, d, e, f, 0);
}

void sub_02066408(s32 a, s32 b, s32 c, s32 d, s32 e, u16 f, s32 g)
{
    sub_02046A20(a, b, c, d, e, f, g);
}

s32 sub_02066434(s32 a)
{
    s32 r = sub_02046B04(a);

    if (r == -2) {
        return 0x1F;
    }

    if (r == -1) {
        return 0;
    }

    return r;
}

void sub_0206645C(s32 a)
{
    sub_02046BA0(a);
}

void sub_02066468(s32 a, s32 b)
{
    sub_02046BE8(a, b, 0);
}

void sub_02066478(s32 a, s32 b)
{
    sub_02046C30(a, b, 0);
}

void sub_02066488(s32 a, s32 b, s32 c)
{
    sub_02046BE8(a, b, c);
}

s32 sub_02066494(s32 a)
{
    if (sub_02046C78(a) != 0) {
        return 0x1F;
    }

    return 0;
}

void sub_020664AC(s32 a)
{
    sub_02046D20(a);
}
