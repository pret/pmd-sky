#include "overlay_29_022FF898.h"
#include "dungeon_items.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_pokemon_attributes_1.h"

bool8 ItemIsActive__022FF898(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActive(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}

#ifndef JAPAN
enum mobility_type GetMobilityTypeAfterIqSkills(struct entity* entity, enum mobility_type mobility)
{
    if (mobility != MOBILITY_INTANGIBLE && IqSkillIsEnabled(entity, IQ_ALL_TERRAIN_HIKER)) {
        mobility = MOBILITY_HOVERING;
    }

    if (IqSkillIsEnabled(entity, IQ_ABSOLUTE_MOVER)) {
        mobility = MOBILITY_INTANGIBLE;
    }

    return mobility;
}
#endif
