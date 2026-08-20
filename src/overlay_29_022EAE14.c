#include "overlay_29_022EAE14.h"
#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR;

void ChangeDungeonMusic(enum music_id music)
{
    DUNGEON_PTR->dungeon_music_playing_id = music;
    DUNGEON_PTR->field_0x2cb00 = 0;
}
