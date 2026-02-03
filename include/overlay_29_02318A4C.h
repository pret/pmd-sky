#ifndef PMDSKY_OVERLAY_29_02318A4C_H
#define PMDSKY_OVERLAY_29_02318A4C_H

#include "dungeon_mode.h"

// Checks if a monster is currently floating for reasons other than its typing or ability.
// In particular, this checks for Gravity and Magnet Rise.
bool8 IsFloating(struct entity *entity);

void ov29_02318A90(struct entity* entity, s8 value);


#endif //PMDSKY_OVERLAY_29_02318A4C_H
