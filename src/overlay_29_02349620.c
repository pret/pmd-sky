#include "overlay_29_02349620.h"
#include "dungeon.h"
#include "mission.h"

extern struct dungeon *DUNGEON_PTR;

void ClearMissionDestinationInfo(struct mission_destination_info *info);
s32 GetFirstExperienceLockedTeamMember(void);
bool8 FloorHasMissionMonster(struct mission_destination_info *info);
bool8 IsCurrentMissionType(enum mission_type type);
bool8 IsCurrentMissionTypeExact(enum mission_type type, u8 subtype);

enum monster_id GetMissionTargetEnemy(void)
{
    return DUNGEON_PTR->mission_destination.enemy_species[0];
}

enum monster_id GetMissionEnemyMinionGroup(s32 index)
{
    s32 i = index + 1;

    return DUNGEON_PTR->mission_destination.enemy_species[i];
}

void ov29_02349658(void)
{
    DUNGEON_PTR->field_0x0 = 0;
    DUNGEON_PTR->target_enemy_defeated_message = FALSE;
    DUNGEON_PTR->hidden_outlaw_defeated_message = FALSE;
    DUNGEON_PTR->target_monster_not_found_flag = FALSE;
}
