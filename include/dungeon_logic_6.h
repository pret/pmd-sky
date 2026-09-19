#ifndef PMDSKY_DUNGEON_LOGIC_6_H
#define PMDSKY_DUNGEON_LOGIC_6_H

#include "dungeon_mode.h"
#include "util.h"

bool8 IsBehaviorLoneOutlaw(enum monster_behavior behavior);
// Checks if a behavior ID corresponds to one of the Secret Bazaar NPCs.
bool8 IsSecretBazaarNpcBehavior(enum monster_behavior behavior);
void ov29_022EFB20(bool8 param_1);
void ov29_022EFB84(bool8 param_1);

#endif //PMDSKY_DUNGEON_LOGIC_6_H
