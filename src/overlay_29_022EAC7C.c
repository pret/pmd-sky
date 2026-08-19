#include "overlay_29_022EAC7C.h"

extern void sub_02017C50(s32 id);
extern void sub_02017C74(s32, s32);

void PlayLevelUpSound(void)
{
    sub_02017C50(1);
}

void PlayDungeonTipSound__022EB63C(void)
{
    sub_02017C50(7);
}

void ov29_022EAC9C(void)
{
    sub_02017C50(0);
}

void ov29_022EACAC(void)
{
    sub_02017C50(5);
}

void PlayDungeonTipSound__022EB66C(void)
{
    sub_02017C50(7);
}

void PlaySeByIdIfNotSilence(s32 id)
{
    if (id == 0x3F00) {
        return;
    }

    sub_02017C74(id, 0x100);
}

void PlayMeByIdIfNot998(s32 id)
{
    if (id == 998) {
        return;
    }

    sub_02017C50(id);
}
