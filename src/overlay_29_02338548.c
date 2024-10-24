#include "overlay_29_02338548.h"

#include "dungeon.h"

extern struct dungeon* DUNGEON_PTR[];
bool TeamMemberHasExclusiveItemEffectActive(u8);

bool ShouldBoostKecleonShopSpawnChance(void)
{
    return DUNGEON_PTR[0]->boost_kecleon_shop_spawn_chance;
}

void SetShouldBoostKecleonShopSpawnChance(bool boost)
{
    DUNGEON_PTR[0]->boost_kecleon_shop_spawn_chance=boost;
}

void UpdateShouldBoostKecleonShopSpawnChance(void)
{
    DUNGEON_PTR[0]->boost_kecleon_shop_spawn_chance = FALSE;
    if (TeamMemberHasExclusiveItemEffectActive(0x5e)) {
        DUNGEON_PTR[0]->boost_kecleon_shop_spawn_chance = TRUE;
    }
}

bool GetDoughSeedFlag(void)
{
    return DUNGEON_PTR[0]->gen_info.dough_seed_extra_poke_flag;
}


void SetDoughSeedFlag(bool flag)
{
    DUNGEON_PTR[0]->gen_info.dough_seed_extra_poke_flag=flag;
}
