#include "overlay_29_02349470.h"
#include "dungeon.h"
#include "mission.h"

extern struct dungeon *DUNGEON_PTR;

void ClearMissionDestinationInfo(struct mission_destination_info *info);
s32 GetFirstExperienceLockedTeamMember(void);
bool8 FloorHasMissionMonster(struct mission_destination_info *info);
bool8 IsCurrentMissionType(enum mission_type type);
bool8 IsCurrentMissionTypeExact(enum mission_type type, u8 subtype);

s32 MissionTargetEnemyIsDefeated(void)
{
    struct dungeon *dungeon = DUNGEON_PTR;

    return dungeon->mission_destination.is_destination_floor
        ? dungeon->mission_destination.target_enemy_is_defeated : FALSE;
}

void SetMissionTargetEnemyDefeated(bool8 defeated)
{
    DUNGEON_PTR->mission_destination.target_enemy_is_defeated = defeated;
}

s32 IsDestinationFloorWithFixedRoom(void)
{
    struct dungeon *dungeon = DUNGEON_PTR;

    if (dungeon->mission_destination.is_destination_floor == FALSE ||
        dungeon->mission_destination.fixed_room_id == 0) {
        return FALSE;
    }
    return TRUE;
}
