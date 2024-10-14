#ifndef PMDSKY_OVERLAY_29_022E1A1C_H
#define PMDSKY_OVERLAY_29_022E1A1C_H

#include "dungeon_mode.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
// entity: entity pointer
// return: bool
u8 EntityIsValid__022E1A1C(struct entity *entity);
void UpdateEntityPixelPos(struct entity *entity, struct pixel_position *pixel_pos);
void SetEntityPixelPosXY(struct entity *entity, u32 x, u32 y);
void IncrementEntityPixelPosXY(struct entity *entity, u32 x, u32 y);

#endif //PMDSKY_OVERLAY_29_022E1A1C_H
