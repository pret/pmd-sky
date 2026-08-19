#include "overlay_29_0232CA14.h"
#include "move_orb_effects.h"

extern void RevealWholeFloor(struct entity *user, struct entity *target);
extern void TryInflictPetrifiedStatus(struct entity *user, struct entity *target);
extern void TryPounce(struct entity *user, struct entity *target, s32);
extern void TryTrawl(struct entity *user, struct entity *target);

bool8 DoMoveSlowDown(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    LowerSpeed(attacker, defender, 1, TRUE);

    return TRUE;
}

bool8 DoMoveSearchlight(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    RevealWholeFloor(attacker, defender);

    return TRUE;
}

bool8 DoMovePetrify(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictPetrifiedStatus(attacker, defender);

    return TRUE;
}

bool8 DoMovePounce(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryPounce(attacker, defender, 8);

    return TRUE;
}

bool8 DoMoveTrawl(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryTrawl(attacker, defender);

    return TRUE;
}
