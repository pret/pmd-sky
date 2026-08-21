#include "overlay_29_02349208.h"
#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR;

void ClearMissionDestinationInfo(struct mission_destination_info *info);
s32 GetFirstExperienceLockedTeamMember(void);

bool8 IsDestinationFloor(void)
{
    return DUNGEON_PTR->mission_destination.is_destination_floor;
}

bool8 IsCurrentMissionType(enum mission_type type)
{
    if (!(DUNGEON_PTR->mission_destination.is_destination_floor && DUNGEON_PTR->mission_destination.type == type)) {
        return FALSE;
    }

    return TRUE;
}

bool8 IsCurrentMissionTypeExact(enum mission_type type, u8 subtype)
{
    if (!(DUNGEON_PTR->mission_destination.is_destination_floor && DUNGEON_PTR->mission_destination.type == type &&
          DUNGEON_PTR->mission_destination.subtype == subtype)) {
        return FALSE;
    }

    return TRUE;
}
