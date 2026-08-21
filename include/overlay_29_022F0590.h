#ifndef PMDSKY_OVERLAY_29_022F0590_H
#define PMDSKY_OVERLAY_29_022F0590_H

#include "util.h"

#include "dungeon_mode.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__022F0590(struct entity *entity);
void ov29_022F05B4(struct entity* a, struct entity* b, bool8 freeze);
void ov29_022F05E4(void);
s32 TalkToSecretBazaarNpcStandard(struct entity* a, struct entity* b, s32 c);
s32 ov29_022F0618(struct entity* a, struct entity* b, s32 c, s32 d);
s32 TalkToSecretBazaarNpcWithYesNoMenu(struct entity* a, struct entity* b, s32 c, s32 d);

#endif //PMDSKY_OVERLAY_29_022F0590_H
