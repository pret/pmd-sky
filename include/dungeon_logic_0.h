#ifndef PMDSKY_DUNGEON_LOGIC_0_H
#define PMDSKY_DUNGEON_LOGIC_0_H

#include "dungeon_mode.h"

// Checks if a monster has the sleep, nightmare, or yawning status. Note that this excludes the napping status.
bool8 IsMonsterDrowsy(struct entity *monster);
//Checks if a monster has one of the statuses in the "burn" group, which includes the traditionally non-volatile status conditions (except sleep) in the main series: STATUS_BURN, STATUS_POISONED, STATUS_BADLY_POISONED, STATUS_PARALYSIS, and STATUS_IDENTIFYING.
// STATUS_IDENTIFYING is probably included based on enum status_id? Unless it's handled differently somehow.
bool8 MonsterHasNonvolatileNonsleepStatus(struct entity *monster);

#endif //PMDSKY_DUNGEON_LOGIC_0_H
