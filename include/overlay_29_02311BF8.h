#ifndef PMDSKY_OVERLAY_29_02311BF8_H
#define PMDSKY_OVERLAY_29_02311BF8_H

#include "dungeon_mode.h"

// Checks if a defender has an active ability that isn't disabled by an attacker's Mold Breaker.
#ifdef JAPAN
bool8 DefenderAbilityIsActive__02311B94(struct entity *attacker, struct entity *defender, enum ability_id ability_id);
#else
bool8 DefenderAbilityIsActive__02311B94(struct entity *attacker, struct entity *defender, enum ability_id ability_id, bool8 attacker_ability_enabled);
#endif
// Checks if a monster is holding a certain item that isn't disabled by Klutz.
bool8 ItemIsActive__02311BF8(struct entity *entity, enum item_id item_id);

#endif //PMDSKY_OVERLAY_29_02311BF8_H
