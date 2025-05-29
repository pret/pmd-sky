#ifndef PMDSKY_OVERLAY_29_022FB538_H
#define PMDSKY_OVERLAY_29_022FB538_H

#include "dungeon_mode.h"

#ifndef JAPAN
// If there is a decoy on the floor that the entity can see, sets the entity's decoy_ai_tracker to 1 or 2,
// depending on whether the attacker who caused the decoy status is on the team or not, respectively.
void SetDecoyAiTracker(struct entity* entity);
#endif

#endif //PMDSKY_OVERLAY_29_022FB538_H
