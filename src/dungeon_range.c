#include "dungeon_range.h"
#include "dungeon.h"
#include "map.h"

extern struct dungeon *DUNGEON_PTR[];

extern s16 GetVisibilityRange();
extern struct tile* GetTile(int x, int y);
extern s32 abs(s32 value);

bool8 IsPositionActuallyInSight(struct position *origin, struct position *target, bool8 user_has_dropeye)
{
    u8 origin_room;
    s16 visibility = GetVisibilityRange();
    const struct tile *tile_1;

    tile_1 = GetTile(origin->x, origin->y);
    origin_room = tile_1->room;
    if (user_has_dropeye || origin_room == CORRIDOR_ROOM)
    {
        if (abs(origin->x - target->x) <= visibility && abs(origin->y - target->y) <= visibility)
            return TRUE;
    }
    else
    {
        struct room_data *origin_room_data = &DUNGEON_PTR[0]->room_data[origin_room];
        if (origin_room_data->bottom_right_corner.x - 1 <= target->x && origin_room_data->bottom_right_corner.y - 1 <= target->y &&
            origin_room_data->top_left_corner.x + 1 > target->x && origin_room_data->top_left_corner.y + 1 > target->y)
            return TRUE;
    }

    return FALSE;
}
