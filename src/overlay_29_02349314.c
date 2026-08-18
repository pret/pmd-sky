#include "overlay_29_02349314.h"
#include "dungeon.h"
#include "mission.h"

extern struct dungeon *DUNGEON_PTR;

void ClearMissionDestinationInfo(struct mission_destination_info *info);
s32 GetFirstExperienceLockedTeamMember(void);
bool8 FloorHasMissionMonster(struct mission_destination_info *info);
bool8 IsCurrentMissionType(enum mission_type type);
bool8 IsCurrentMissionTypeExact(enum mission_type type, u8 subtype);

bool8 IsJirachiChallengeFloor(void)
{
    if (IsCurrentMissionType(MISSION_CHALLENGE_REQUEST) && DUNGEON_PTR->mission_destination.subtype == 5) {
        return TRUE;
    }
    return FALSE;
}

bool8 IsDestinationFloorWithMonster(void)
{
    return FloorHasMissionMonster(&DUNGEON_PTR->mission_destination) != 0;
}
