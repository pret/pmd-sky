#include "overlay_29_022EBC50.h"
#include "dungeon_action.h"

void SetActionRegularAttack(struct action_data *monster_action, u8 direction)
{
    SetMonsterActionFields(monster_action, ACTION_REGULAR_ATTACK);
    if (direction != DIR_NONE_UNSIGNED)
        monster_action->direction = direction & DIRECTION_MASK;
}
