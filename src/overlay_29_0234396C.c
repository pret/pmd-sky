#include "overlay_29_0234396C.h"
#include "dungeon.h"
#include "dungeon_map_access.h"
#include "fixed_room_data_1.h"
#include "overlay_29_02349208.h"
#include "main_0200330C.h"
#include "main_02008BD4.h"

void PlaceFixedRoomTile(struct tile*, u16, s32, s32, s32);
void DetermineAllTilesWalkableNeighbors(void);            
void LogMessageByIdWithPopupCheckUser(struct entity*, s32);    
void PlayKeyDoorUnlockEffect(struct position*, u8);               
void UpdateTrapsVisibility(void);                       
void ov29_022EA370(s32, s32);                     
void ov29_02336694(s32, s32);                       
void UpdateMinimap(void);
void ov29_02348BE8();
extern void HandleSir0Translation(void*, void*);
extern void LoadFileFromRom(struct iovec* iov, const char* filepath, u32 flags);

extern struct iovec* FIXED_ROOM_DATA_PTR;
extern const char ov29_02353110[];
extern struct dungeon* DUNGEON_PTR;

u8 FixedRoomActionParamToDirection(u8 action_param)
{
    if (action_param == 0) {
        return 0xFF;
    }

    return action_param - 1;
}

void ov29_02343980(void) 
{
    s32 index_x;
    s32 index_y;
    u16 temp_r1;
    struct tile* tile;

    for(index_y = 0; index_y < DUNGEON_MAX_SIZE_Y; index_y++){
        for(index_x = 0; index_x < DUNGEON_MAX_SIZE_X; index_x++)
        {
            tile = GetTileSafe(index_x, index_y);
            temp_r1 = tile->field_0x6;
            if (temp_r1 >= 0x10) {
                PlaceFixedRoomTile(tile, temp_r1, index_x, index_y, 0);
            }
        }
    }
}

