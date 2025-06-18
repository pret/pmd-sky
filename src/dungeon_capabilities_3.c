#include "dungeon_capabilities_3.h"
#include "directional_bit_masks.h"
#include "dungeon_ai_targeting.h"
#include "dungeon_map_access.h"
#include "dungeon_mobility.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util.h"
#include "dungeon_util_static.h"
#include "overlay_29_022FF898.h"
#include "run_dungeon.h"

bool8 MonsterCannotAttack(struct entity *pokemon, bool8 skip_sleep)
{
    struct monster *pokemon_info = GetEntInfo(pokemon);

    if (!skip_sleep)
    {
        if (pokemon_info->sleep_class_status.sleep != STATUS_SLEEP_SLEEPLESS &&
            pokemon_info->sleep_class_status.sleep != STATUS_SLEEP_YAWNING &&
            pokemon_info->sleep_class_status.sleep != STATUS_SLEEP_NONE)
            return TRUE;
    }

    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_FROZEN)
        return TRUE;

    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_WRAP)
        return TRUE;

    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_WRAPPED)
        return TRUE;

    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_PETRIFIED)
        return TRUE;

    if (pokemon_info->cringe_class_status.cringe == STATUS_CRINGE_CRINGE)
        return TRUE;

    if (pokemon_info->cringe_class_status.cringe == STATUS_CRINGE_PAUSED)
        return TRUE;

    if (pokemon_info->cringe_class_status.cringe == STATUS_CRINGE_INFATUATED)
        return TRUE;

    if (pokemon_info->burn_class_status.burn == STATUS_BURN_PARALYSIS)
        return TRUE;

    if (ShouldMonsterRunAway(pokemon))
        return TRUE;

    return FALSE;
}

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
    if (current_map_tile->walkable_neighbor_flags[mobility] & DIRECTIONAL_BIT_MASKS__02352798[direction & DIRECTION_MASK])
        return TRUE;

    return FALSE;
}

#ifndef JAPAN
enum mobility_type GetDirectionalMobilityType(struct entity* monster, enum mobility_type base_mobility, u8 direction)
{
    enum mobility_type mobility = base_mobility;
    if (!IsCurrentTilesetBackground())
    {
        if (GetEntInfo(monster)->invisible_class_status.status == STATUS_INVISIBLE_MOBILE)
            mobility = MOBILITY_INTANGIBLE;
        else if (ItemIsActive__022FF898(monster, ITEM_MOBILE_SCARF))
            mobility = MOBILITY_INTANGIBLE;
        else if (mobility != MOBILITY_INTANGIBLE && IqSkillIsEnabled(monster, IQ_ALL_TERRAIN_HIKER))
            mobility = MOBILITY_HOVERING;
        else if (IqSkillIsEnabled(monster, IQ_ABSOLUTE_MOVER)) {
            if (direction == 0xFF)
                mobility = MOBILITY_INTANGIBLE;
            else if (direction & 1)
                // Absolute Mover can't break walls diagonally.
                mobility = MOBILITY_HOVERING;
            else
                mobility = MOBILITY_INTANGIBLE;
        }
    }
    return mobility;
}
#endif
