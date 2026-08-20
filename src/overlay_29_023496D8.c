#include "overlay_29_023496D8.h"
#include "dungeon.h"
#include "mission.h"

extern struct dungeon *DUNGEON_PTR;

void ClearMissionDestinationInfo(struct mission_destination_info *info);
s32 GetFirstExperienceLockedTeamMember(void);
bool8 FloorHasMissionMonster(struct mission_destination_info *info);
bool8 IsCurrentMissionType(enum mission_type type);
bool8 IsCurrentMissionTypeExact(enum mission_type type, u8 subtype);

void SetTargetMonsterNotFoundFlag(bool8 value)
{
    DUNGEON_PTR->target_monster_not_found_flag = value;
}

bool8 GetTargetMonsterNotFoundFlag(void)
{
    return DUNGEON_PTR->target_monster_not_found_flag;
}
