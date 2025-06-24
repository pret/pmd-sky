#ifndef PMDSKY_OVERLAY_29_0230A994_H
#define PMDSKY_OVERLAY_29_0230A994_H

#include "dungeon_mode.h"

// Checks if an entity is a monster (entity type 1).
bool8 IsMonster__0230A994(struct entity *entity);
// Checks if a monster is a team member under the effects of a certain exclusive item effect.
bool8 ExclusiveItemEffectIsActive__0230A9B8(struct entity *entity, enum exclusive_item_effect_id effect_id);

#endif //PMDSKY_OVERLAY_29_0230A994_H
