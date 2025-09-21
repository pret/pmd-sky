#include "overlay_29_02311BF8.h"
#include "dungeon_items.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"

#ifdef JAPAN
bool8 DefenderAbilityIsActive__02311B94(struct entity *attacker, struct entity *defender, enum ability_id ability_id)
#else
bool8 DefenderAbilityIsActive__02311B94(struct entity *attacker, struct entity *defender, enum ability_id ability_id, bool8 attacker_ability_enabled)
#endif
{
    if (attacker != defender)
    {
        bool8 is_monster;
        if (attacker == NULL)
            is_monster = FALSE;
        else
            is_monster = GetEntityType(attacker) == ENTITY_MONSTER;
        if (is_monster &&
#ifndef JAPAN
            attacker_ability_enabled &&
#endif
            AbilityIsActiveVeneer(attacker, ABILITY_MOLD_BREAKER))
            return FALSE;
    }

    return AbilityIsActiveVeneer(defender, ability_id);
}

bool8 ItemIsActive__02311BF8(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}
