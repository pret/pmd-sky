#ifndef PMDSKY_RUN_DUNGEON_1_H
#define PMDSKY_RUN_DUNGEON_1_H

#include "enums.h"
#include "util.h"

bool8 IsBossFight(enum fixed_room_id fixed_room_id);
bool8 IsCurrentFixedRoomBossFight();
bool8 IsMarowakTrainingMaze(void);
bool8 FixedRoomIsSubstituteRoom(void);

#endif //PMDSKY_RUN_DUNGEON_1_H
