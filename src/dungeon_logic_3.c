#include "dungeon_logic_3.h"
#include "dungeon_map_access.h"
#include "dungeon_mobility.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util.h"
#include "dungeon_util_static.h"
#include "overlay_29_022FF898.h"

static const u8 DIRECTIONAL_BIT_MASKS[] = {0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

extern enum mobility_type GetDirectionalMobilityType(struct entity* monster, enum mobility_type base_mobility, u8 direction);
extern bool8 IsCurrentTilesetBackground(void);

bool8 CanMonsterMoveInDirection(struct entity *monster, u16 direction)
{
    struct monster *monster_info = GetEntInfo(monster);
    enum mobility_type mobility = GetMobilityTypeCheckSlipAndFloating(monster, monster_info->id);
    const struct tile *current_map_tile = GetTile(monster->pos.x + DIRECTIONS_XY[direction].x,
        monster->pos.y + DIRECTIONS_XY[direction].y);

    if (current_map_tile->terrain_flags & TERRAIN_TYPE_IMPASSABLE_WALL)
        return FALSE;

    if (current_map_tile->monster != NULL)
        return FALSE;

    #ifdef JAPAN
    if (!IsCurrentTilesetBackground())
    {
        if (GetEntInfo(monster)->invisible_class_status.status == STATUS_INVISIBLE_MOBILE)
            mobility = MOBILITY_INTANGIBLE;
        else if (ItemIsActive__022FF898(monster, ITEM_MOBILE_SCARF))
            mobility = MOBILITY_INTANGIBLE;
        else if (IqSkillIsEnabled(monster, IQ_ALL_TERRAIN_HIKER))
            mobility = MOBILITY_HOVERING;
        else if (IqSkillIsEnabled(monster, IQ_ABSOLUTE_MOVER)) {
            if (direction & 1)
                // Absolute Mover can't break walls diagonally.
                mobility = MOBILITY_HOVERING;
            else
                mobility = MOBILITY_INTANGIBLE;
        }
    }
    #else
    mobility = GetDirectionalMobilityType(monster, mobility, direction);
    #endif

    current_map_tile = GetTile(monster->pos.x, monster->pos.y);
    if (current_map_tile->walkable_neighbor_flags[mobility] & DIRECTIONAL_BIT_MASKS[direction & DIRECTION_MASK])
        return TRUE;

    return FALSE;
}
