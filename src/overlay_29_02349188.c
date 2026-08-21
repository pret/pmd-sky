#include "overlay_29_02349188.h"
#include "mission.h"

extern bool8 IsCurrentMissionType(enum mission_type type);
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

#include "overlay_29_02349208.h"
bool8 IsOutlawOrChallengeRequestFloor(void)
{
    if (IsCurrentMissionType(MISSION_CHALLENGE_REQUEST) != 0 ||
        IsCurrentMissionType(MISSION_ARREST_OUTLAW) != 0 ||
        IsCurrentMissionType(MISSION_TAKE_ITEM_FROM_OUTLAW) != 0) {
        return TRUE;
    }

    return FALSE;
}
