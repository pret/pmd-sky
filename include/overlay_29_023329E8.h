#ifndef PMDSKY_OVERLAY_29_023329E8_H
#define PMDSKY_OVERLAY_29_023329E8_H

#include "dungeon_mode.h"

// Checks if a monster is a team member under the effects of a certain exclusive item effect.
bool8 ExclusiveItemEffectIsActive__023329E8(struct entity *entity, enum exclusive_item_effect_id effect_id);
// Checks if a defender has an active ability that isn't disabled by an attacker's Mold Breaker.
#ifdef JAPAN
bool8 DefenderAbilityIsActive__02332A0C(struct entity *attacker, struct entity *defender, enum ability_id ability_id);
#else
bool8 DefenderAbilityIsActive__02332A0C(struct entity *attacker, struct entity *defender, enum ability_id ability_id, bool8 attacker_ability_enabled);
#endif

#endif //PMDSKY_OVERLAY_29_023329E8_H
