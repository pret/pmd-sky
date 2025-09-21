#ifndef PMDSKY_MOVE_ORB_EFFECTS_H
#define PMDSKY_MOVE_ORB_EFFECTS_H

#include "dungeon_mode.h"

enum flash_fire_status {
    FLASH_FIRE_STATUS_NONE = 0,
    FLASH_FIRE_STATUS_MAXED = 1,
    FLASH_FIRE_STATUS_NOT_MAXED = 2
};

// Checks whether Flash Fire should activate, assuming the defender is being hit by a Fire-type move.
// This checks that the defender is valid and Flash Fire is active, and that Normalize isn't active on the attacker.
enum flash_fire_status FlashFireShouldActivate(struct entity *attacker, struct entity *defender);

#endif //PMDSKY_MOVE_ORB_EFFECTS_H
