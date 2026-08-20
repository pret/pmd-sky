#include "overlay_29_022EBC50.h"
#include "dungeon_mode.h"
#include "enums.h"
#include "dungeon_action.h"

void SetActionRegularAttack(struct action_data *monster_action, u8 direction)
{
    SetMonsterActionFields(monster_action, ACTION_REGULAR_ATTACK);
    if (direction != DIR_NONE_UNSIGNED)
        monster_action->direction = direction & DIRECTION_MASK;
}

void SetActionStruggle(struct action_data *monster_action, u8 direction)
{
    SetMonsterActionFields(monster_action, ACTION_STRUGGLE);
    if (direction != DIR_NONE_UNSIGNED)
        monster_action->direction = direction & DIRECTION_MASK;
}

void SetActionUseMovePlayer(struct action_data* action, u8 monster_index, u8 move_index)
{
    SetMonsterActionFields(action, ACTION_USE_MOVE_PLAYER);
    action->action_parameters[0].action_use_idx = monster_index;
    action->action_parameters[1].action_use_idx = move_index;
}
