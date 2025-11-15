#ifndef PMDSKY_DUNGEON_LOGIC_7_H
#define PMDSKY_DUNGEON_LOGIC_7_H

#include "dungeon_mode.h"
#include "util.h"

bool8 IsMonsterLoneOutlaw(struct monster* monster_info);
bool8 IsSecretBazaarNpc(struct entity *entity);
bool8 IsTeamMemberOnFirstTurnInFixedRoom(struct monster *monster);

#endif //PMDSKY_DUNGEON_LOGIC_7_H
