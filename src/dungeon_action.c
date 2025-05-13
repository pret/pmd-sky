#include "dungeon_action.h"

void SetMonsterActionFields(struct action_data *action_pointer, enum action action)
{
    action_pointer->action_id = action;
    action_pointer->action_parameters[0].action_use_idx = 0;
    action_pointer->action_parameters[1].action_use_idx = 0;
}
