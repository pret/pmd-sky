#include "overlay_29_02301A60.h"
#include "dungeon_util_static.h"
#include "dungeon_pokemon_attributes.h"

#ifdef JAPAN
bool8 DefenderAbilityIsActive__02301A0C(struct entity *attacker, struct entity *defender, enum ability_id ability_id)
#else
bool8 DefenderAbilityIsActive__02301A0C(struct entity *attacker, struct entity *defender, enum ability_id ability_id, bool8 attacker_ability_enabled)
#endif
{
    if (attacker != defender &&
        IsMonster__02301A60(attacker) &&
#ifndef JAPAN
        attacker_ability_enabled &&
#endif
        AbilityIsActive(attacker, ABILITY_MOLD_BREAKER))
        return FALSE;

    return AbilityIsActive(defender, ability_id);
}

bool8 IsMonster__02301A60(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) == ENTITY_MONSTER;
}
