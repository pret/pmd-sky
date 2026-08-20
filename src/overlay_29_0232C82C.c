#include "overlay_29_0232C82C.h"

extern void RevealEnemies(struct entity *user, struct entity *target);

extern void RevealItems(struct entity *user, struct entity *target);
extern void TryInflictMuzzledStatus(struct entity *user, struct entity *target, bool8 onlyCheck);

bool8 DoMoveNoMove(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictMuzzledStatus(attacker, defender, FALSE);

    return TRUE;
}

bool8 DoMoveScan(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    RevealItems(attacker, defender);

    return TRUE;
}

bool8 DoMovePowerEars(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    RevealEnemies(attacker, defender);

    return TRUE;
}
