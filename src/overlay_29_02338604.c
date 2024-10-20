#include "overlay_29_02338604.h"

#include "dungeon.h"

extern struct dungeon* DUNGEON_PTR[];

void SetShouldBoostHiddenStairsSpawnChance(u8 should_boost)
{
    #ifdef JAPAN
    DUNGEON_PTR[0]->boost_hidden_stairs_spawn_chance=should_boost;
    #else
    DUNGEON_PTR[0]->boost_hidden_stairs_spawn_chance=should_boost;
    #endif
}
