#include "dungeon_range_2.h"
#include "dungeon.h"
#include "dungeon_map_access.h"
#include "main_0208655C.h"

bool8 IsPositionWithinTwoTiles(struct position *origin, struct position *target)
{
    s32 i;
    s32 origin_x = origin->x;
    s32 origin_y;
    s32 diff = abs(origin_x - target->x);
    if (diff <= 1)
    {
        s32 y_diff = abs(origin->y - target->y);
        if (y_diff <= 1)
            return TRUE;
    }

    origin_y = origin->y;
    s32 y_diff = abs(origin_y - target->y);
    if (diff <= y_diff)
        diff = y_diff;

    if (diff == 2)
    {
        for (i = 0; i < 2; i++)
        {
            if (origin_x < target->x)
                origin_x++;

            if (origin_x > target->x)
                origin_x--;

            if (origin_y < target->y)
                origin_y++;

            if (origin_y > target->y)
                origin_y--;

            const struct tile *tile = GetTile(origin_x, origin_y);
            if (!(tile->terrain_flags & (TERRAIN_TYPE_NORMAL | TERRAIN_TYPE_SECONDARY)))
                return FALSE;
        }

        s32 target_x = target->x;
        s32 target_y = target->y;

        for (i = 0; i < 2; i++)
        {
            if (target_x < origin->x)
                target_x++;

            if (target_x > origin->x)
                target_x--;

            if (target_y < origin->y)
                target_y++;

            if (target_y > origin->y)
                target_y--;

            const struct tile *tile = GetTile(target_x, target_y);
            if (!(tile->terrain_flags & (TERRAIN_TYPE_NORMAL | TERRAIN_TYPE_SECONDARY)))
                return FALSE;
        }
        return TRUE;
    }
    return FALSE;
}
