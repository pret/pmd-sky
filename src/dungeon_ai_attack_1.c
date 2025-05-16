#include "dungeon_ai_attack_1.h"
#include "dungeon.h"
#include "dungeon_map_access.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util.h"
#include "main_0208655C.h"
#include "util.h"

bool8 IsTargetInRange(struct entity *user, struct entity *target, enum direction_id direction, s32 n_tiles)
{
    s32 effective_max_range = Max(abs(user->pos.x - target->pos.x), abs(user->pos.y - target->pos.y));

    if (effective_max_range > n_tiles)
        effective_max_range = n_tiles;

    if (!IqSkillIsEnabled(user, IQ_COURSE_CHECKER))
        // BUG: effective_max_range is already capped at max_range, so this condition always evaluates to TRUE.
        // The AI also has range checks elsewhere, so this doesn't become an issue in most cases.
        // If the AI has the Long Toss or Pierce statuses and Course Checker is disabled,
        // this incorrect check causes the AI to throw items at targets further than 10 tiles away.
        return effective_max_range <= n_tiles;

    s32 i;
    s32 current_pos_x = user->pos.x;
    s32 current_pos_y = user->pos.y;
    s32 adjacent_tile_offset_x = DIRECTIONS_XY[direction].x;
    s32 adjacent_tile_offset_y = DIRECTIONS_XY[direction].y;
    for (i = 0; i <= effective_max_range; i++)
    {
        current_pos_x += adjacent_tile_offset_x;
        current_pos_y += adjacent_tile_offset_y;
        if (current_pos_x < 1 || current_pos_y < 1 ||
            current_pos_x >= DUNGEON_MAX_SIZE_X - 1 || current_pos_y >= DUNGEON_MAX_SIZE_Y - 1)
            break;

        const struct tile *map_tile = GetTile(current_pos_x, current_pos_y);
        if (!(map_tile->terrain_flags & (TERRAIN_TYPE_NORMAL | TERRAIN_TYPE_SECONDARY)))
            return FALSE;

        if (map_tile->monster == target)
            return TRUE;

        if (map_tile->monster != NULL)
            return FALSE;
    }
    return FALSE;
}
