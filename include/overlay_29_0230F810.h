#ifndef PMDSKY_OVERLAY_29_0230F810_H
#define PMDSKY_OVERLAY_29_0230F810_H

#include "util.h"

#include "dungeon_mode.h"

// Checks if a monster is holding a certain item that isn't disabled by Klutz.
bool8 ItemIsActive__0230F810(struct entity *entity, enum item_id item_id);
bool8 TeamMemberHasExclusiveItemEffectActive(enum exclusive_item_effect_id effect_id);

#endif //PMDSKY_OVERLAY_29_0230F810_H
