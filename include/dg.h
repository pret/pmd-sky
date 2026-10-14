#ifndef PMDSKY_OVERLAY_29_022E0354_H
#define PMDSKY_OVERLAY_29_022E0354_H

#include "dungeon_init.h"
#include "dungeon.h"
#include "dungeon_mode.h"

// Runs the main dungeon gameplay loop (location 0x022DEF38)
s32 RunDungeon(struct dungeon_init *dungeon_init_data, struct dungeon *dungeon);
// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__022E0354(struct entity *entity);

#endif //PMDSKY_OVERLAY_29_022E0354_H
