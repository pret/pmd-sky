#include "overlay_29_02338604.h"
#include "overlay_29_0230F810.h"

#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR[];

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

void UpdateShouldBoostHiddenStairsSpawnChance(void)
{
    DUNGEON_PTR[0]->boost_hidden_stairs_spawn_chance = FALSE;
    if (TeamMemberHasExclusiveItemEffectActive(EXCLUSIVE_EFF_MORE_HIDDEN_STAIRS)) {
        DUNGEON_PTR[0]->boost_hidden_stairs_spawn_chance = TRUE;
    }
}
