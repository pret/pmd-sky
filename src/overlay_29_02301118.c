#include "overlay_29_02301118.h"
#include "direction.h"
#include "directional_bit_masks.h"
#include "dungeon.h"
#include "dungeon_ai_targeting_1.h"
#include "dungeon_logic_3.h"
#include "dungeon_map_access.h"
#include "dungeon_mobility.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util.h"
#include "dungeon_util_static.h"
#include "item.h"
#include "overlay_29_022FF898.h"
#include "run_dungeon.h"
#include "targeting.h"

bool8 IsMonsterCornered(struct entity *monster)
{
    for (u8 i = 0; i < NUM_DIRECTIONS; i++)
    {
        if (CanMonsterMoveOrSwapWithAllyInDirection(monster, i))
            return TRUE;
    }
    return FALSE;
}

bool8 CanMonsterMoveOrSwapWithAllyInDirection(struct entity *monster, s32 direction)
{
    struct monster *monster_info = GetEntInfo(monster);
    enum mobility_type mobility = GetMobilityTypeCheckSlipAndFloating(monster, monster_info->id);
    const struct tile *current_map_tile = GetTile(monster->pos.x + DIRECTIONS_XY[direction].x,
        monster->pos.y + DIRECTIONS_XY[direction].y);

    if (current_map_tile->terrain_flags & TERRAIN_TYPE_IMPASSABLE_WALL)
        return FALSE;

    if (current_map_tile->monster != NULL &&
        current_map_tile->monster->type == ENTITY_MONSTER &&
        GetTreatmentBetweenMonsters(monster, current_map_tile->monster, TRUE, FALSE) == TREATMENT_TREAT_AS_ENEMY)
        return FALSE;

    #ifdef JAPAN
    if (!IsCurrentTilesetBackground())
    {
        if (GetEntInfo(monster)->invisible_class_status.status == STATUS_INVISIBLE_MOBILE)
            mobility = MOBILITY_INTANGIBLE;
        else if (ItemIsActive__022FF898(monster, ITEM_MOBILE_SCARF))
            mobility = MOBILITY_INTANGIBLE;
        else if (IqSkillIsEnabled(monster, IQ_ALL_TERRAIN_HIKER))
            // BUG: If a Pokémon can normally move through walls, All-Terrain Hiker will block them from moving through walls.
            // This bug is fixed in the NA/EU versions.
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
    if (current_map_tile->walkable_neighbor_flags[mobility] & DIRECTIONAL_BIT_MASKS__02352780[direction & DIRECTION_MASK])
        return TRUE;

    return FALSE;
}
