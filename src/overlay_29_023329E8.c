#include "overlay_29_023329E8.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "exclusive_item.h"

bool8 ExclusiveItemEffectIsActive__023329E8(struct entity *entity, enum exclusive_item_effect_id effect_id)
{
    struct monster *monster = GetEntInfo(entity);
    if (!monster->is_not_team_member)
        return ExclusiveItemEffectFlagTest(monster->exclusive_item_effect_flags, effect_id);

    return FALSE;
}

#ifdef JAPAN
bool8 DefenderAbilityIsActive__02332A0C(struct entity *attacker, struct entity *defender, enum ability_id ability_id)
#else
bool8 DefenderAbilityIsActive__02332A0C(struct entity *attacker, struct entity *defender, enum ability_id ability_id, bool8 attacker_ability_enabled)
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
