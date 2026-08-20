#ifndef PMDSKY_OVERLAY_29_022FF898_H
#define PMDSKY_OVERLAY_29_022FF898_H

#include "dungeon_mode.h"

// Checks if a monster is holding a certain item that isn't disabled by Klutz.
bool8 ItemIsActive__022FF898(struct entity *entity, enum item_id item_id);
#ifndef JAPAN
enum mobility_type GetMobilityTypeAfterIqSkills(struct entity* entity, enum mobility_type mobility);
#endif

#endif //PMDSKY_OVERLAY_29_022FF898_H
