#ifndef PMDSKY_OVERLAY_29_02338548_H
#define PMDSKY_OVERLAY_29_02338548_H

#include "util.h"

// Gets the boost_kecleon_shop_spawn_chance field on the dungeon struct.
// return: bool
bool8 ShouldBoostKecleonShopSpawnChance(void);
// Sets the boost_kecleon_shop_spawn_chance field on the dungeon struct to the given value.
// boost: bool8 to set the flag to
void SetShouldBoostKecleonShopSpawnChance(bool8 boost);
// Sets the boost_kecleon_shop_spawn_chance field on the dungeon struct depending on if a team member has the exclusive item effect for more kecleon shops.
void UpdateShouldBoostKecleonShopSpawnChance(void);
// Gets the dough_seed_extra_money_flag field on the dungeon struct.
bool8 GetDoughSeedFlag(void);
// Sets the dough_seed_extra_money_flag field on the dungeon struct to the given value.
void SetDoughSeedFlag(bool8 flag);

#endif //PMDSKY_OVERLAY_29_02338548_H
