#ifndef PMDSKY_INFLICT_STATUS_H
#define PMDSKY_INFLICT_STATUS_H

#include "dungeon_mode.h"

// Checks if the monster is under the effect of Mirror Move.
// Returns 1 if the effects is a status, 2 if it comes from an exclusive item, 0 otherwise.
u8 MirrorMoveIsActive(struct entity *entity);
// Checks if a monster is a team member under the effects of a certain exclusive item effect.
bool8 ExclusiveItemEffectIsActive__023197A8(struct entity *entity, enum exclusive_item_effect_id effect_id);
// Checks if the monster is under the effect of Mist.
// Returns 1 if the effects is a status, 2 if it comes from an exclusive item, 0 otherwise.
u8 MistIsActive(struct entity *entity);
// Checks if the monster is under the effect of Conversion 2 (its type was changed).
// Returns 1 if the effects is a status, 2 if it comes from an exclusive item, 0 otherwise.
u8 Conversion2IsActive(struct entity *entity);

#endif //PMDSKY_INFLICT_STATUS_H
