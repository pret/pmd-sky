#include "dungeon_range.h"
#include "dg_camera.h"
#include "dungeon.h"
#include "dungeon_map_access.h"
#include "dungeon_range_2.h"
#include "main_0208655C.h"

bool8 IsPositionActuallyInSight(struct position *origin, struct position *target, bool8 user_has_dropeye)
{
    s16 visibility = GetVisibilityRange();
    const struct tile *tile_1 = GetTile(origin->x, origin->y);
    u8 origin_room = tile_1->room;
    if (user_has_dropeye || origin_room == CORRIDOR_ROOM) {
        if (abs(origin->x - target->x) <= visibility && abs(origin->y - target->y) <= visibility)
            return TRUE;
    }
    else {
        struct room_data *origin_room_data = &DUNGEON_PTR[0]->room_data[origin_room];
        if (origin_room_data->bottom_right_corner.x - 1 <= target->x &&
            origin_room_data->bottom_right_corner.y - 1 <= target->y &&
            origin_room_data->top_left_corner.x + 1 > target->x &&
            origin_room_data->top_left_corner.y + 1 > target->y)
            return TRUE;
    }

    return FALSE;
}

bool8 IsPositionInSight(struct position *origin, struct position *target, bool8 user_has_dropeye)
{
    const struct tile *tile = GetTile(origin->x, origin->y);
    u8 origin_room = tile->room;
    if (origin_room != CORRIDOR_ROOM && !user_has_dropeye) {
        struct room_data *origin_room_data = &DUNGEON_PTR[0]->room_data[origin_room];
        if (origin_room_data->bottom_right_corner.x - 1 <= target->x &&
            origin_room_data->bottom_right_corner.y - 1 <= target->y &&
            origin_room_data->top_left_corner.x + 1 > target->x &&
            origin_room_data->top_left_corner.y + 1 > target->y)
            return TRUE;
    }

    s32 absY = abs(origin->y - target->y);
    s32 absX = abs(origin->x - target->x);
    s32 diff = MAX(absX, absY);

    if (diff > 2)
        return FALSE;
    else if (diff == 2) {
        if (IsPositionWithinTwoTiles(origin, target))
            return TRUE;
        else
            return FALSE;
    }

    return TRUE;
}
