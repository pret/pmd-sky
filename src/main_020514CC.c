#include "main_020514CC.h"
#include "util.h"
#include "enums.h"

bool32 IsDojoDungeon(u8 dungeon_id)
{
    return dungeon_id >= DUNGEON_NORMAL_FLY_MAZE && dungeon_id <= DUNGEON_DOJO_0xD3;
}

bool32 IsFutureDungeon(u8 dungeon_id) {
    return dungeon_id >= DUNGEON_CHASM_CAVE && dungeon_id <= DUNGEON_DEEP_DUSK_FOREST;
}


bool32 IsSpecialEpisodeDungeon(u8 dungeon_id) {
    return dungeon_id >= DUNGEON_STAR_CAVE_SE1 && dungeon_id <= DUNGEON_SPRING_CAVE_PIT;
}
