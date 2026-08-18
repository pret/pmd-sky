#include "overlay_29_02349208.h"
#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR;

void ClearMissionDestinationInfo(struct mission_destination_info *info);
s32 GetFirstExperienceLockedTeamMember(void);

bool8 IsDestinationFloor(void)
{
    return DUNGEON_PTR->mission_destination.is_destination_floor;
}
