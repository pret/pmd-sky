#include "overlay_29_0234928C.h"

#include "dungeon.h"
#include "mission.h"

extern struct dungeon *DUNGEON_PTR;

void ClearMissionDestinationInfo(struct mission_destination_info *info);
s32 GetFirstExperienceLockedTeamMember(void);
bool8 FloorHasMissionMonster(struct mission_destination_info *info);
bool8 IsCurrentMissionType(enum mission_type type);
bool8 IsCurrentMissionTypeExact(enum mission_type type, u8 subtype);

bool8 IsOutlawMonsterHouseFloor(void)
{
    return IsCurrentMissionTypeExact(MISSION_ARREST_OUTLAW, 7) != 0;
}

bool8 IsGoldenChamber(void)
{
    return IsCurrentMissionTypeExact(MISSION_EXPLORE_WITH_CLIENT, 2) != 0;
}

bool8 IsLegendaryChallengeFloor(void)
{
    if (IsCurrentMissionType(MISSION_CHALLENGE_REQUEST)) {
        if ((u8) (DUNGEON_PTR->mission_destination.subtype + 0xFF) <= 4) {
            return TRUE;
        }
    }

    return FALSE;
}
