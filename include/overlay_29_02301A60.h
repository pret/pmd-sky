#ifndef PMDSKY_OVERLAY_29_02301A60_H
#define PMDSKY_OVERLAY_29_02301A60_H

#include "dungeon_mode.h"

// Checks if a defender has an active ability that isn't disabled by an attacker's Mold Breaker.
#ifdef JAPAN
bool8 DefenderAbilityIsActive__02301A0C(struct entity *attacker, struct entity *defender, enum ability_id ability_id);
#else
bool8 DefenderAbilityIsActive__02301A0C(struct entity *attacker, struct entity *defender, enum ability_id ability_id, bool8 attacker_ability_enabled);
#endif
// Checks if an entity is a monster (entity type 1).
bool8 IsMonster__02301A60(struct entity *entity);

#endif //PMDSKY_OVERLAY_29_02301A60_H
