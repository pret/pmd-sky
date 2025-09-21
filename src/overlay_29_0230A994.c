#include "overlay_29_0230A994.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "exclusive_item.h"

#ifdef JAPAN
bool8 DefenderAbilityIsActive__0230A940(struct entity *attacker, struct entity *defender, enum ability_id ability_id)
#else
bool8 DefenderAbilityIsActive__0230A940(struct entity *attacker, struct entity *defender, enum ability_id ability_id, bool8 attacker_ability_enabled)
#endif
{
    if (attacker != defender &&
        IsMonster__0230A994(attacker) &&
#ifndef JAPAN
        attacker_ability_enabled &&
#endif
        AbilityIsActiveVeneer(attacker, ABILITY_MOLD_BREAKER))
        return FALSE;

    return AbilityIsActiveVeneer(defender, ability_id);
}

bool8 IsMonster__0230A994(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) == ENTITY_MONSTER;
}

bool8 ExclusiveItemEffectIsActive__0230A9B8(struct entity *entity, enum exclusive_item_effect_id effect_id)
{
    struct monster *monster = GetEntInfo(entity);
    if (!monster->is_not_team_member)
        return ExclusiveItemEffectFlagTest(monster->exclusive_item_effect_flags, effect_id);

    return FALSE;
}
