#include "overlay_29_02338604.h"

#include "dungeon.h"

bool8 IsSecretBazaar()
{
    return DUNGEON_PTR[0]->gen_info.fixed_room_id==FIXED_SECRET_BAZAAR;
}


bool8 ShouldBoostHiddenStairsSpawnChance()
{
    return DUNGEON_PTR[0]->boost_hidden_stairs_spawn_chance;
}

void SetShouldBoostHiddenStairsSpawnChance(bool8 should_boost)
{
    DUNGEON_PTR[0]->boost_hidden_stairs_spawn_chance=should_boost;
}
