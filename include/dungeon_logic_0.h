#ifndef PMDSKY_DUNGEON_LOGIC_0_H
#define PMDSKY_DUNGEON_LOGIC_0_H

#include "dungeon_mode.h"

// Checks if a monster has the sleep, nightmare, or yawning status. Note that this excludes the napping status.
bool8 IsMonsterDrowsy(struct entity *monster);

#endif //PMDSKY_DUNGEON_LOGIC_0_H
