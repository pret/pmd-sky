#ifndef PMDSKY_OVERLAY_29_0230AB58_H
#define PMDSKY_OVERLAY_29_0230AB58_H

#include "dungeon_mode.h"

// Checks whether Scrappy should activate.
// Scrappy activates when the ability is active on the attacker, the move type is Normal or Fighting, and the defender is a Ghost type.
bool8 ScrappyShouldActivate(struct entity *attacker, struct entity *defender, enum type_id attack_type);

#endif //PMDSKY_OVERLAY_29_0230AB58_H
