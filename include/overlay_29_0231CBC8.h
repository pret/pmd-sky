#ifndef PMDSKY_OVERLAY_29_0231CBC8_H
#define PMDSKY_OVERLAY_29_0231CBC8_H

#include "dungeon_mode.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__0231CBC8(struct entity *entity);

void ApplyItemEffect(char param_1, u8 param_2, u8 param_3, struct entity *attacker, struct entity *defender, struct item *item);

#endif //PMDSKY_OVERLAY_29_0231CBC8_H
