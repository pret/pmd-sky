#ifndef PMDSKY_OVERLAY_29_0230558C_H
#define PMDSKY_OVERLAY_29_0230558C_H

#include "dungeon_mode.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__0230558C(struct entity *entity);
void ov29_023055B0(s32 a);
void CheckNonLeaderTile(struct entity *entity);
void ov29_02305814(struct entity *entity, bool8 a);
s32 EndNegativeStatusCondition(struct entity *user, struct entity *target, bool8 a, bool8 b, bool8 c);

#endif //PMDSKY_OVERLAY_29_0230558C_H
