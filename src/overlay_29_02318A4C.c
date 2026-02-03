#include "overlay_29_02318A4C.h"
#include "dungeon_util_static.h"
#include "overlay_29_02315118.h"
#include "overlay_29_02318AB0.h"
#include "overlay_29_0233836C.h"

bool8 IsFloating(struct entity *entity)
{
    if (!EntityIsValid__02315118(entity))
        return FALSE;

    if (GravityIsActive())
        return FALSE;

    if (GetEntInfo(entity)->magnet_rise == 1)
        return TRUE;

    return FALSE;
}

void ov29_02318A90(struct entity* entity, s8 value)
{
    if (IsMonster__02318AB0(entity))
        GetEntInfo(entity)->two_turn_move_invincible = value;
}
