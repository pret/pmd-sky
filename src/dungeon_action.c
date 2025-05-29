#include "dungeon_action.h"

extern bool8 GetCanMoveFlag(s16 monster_id);

void ClearMonsterActionFields(struct action_data *monster_action)
{
    monster_action->action_id = ACTION_NOTHING;
    monster_action->action_parameters[0].action_use_idx = 0;
    monster_action->action_parameters[1].action_use_idx = 0;
}

void SetMonsterActionFields(struct action_data *monster_action, enum action action_id)
{
    monster_action->action_id = action_id;
    monster_action->action_parameters[0].action_use_idx = 0;
    monster_action->action_parameters[1].action_use_idx = 0;
}

void SetActionPassTurnOrWalk(struct action_data *monster_action, s16 monster_id)
{
    if (GetCanMoveFlag(monster_id))
    {
        monster_action->action_id = ACTION_WALK;
    }
    else
    {
        monster_action->action_id = ACTION_PASS_TURN;
    }
    monster_action->action_parameters[0].action_use_idx = 0;
    monster_action->action_parameters[1].action_use_idx = 0;
}
