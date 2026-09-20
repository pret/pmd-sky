#include "main_020514CC.h"
#include "util.h"
#include "enums.h"
#include "dungeon.h"
#include "main_0200224C.h"

extern u8 GetNbFloorsPlusOne(enum dungeon_id dungeon_id);
extern s32 GetItemIdFromList(s32 list_idx, s32 a, s32 b);
extern void DungeonFloorToGroupFloor(struct dungeon_floor_pair *out, struct dungeon_floor_pair *pair);
extern const struct dungeon_floor_pair MISSION_FLOORS_FORBIDDEN[];

bool32 IsDojoDungeon(u8 dungeon_id)
{
    return dungeon_id >= DUNGEON_NORMAL_FLY_MAZE && dungeon_id <= DUNGEON_DOJO_0xD3;
}

bool32 IsFutureDungeon(u8 dungeon_id) {
    return dungeon_id >= DUNGEON_CHASM_CAVE && dungeon_id <= DUNGEON_DEEP_DUSK_FOREST;
}


bool32 IsSpecialEpisodeDungeon(u8 dungeon_id) {
    return dungeon_id >= DUNGEON_STAR_CAVE_SE1 && dungeon_id <= DUNGEON_SPRING_CAVE_PIT;
}

s32 RetrieveFromItemList1(struct dungeon_floor_pair *pair, s32 list_idx)
{
    s32 rnd1 = RandIntSafe(9999);
    s32 rnd2 = RandIntSafe(9999);
    enum dungeon_id dungeon_id = pair->dungeon_id;

    if (dungeon_id >= DUNGEON_NORMAL_FLY_MAZE &&
        dungeon_id >= DUNGEON_DOJO_0xD3) {
        return ITEM_PLAIN_SEED;
    }
    if (pair->floor_id >= GetNbFloorsPlusOne(dungeon_id)) {
        return ITEM_PLAIN_SEED;
    }
    return GetItemIdFromList(list_idx, rnd1, rnd2);
}

bool8 IsForbiddenFloor(struct dungeon_floor_pair *pair)
{
    struct dungeon_floor_pair group;
    s32 i;

    DungeonFloorToGroupFloor(&group, pair);
    for (i = 0; ; i++) {
        if (MISSION_FLOORS_FORBIDDEN[i].dungeon_id == 100) {
            break;
        }
        if (group.dungeon_id == MISSION_FLOORS_FORBIDDEN[i].dungeon_id &&
            group.floor_id == MISSION_FLOORS_FORBIDDEN[i].floor_id) {
            return TRUE;
        }
    }
    return FALSE;
}
