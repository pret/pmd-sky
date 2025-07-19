#ifndef PMDSKY_OVERLAY_29_022F7364_H
#define PMDSKY_OVERLAY_29_022F7364_H

#include "dungeon_mode.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__022F7364(struct entity *entity);
s16 DungeonGetSpriteIndex(s16 monster_id);
u32 JoinedAtRangeCheck2Veneer(u8 joined_at);

#endif //PMDSKY_OVERLAY_29_022F7364_H
