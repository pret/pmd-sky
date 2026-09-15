#include "overlay_29_0232C560.h"
#include "overlay_29_02320764.h"


bool8 DoMoveStayAway(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryWarp(attacker, defender, 1, 0);

    return TRUE;
}
