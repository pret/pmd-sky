#include "overlay_29_022F9720.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"

#ifdef JAPAN
bool8 DefenderAbilityIsActive__022F96CC(struct entity *attacker, struct entity *defender, enum ability_id ability_id)
#else
bool8 DefenderAbilityIsActive__022F96CC(struct entity *attacker, struct entity *defender, enum ability_id ability_id, bool8 attacker_ability_enabled)
#endif
{
    if (attacker != defender &&
        IsMonster__022F9720(attacker) &&
#ifndef JAPAN
        attacker_ability_enabled &&
#endif
        AbilityIsActiveVeneer(attacker, ABILITY_MOLD_BREAKER))
        return FALSE;

    return AbilityIsActiveVeneer(defender, ability_id);
}

bool8 IsMonster__022F9720(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) == ENTITY_MONSTER;
}
