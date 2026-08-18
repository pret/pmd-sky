#include "overlay_29_023495C4.h"
#include "dungeon.h"
#include "mission.h"

extern struct dungeon *DUNGEON_PTR;

void ClearMissionDestinationInfo(struct mission_destination_info *info);
s32 GetFirstExperienceLockedTeamMember(void);
bool8 FloorHasMissionMonster(struct mission_destination_info *info);
bool8 IsCurrentMissionType(enum mission_type type);
bool8 IsCurrentMissionTypeExact(enum mission_type type, u8 subtype);

bool8 IsDestinationFloorWithHiddenOutlaw(void)
{
    return IsCurrentMissionTypeExact(MISSION_TAKE_ITEM_FROM_OUTLAW, 1) != 0;
}
