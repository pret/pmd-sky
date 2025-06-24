#ifndef PMDSKY_OVERLAY_29_02347B50_H
#define PMDSKY_OVERLAY_29_02347B50_H

#include "dungeon_mode.h"

// Checks if a monster is holding a certain item that isn't disabled by Klutz.
bool8 ItemIsActive__02347B50(struct entity *entity, enum item_id item_id);
// Checks if a monster is a team member under the effects of a certain exclusive item effect.
bool8 ExclusiveItemEffectIsActive__02347B80(struct entity *entity, enum exclusive_item_effect_id effect_id);

#endif //PMDSKY_OVERLAY_29_02347B50_H
