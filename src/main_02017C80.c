#include "main_02017C80.h"
#include "main_0202AAA8.h"

extern u16 _0209915C[];

extern s16 _022A4BE8;

extern void sub_0201831C(s32 a, s32 b, s32 c, s32 d);

extern void sub_020183A0(s32 a, s32 b, s32 c);

extern void sub_020183E4(s32 a, s32 b, s32 c);

extern void sub_02018428(s32 a);

extern void sub_02018460(s32 a, s32 b, s32 c, s32 d);

void PlaySeByIdVolume(s32 se_id, s32 volume);

void PlaySeByIdVolumeWrapper(s32 se_id)
{
    PlaySeByIdVolume(se_id, 0x100);
}

void sub_02017C90(s32 a, s32 b, s32 c, s32 d)
{
    sub_0201831C(a, b, c, d);
}

void sub_02017C9C(s32 a, s32 b, s32 c)
{
    sub_020183A0(a, b, c);
}

void sub_02017CA8(s32 a, s32 b, s32 c)
{
    sub_020183E4(a, b, c);
}

void sub_02017CB4(s32 a)
{
    sub_02018428(a);
}

void sub_02017CC0(s32 a, s32 b, s32 c, s32 d)
{
    sub_02018460(a, b, c, d);
}

void PlaySeVolumeWrapper(s32 idx)
{
    PlaySeByIdVolume(_0209915C[idx], 0x100);
}

void sub_02017CEC(void)
{
    if (_022A4BE8 > 0) {
        return;
    }

    _022A4BE8 = 3;
    PlaySeByIdVolume(0x3F05, 0x100);
}
