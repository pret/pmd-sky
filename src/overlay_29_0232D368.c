#include "overlay_29_0232D368.h"

extern void TryInflictLuckyChantStatus(struct entity *user, struct entity *target);

bool8 DoMoveLuckyChant(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictLuckyChantStatus(attacker, defender);

    return TRUE;
}
