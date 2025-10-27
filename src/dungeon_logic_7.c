#include "dungeon_logic_7.h"
#include "dungeon_logic_6.h"
#include "dungeon_mode.h"
#include "dungeon_util_static.h"
#include "util.h"

bool8 IsMonsterLoneOutlaw(struct monster* monster_info)
{
    return IsBehaviorLoneOutlaw(monster_info->monster_behavior);
}

bool8 IsSecretBazaarNpc(struct entity *entity)
{
    return IsSecretBazaarNpcBehavior(GetEntInfo(entity)->monster_behavior);
}
