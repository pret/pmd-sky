#include "overlay_29_02349688.h"
#include "dungeon.h"
#include "mission.h"

extern struct dungeon *DUNGEON_PTR;

void ClearMissionDestinationInfo(struct mission_destination_info *info);
s32 GetFirstExperienceLockedTeamMember(void);
bool8 FloorHasMissionMonster(struct mission_destination_info *info);
bool8 IsCurrentMissionType(enum mission_type type);
bool8 IsCurrentMissionTypeExact(enum mission_type type, u8 subtype);

void ov29_02349688(bool8 value)
{
    DUNGEON_PTR->target_enemy_defeated_message = value;
}

void ov29_0234969C(bool8 value)
{
    DUNGEON_PTR->hidden_outlaw_defeated_message = value;
}

bool8 ov29_023496B0(void)
{
    return DUNGEON_PTR->hidden_outlaw_defeated_message;
}
