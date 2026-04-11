#include "main_02014CEC.h"
#include "enums.h"

bool8 Is2TurnsMove(enum move_id move_id)
{
    if (move_id == MOVE_SOLARBEAM) return TRUE;
    else if (move_id == MOVE_SKY_ATTACK) return TRUE;
    else if (move_id == MOVE_RAZOR_WIND) return TRUE;
    else if (move_id == MOVE_FOCUS_PUNCH) return TRUE;
    else if (move_id == MOVE_SKULL_BASH) return TRUE;
    else if (move_id == MOVE_FLY) return TRUE;
    else if (move_id == MOVE_BOUNCE) return TRUE;
    else if (move_id == MOVE_DIVE) return TRUE;
    else if (move_id == MOVE_DIG) return TRUE;
    else if (move_id == MOVE_SHADOW_FORCE) return TRUE;
    else return FALSE;
}

bool8 IsRegularAttackOrProjectile(enum move_id move_id)
{
    if (move_id == MOVE_REGULAR_ATTACK)
        return TRUE;

    return move_id == MOVE_PROJECTILE;
}
