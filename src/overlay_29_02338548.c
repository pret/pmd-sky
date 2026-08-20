#include "overlay_29_02338548.h"

#include "dungeon.h"
#include "overlay_29_0230F810.h"

extern struct dungeon *DUNGEON_PTR[];

bool8 ShouldBoostKecleonShopSpawnChance(void)
{
    return DUNGEON_PTR[0]->boost_kecleon_shop_spawn_chance;
}

void SetShouldBoostKecleonShopSpawnChance(bool8 boost)
{
    DUNGEON_PTR[0]->boost_kecleon_shop_spawn_chance=boost;
}

void UpdateShouldBoostKecleonShopSpawnChance(void)
{
    DUNGEON_PTR[0]->boost_kecleon_shop_spawn_chance = FALSE;
    if (TeamMemberHasExclusiveItemEffectActive(EXCLUSIVE_EFF_MORE_KECLEON_SHOPS)) {
        DUNGEON_PTR[0]->boost_kecleon_shop_spawn_chance = TRUE;
    }
}

bool8 GetDoughSeedFlag(void)
{
    return DUNGEON_PTR[0]->gen_info.dough_seed_extra_poke_flag;
}


void SetDoughSeedFlag(bool8 flag)
{
    DUNGEON_PTR[0]->gen_info.dough_seed_extra_poke_flag=flag;
}
