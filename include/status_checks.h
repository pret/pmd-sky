#ifndef PMDSKY_STATUS_CHECKS_H
#define PMDSKY_STATUS_CHECKS_H

#include "dungeon_mode.h"

// Returns true if the monster has any status problem that prevents it from acting
bool8 HasStatusThatPreventsActing(struct entity *monster);

#endif //PMDSKY_STATUS_CHECKS_H
