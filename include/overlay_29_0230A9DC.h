#ifndef PMDSKY_OVERLAY_29_0230A9DC_H
#define PMDSKY_OVERLAY_29_0230A9DC_H

#include "dungeon_mode.h"

// Checks if a monster is holding a certain item that isn't disabled by Klutz.
bool8 ItemIsActive__0230A9DC(struct entity *entity, enum item_id item_id);
bool8 AftermathCheck(struct entity *attacker, struct entity *defender, s32 damage_source);

#endif //PMDSKY_OVERLAY_29_0230A9DC_H
