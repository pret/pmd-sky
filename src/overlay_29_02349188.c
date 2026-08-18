#include "overlay_29_02349188.h"
#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR;

void ClearMissionDestinationInfo(struct mission_destination_info *info);
s32 GetFirstExperienceLockedTeamMember(void);

void ov29_02349188(void)
{
    ClearMissionDestinationInfo(&DUNGEON_PTR->mission_destination);
}

struct mission_destination_info* GetMissionDestination(void)
{
    return &DUNGEON_PTR->mission_destination;
}

s32 ov29_023491B8(void)
{
    return GetFirstExperienceLockedTeamMember();
}
