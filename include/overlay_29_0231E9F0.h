#ifndef PMDSKY_OVERLAY_29_0231E9F0_H
#define PMDSKY_OVERLAY_29_0231E9F0_H

#include "dungeon_mode.h"

#include "move.h"

// Gets the maximum PP for a given move. A wrapper around the function in the ARM 9 binary.
// return: max PP for the given move, capped at 99
s16 GetMaxPpWrapper(struct move *move);
void InitMoveWrapper(struct entity *entity, struct move *move, enum move_id move_id);
int MoveIsNotPhysical(enum move_id move_id);
bool8 CategoryIsNotPhysical(s32 category);
void MakeFloorOneRoom(struct entity *user, struct entity *target);

#endif //PMDSKY_OVERLAY_29_0231E9F0_H
