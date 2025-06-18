#include "dungeon_action_helper.h"
#include "direction.h"
#include "dungeon_action.h"

void SetActionUseMoveAi(struct action_data *monster_action, s16 move_index, u8 direction)
{
    SetMonsterActionFields(monster_action, ACTION_USE_MOVE_AI);
    monster_action->action_parameters[0].action_use_idx = move_index;
    if (direction != DIR_NONE_UNSIGNED)
        monster_action->direction = direction & DIRECTION_MASK;
}
