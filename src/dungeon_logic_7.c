#include "dungeon_logic_7.h"
#include "dungeon_logic_6.h"
#include "dungeon_mode.h"
#include "dungeon_recruitment_2.h"
#include "dungeon_util_static.h"
#include "fixed_room_data_1.h"
#include "util.h"

bool8 IsMonsterLoneOutlaw(struct monster* monster_info)
{
    return IsBehaviorLoneOutlaw(monster_info->monster_behavior);
}

bool8 IsSecretBazaarNpc(struct entity *entity)
{
    return IsSecretBazaarNpcBehavior(GetEntInfo(entity)->monster_behavior);
}

bool8 IsTeamMemberOnFirstTurnInFixedRoom(struct monster *monster)
{
    if (!monster->is_not_team_member &&
        DUNGEON_PTR[0]->wind_turns == GetTurnLimit(DUNGEON_PTR[0]->id) &&
        IsFullFloorFixedRoom())
        return TRUE;

    return FALSE;
}
