#ifndef PMDSKY_DUNGEON_LOGIC_2_H
#define PMDSKY_DUNGEON_LOGIC_2_H

#include "dungeon_mode.h"

// Returns a boolean indicating whether or not the given monster can throw items based on its monster ID.
bool8 MonsterCanThrowItems(struct monster *monster);
bool8 ov29_02302388(struct entity *entity);
bool8 UpdateStateFlags(struct monster *monster, s32 flag, bool8 value);
bool8 IsProtectedFromNegativeStatus(struct entity *user, struct entity *target, bool8 log_message);
bool8 ov29_023024E0(struct entity *entity, bool8 check_blinded);
void AddExpSpecial(struct entity *attacker, struct entity *defender, s32 base_exp);

#endif //PMDSKY_DUNGEON_LOGIC_2_H
