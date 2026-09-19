#ifndef PMDSKY_OVERLAY_29_022E32E8_H
#define PMDSKY_OVERLAY_29_022E32E8_H

#include "dungeon_mode.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__022E32E8(struct entity *entity);
// Checks if a monster is holding a certain item that isn't disabled by Klutz.
bool8 ItemIsActive__022E330C(struct entity *entity, enum item_id item_id);
s16 GetVisibilityRange();
void ov29_022E335C(void);
void RevealWholeFloor(struct entity *user, struct entity *target);
void ov29_022E34B0(u8 param_1);
void ov29_022E34C8(void);
bool8 ov29_022E3534(struct display_data *display);
void ov29_022E3560(u8 param_1);
u8 ov29_022E3570(void);
bool8 DungeonScreenEffectActive(void);
void ov29_022E3590(struct entity *entity, s32 id, s32 param_3);

#endif //PMDSKY_OVERLAY_29_022E32E8_H
