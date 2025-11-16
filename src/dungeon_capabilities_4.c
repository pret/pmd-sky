#include "dungeon_capabilities_4.h"
#include "dg_random.h"
#include "direction.h"
#include "directional_bit_masks.h"
#include "dungeon.h"
#include "dungeon_ai_targeting_1.h"
#include "dungeon_capabilities_3.h"
#include "dungeon_map_access.h"
#include "dungeon_mobility.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util.h"
#include "dungeon_util_static.h"
#include "item.h"
#include "overlay_29_022FF898.h"
#include "run_dungeon.h"
#include "secondary_terrain_types.h"
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
        GetEntityType(current_map_tile->monster) == ENTITY_MONSTER &&
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

bool8 CanAttackInDirection(struct entity *monster, s32 direction)
{
    struct monster *monster_info = GetEntInfo(monster);
    enum mobility_type mobility = GetMobilityTypeCheckSlipAndFloating(monster, monster_info->id);
    if (mobility <= MOBILITY_SECONDARY)
        mobility = MOBILITY_HOVERING;
    const struct tile *current_map_tile = GetTile(monster->pos.x + DIRECTIONS_XY[direction].x,
        monster->pos.y + DIRECTIONS_XY[direction].y);

    if (current_map_tile->terrain_flags & TERRAIN_TYPE_IMPASSABLE_WALL)
        return FALSE;

    if (current_map_tile->monster != NULL && GetEntityType(current_map_tile->monster) != ENTITY_MONSTER)
        return FALSE;

    #ifdef JAPAN
    if (!IsCurrentTilesetBackground())
    {
        if (GetEntInfo(monster)->invisible_class_status.status == STATUS_INVISIBLE_MOBILE)
            mobility = MOBILITY_INTANGIBLE;
        else if (ItemIsActive__022FF898(monster, ITEM_MOBILE_SCARF))
            mobility = MOBILITY_INTANGIBLE;
        else if (IqSkillIsEnabled(monster, IQ_ALL_TERRAIN_HIKER))
            // BUG: If a Pokémon can normally attack through walls, All-Terrain Hiker will block them from attacking through walls.
            // This bug is fixed in the NA/EU versions.
            mobility = MOBILITY_HOVERING;
        else if (IqSkillIsEnabled(monster, IQ_ABSOLUTE_MOVER)) {
            if (direction & 1)
                mobility = MOBILITY_HOVERING;
            else
                mobility = MOBILITY_INTANGIBLE;
        }
    }
    #else
    mobility = GetDirectionalMobilityType(monster, mobility, direction);
    #endif

    current_map_tile = GetTile(monster->pos.x, monster->pos.y);
    if (!(current_map_tile->walkable_neighbor_flags[mobility] & DIRECTIONAL_BIT_MASKS__02352778[direction & DIRECTION_MASK]))
        return FALSE;

    return TRUE;
}

bool8 CanAiMonsterMoveInDirection(struct entity *monster, s32 direction, bool8 *out_monster_in_target_position)
{
    const struct tile *front_tile;
    enum mobility_type mobility = GetMobilityTypeCheckSlipAndFloating(monster, GetEntInfo(monster)->id);
    *out_monster_in_target_position = FALSE;

    front_tile = GetTile(monster->pos.x + DIRECTIONS_XY[direction].x, monster->pos.y + DIRECTIONS_XY[direction].y);
    if (front_tile->terrain_flags & TERRAIN_TYPE_IMPASSABLE_WALL)
        return FALSE;

    if (front_tile->terrain_flags & TERRAIN_TYPE_IN_MONSTER_HOUSE &&
        !DUNGEON_PTR[0]->monster_house_triggered &&
        IqSkillIsEnabled(monster, IQ_HOUSE_AVOIDER))
        return FALSE;

    if (front_tile->object != NULL &&
        IqSkillIsEnabled(monster, IQ_TRAP_AVOIDER) &&
        GetEntityType(front_tile->object) == ENTITY_TRAP &&
        (front_tile->object->is_visible || GetEntInfo(monster)->blinker_class_status.blinded == STATUS_BLINKER_EYEDROPS))
        return FALSE;

    if ((front_tile->terrain_flags & (TERRAIN_TYPE_NORMAL | TERRAIN_TYPE_SECONDARY)) == TERRAIN_TYPE_SECONDARY &&
        SECONDARY_TERRAIN_TYPES[DUNGEON_PTR[0]->gen_info.tileset_id] == SECONDARY_TERRAIN_LAVA &&
        IqSkillIsEnabled(monster, IQ_LAVA_EVADER))
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

    const struct tile *current_tile = GetTile(monster->pos.x, monster->pos.y);
    if (!(current_tile->walkable_neighbor_flags[mobility] & DIRECTIONAL_BIT_MASKS__02352770[direction & DIRECTION_MASK]))
        return FALSE;

    if (front_tile->monster == NULL)
        return TRUE;

    *out_monster_in_target_position = TRUE;
    return FALSE;
}

bool8 IsAtJunction(struct entity *monster)
{
    enum mobility_type mobility = GetMobilityTypeCheckSlipAndFloating(monster, GetEntInfo(monster)->id);

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
            mobility = MOBILITY_INTANGIBLE;
        }
    }
    #else
    mobility = GetDirectionalMobilityType(monster, mobility, DIR_NONE_UNSIGNED);
    #endif

    if (mobility == MOBILITY_INTANGIBLE)
    {
        struct monster *pokemon_info = GetEntInfo(monster);
        pokemon_info->mobile_turn_timer += DungeonRandInt(100);
        if (pokemon_info->mobile_turn_timer < 200)
            return FALSE;

        pokemon_info->mobile_turn_timer = 0;
        return TRUE;
    }

    const struct tile *map_tile;
    if (SECONDARY_TERRAIN_TYPES[DUNGEON_PTR[0]->gen_info.tileset_id] == SECONDARY_TERRAIN_LAVA &&
        mobility == MOBILITY_SECONDARY &&
        IqSkillIsEnabled(monster, IQ_LAVA_EVADER))
        mobility = MOBILITY_NORMAL;

    map_tile = GetTile(monster->pos.x, monster->pos.y);
    u8 walkable_neighbor_flags = map_tile->walkable_neighbor_flags[mobility];
    /*
    Check for configurations of open tiles that are considered junctions; i.e., shaped like a 'T' or '+'.
    X=Wall, O=Open

    0x54  0x51  0x45  0x15  0x55
    XOX   XOX   XXX   XOX   XOX
    OOO   OOX   OOO   XOO   OOO
    XXX   XOX   XOX   XOX   XOX
    */
    if (walkable_neighbor_flags == 0x54)
        return TRUE;
    if (walkable_neighbor_flags == 0x51)
        return TRUE;
    if (walkable_neighbor_flags == 0x45)
        return TRUE;
    if (walkable_neighbor_flags == 0x15)
        return TRUE;
    if (walkable_neighbor_flags == 0x55)
        return TRUE;

    return FALSE;
}
