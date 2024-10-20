#include "overlay_29_02338604.h"

#include "dungeon.h"

extern struct dungeon* DUNGEON_PTR[];

void SetShouldBoostHiddenStairsSpawnChance(u8 should_boost)
{
    #ifdef JAPAN
    DUNGEON_PTR[0]->unknown_file_buffer_0x12162[0x91f]=should_boost;
    #else
    DUNGEON_PTR[0]->unknown_file_buffer_0x12162[0x9c3]=should_boost;
    #endif
}
