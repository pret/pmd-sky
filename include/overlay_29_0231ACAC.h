#ifndef PMDSKY_OVERLAY_29_0231ACAC_H
#define PMDSKY_OVERLAY_29_0231ACAC_H

#include "dungeon_mode.h"

// Gets the move target-and-range field when used by a given entity.
// entity: entity pointer
// move: move pointer
// is_ai: AI flag (same as GetMoveTargetAndRange)
// return: move target and range
u32 GetEntityMoveTargetAndRange(struct entity *entity, struct move *move, bool8 is_ai);

#endif //PMDSKY_OVERLAY_29_0231ACAC_H
