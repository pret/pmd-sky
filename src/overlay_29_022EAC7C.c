#include "overlay_29_022EAC7C.h"


#include "dg_random.h"
extern u16 MUSIC_ID_TABLE[170];
extern enum music_id RANDOM_MUSIC_ID_TABLE[30][4];

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

enum music_id MusicTableIdxToMusicId(s32 music_table_idx)
{
    s32 music = MUSIC_ID_TABLE[music_table_idx % 170];

    if (music & 0x8000) {
        s16 rand = DungeonRandInt(4);
        return RANDOM_MUSIC_ID_TABLE[(u16)(music & 0x7FFF)][rand];
    }
    return (enum music_id)(music & 0x7FFF);
}
