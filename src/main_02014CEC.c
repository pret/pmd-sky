#include "main_02014CEC.h"

bool8 IsRegularAttackOrProjectile(enum move_id move_id)
{
    if (move_id == MOVE_REGULAR_ATTACK)
        return TRUE;

    return move_id == MOVE_PROJECTILE;
}
