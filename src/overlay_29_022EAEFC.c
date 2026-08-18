#include "overlay_29_022EAEFC.h"
#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR;

bool8 ov29_022EAEFC(void)
{
    return DUNGEON_PTR->unk_music_flag == 0;
}

u8 ov29_022EAF20(void)
{
    return DUNGEON_PTR->unk_music_flag;
}

void SetUnkMusicFlag(u8 value)
{
    DUNGEON_PTR->unk_music_flag = value;
}
