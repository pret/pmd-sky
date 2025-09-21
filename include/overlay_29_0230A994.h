#ifndef PMDSKY_OVERLAY_29_0230A994_H
#define PMDSKY_OVERLAY_29_0230A994_H

#include "dungeon_mode.h"

// Checks if a defender has an active ability that isn't disabled by an attacker's Mold Breaker.
#ifdef JAPAN
bool8 DefenderAbilityIsActive__0230A940(struct entity *attacker, struct entity *defender, enum ability_id ability_id);
#else
bool8 DefenderAbilityIsActive__0230A940(struct entity *attacker, struct entity *defender, enum ability_id ability_id, bool8 attacker_ability_enabled);
#endif
// Checks if an entity is a monster (entity type 1).
bool8 IsMonster__0230A994(struct entity *entity);
// Checks if a monster is a team member under the effects of a certain exclusive item effect.
bool8 ExclusiveItemEffectIsActive__0230A9B8(struct entity *entity, enum exclusive_item_effect_id effect_id);

#endif //PMDSKY_OVERLAY_29_0230A994_H