void TryOpenKeyDoor(struct entity* arg0, struct tile* arg1, s32 arg2, s32 arg3)
{
    struct position pos;
    bool8 temp_r0;
    s32 x_coord;
    u8 room_idx;
    bool8 flag;
    s32 x_diff;
    s32 y_diff;
    struct tile* tile;

    if (!DUNGEON_PTR->gen_info.locked_door_opened) {
        temp_r0 = IsFullFloorFixedRoom();
        pos.x = arg0->pos.x;
        pos.y = arg0->pos.y - 1;
        room_idx = arg0->room_idx;
        if (temp_r0 == 0) {
            for(s32 y_coord = arg0->pos.y - 0x15; y_coord <= (arg0->pos.y + 0x13); y_coord++)
            {
                for(x_coord = arg0->pos.x - 0x14; x_coord <= (arg0->pos.x + 0x14); x_coord++)
                {
                    x_diff = x_coord - DUNGEON_PTR->fixed_room_min_x;
                    y_diff = y_coord - DUNGEON_PTR->fixed_room_min_y;
                    if ((x_diff >= 0) && (y_diff >= 0)) {
                        if ((x_diff < 8) && (y_diff < 8)) {
                            if ((x_coord >= (DUNGEON_PTR->fixed_room_min_x + 1)) && (y_coord >= (DUNGEON_PTR->fixed_room_min_y + 1))) {
                                if ((x_coord < (DUNGEON_PTR->fixed_room_max_x - 1)) && (y_coord < (DUNGEON_PTR->fixed_room_max_y - 1))) {
                                    tile = GetTileSafe(x_coord, y_coord);
                                    if (tile->terrain_flags & 0x100) {
                                        tile->terrain_flags = DUNGEON_PTR->fixed_room_tiles[x_diff][y_diff].terrain_flags;
                                        tile->spawn_or_visibility_flags = DUNGEON_PTR->fixed_room_tiles[x_diff][y_diff].spawn_or_visibility_flags;
                                    }
                                    PlaceFixedRoomTile(tile, DUNGEON_PTR->field_0xd260[x_diff][y_diff], x_coord, y_coord, 1);
                                    tile->spawn_or_visibility_flags |= 3; // STAIRS and ITEM?
                                    if (room_idx != 0xFF) {
                                        tile->room = room_idx;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            for(s32 y_coord = arg0->pos.y - 0x15; y_coord <= (arg0->pos.y + 0x13); y_coord++)
            {
                for(s32 x_coord = arg0->pos.x - 0x14; x_coord <= (arg0->pos.x + 0x14); x_coord++)
                {
                    x_diff = x_coord - DUNGEON_PTR->fixed_room_min_x;
                    y_diff = y_coord - DUNGEON_PTR->fixed_room_min_y;
                    if ((x_diff >= 0) && (y_diff >= 0)) {
                        if ((x_diff < 8) && (y_diff < 8)) {
                            if ((x_coord >= (DUNGEON_PTR->fixed_room_min_x + 1)) && (y_coord >= (DUNGEON_PTR->fixed_room_min_y + 1))) {
                                if ((x_coord < (DUNGEON_PTR->fixed_room_max_x - 1)) && (y_coord < (DUNGEON_PTR->fixed_room_max_y - 1))) {
                                    ov29_02336694(x_coord, y_coord);
                                }
                            }
                        }
                    }
                }
            }
        }
        DUNGEON_PTR->gen_info.locked_door_opened = TRUE;
        arg1->terrain_flags &= 0xFFFFCFEF;
        if (temp_r0 != 0) {
            arg1->terrain_flags &= ~3;
            arg1->terrain_flags |= 1;
        }
        ov29_02336694(arg0->pos.x, arg0->pos.y - 1);
        DetermineAllTilesWalkableNeighbors();
        UpdateTrapsVisibility();
        if (IsCurrentMissionType(MISSION_TREASURE_MEMO) == 0) {
            flag = TRUE;
        } else {
            flag = FALSE;
        }
        PlayKeyDoorUnlockEffect(&pos, flag);
        LogMessageByIdWithPopupCheckUser(arg0, arg2);
        ov29_022EA370(0x14, 0x3C);
        return;
    }
    LogMessageByIdWithPopupCheckUser(arg0, arg3);
}

void ApplyKeyEffect(struct entity* entity)
{
    struct tile* tile;

    tile = GetTileSafe(entity->pos.x, entity->pos.y - 1);
    if (!(tile->terrain_flags & 0x1000)) {
#ifdef JAPAN
        LogMessageByIdWithPopupCheckUser(entity, 0x8A6);
#else
        LogMessageByIdWithPopupCheckUser(entity, 0xB94);
#endif
        return;
    }
#ifdef JAPAN
    TryOpenKeyDoor(entity, tile, 0x8A5, 0x8A6);
#else
    TryOpenKeyDoor(entity, tile, 0xB93, 0xB94);
#endif
    UpdateMinimap();
}


void ov29_02343D30(struct entity* entity)
{
    struct tile* tile;

    tile = GetTileSafe(entity->pos.x, entity->pos.y - 1);
    if (!(tile->terrain_flags & 0x2000)) {
#ifdef JAPAN
        LogMessageByIdWithPopupCheckUser(entity, 0x8A7);
#else
        LogMessageByIdWithPopupCheckUser(entity, 0xB95);
#endif   
        return;
    }
    ov29_02348BE8();
#ifdef JAPAN
    TryOpenKeyDoor(entity, tile, 0x8A5, 0x8A7);
#else
    TryOpenKeyDoor(entity, tile, 0xB93, 0xB95);
#endif
    UpdateMinimap();
}

void LoadFixedRoomData(void)
{
    LoadFileFromRom(FIXED_ROOM_DATA_PTR, ov29_02353110, 0);
    HandleSir0Translation(FIXED_ROOM_DATA_PTR + 1, FIXED_ROOM_DATA_PTR->iov_base);
}

void *ov29_02343DC4(void)
{
    return FIXED_ROOM_DATA_PTR[1].iov_base; 
}

void ov29_02343DD8(void)
{
    if (PointsToZero(FIXED_ROOM_DATA_PTR) != 0) {
        return;
    }
    UnloadFile(FIXED_ROOM_DATA_PTR);
    ZInit8(FIXED_ROOM_DATA_PTR);
    FIXED_ROOM_DATA_PTR[1].iov_base = NULL;
}
