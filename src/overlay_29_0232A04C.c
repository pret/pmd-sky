#include "overlay_29_0232A04C.h"

extern bool8 DoMoveTakeaway(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

bool8 DoMoveDamageStealItem(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    return DoMoveTakeaway(attacker, defender, move, item_id);
}
