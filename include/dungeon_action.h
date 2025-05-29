#ifndef PMDSKY_DUNGEON_ACTION_H
#define PMDSKY_DUNGEON_ACTION_H

#include "dungeon_mode.h"

// Clears the fields related to AI in the monster's data struct, setting them all to 0.
// Specifically, monster::action::action_id, monster::action::action_use_idx and monster::action::field_0xA are cleared.
//
// monster_action: Pointer to the monster's action field
void ClearMonsterActionFields(struct action_data *monster_action);
// Sets some the fields related to AI in the monster's data struct.
// Specifically, monster::action::action_id, monster::action::action_use_idx and monster::action::field_0xA. The last 2 are always set to 0.
//
// action_pointer: Pointer to the monster's action field
// action: Value to set monster::action::action_id to.
void SetMonsterActionFields(struct action_data *monster_action, enum action action_id);

#endif //PMDSKY_DUNGEON_ACTION_H
