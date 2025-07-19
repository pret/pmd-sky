#ifndef PMDSKY_DUNGEON_LOGIC_4_H
#define PMDSKY_DUNGEON_LOGIC_4_H

#include "dungeon_mode.h"

// Checks if the entity passed is a valid monster, and if it's at low health (below 25% rounded down)
bool8 HasLowHealth(struct entity *entity);

#endif //PMDSKY_DUNGEON_LOGIC_4_H
