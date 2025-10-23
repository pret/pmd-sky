#include "dungeon_logic_7.h"
#include "dungeon_logic_6.h"
#include "dungeon_mode.h"
#include "dungeon_util_static.h"
#include "util.h"

extern bool8 IsSecretBazaarNpcBehavior(enum monster_behavior behavior);

bool8 IsLoneOutlawVeneer(struct monster* monster_info)
{
    return IsLoneOutlaw(monster_info->monster_behavior);
}

bool8 IsSecretBazaarNpc(struct entity *entity)
{
    return IsSecretBazaarNpcBehavior(GetEntInfo(entity)->monster_behavior);
}
