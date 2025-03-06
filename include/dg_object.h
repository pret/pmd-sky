#ifndef PMDSKY_OVERLAY_29_022E1A1C_H
#define PMDSKY_OVERLAY_29_022E1A1C_H

#include "dungeon_mode.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__022E1A1C(struct entity *entity);
// Updates an entity's pixel_pos field using the specified pixel_position struct, or its own pos field if it's null.
void UpdateEntityPixelPos(struct entity *entity, struct pixel_position *pixel_pos);
void SetEntityPixelPosXY(struct entity *entity, u32 x, u32 y);
void IncrementEntityPixelPosXY(struct entity *entity, u32 x, u32 y);
u32 ov29_022E1AAC(u32 param_0, u32 param_1);

#endif //PMDSKY_OVERLAY_29_022E1A1C_H
