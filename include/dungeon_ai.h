#ifndef PMDSKY_DUNGEON_AI_H
#define PMDSKY_DUNGEON_AI_H

#include "dungeon_mode.h"

// Runs the AI for a single monster to determine whether the monster can act and which action it should perform if so
void RunMonsterAi(struct entity *monster, u32 unused);

#endif //PMDSKY_DUNGEON_AI_H
