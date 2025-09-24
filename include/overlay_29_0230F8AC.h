#ifndef PMDSKY_OVERLAY_29_0230F8AC_H
#define PMDSKY_OVERLAY_29_0230F8AC_H

#include "dungeon_mode.h"

// Checks if a monster is a team member under the effects of a certain exclusive item effect.
bool8 ExclusiveItemEffectIsActive__0230F8AC(struct entity *entity, enum exclusive_item_effect_id effect_id);
u8 FindDirectionOfAdjacentMonsterWithItem(struct entity *entity, enum item_id item_id);
// Checks if an entity is a monster (entity type 1).
bool8 IsMonster__0230F980(struct entity *entity);

#endif //PMDSKY_OVERLAY_29_0230F8AC_H
