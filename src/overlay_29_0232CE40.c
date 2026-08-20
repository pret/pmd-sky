#include "overlay_29_0232CE40.h"

extern s16 ov10_022C456C;

extern s32 ov29_02332F18(struct entity *attacker, struct entity *defender, struct move *move, s16 a, enum item_id item_id);

extern void TryActivateIdentifyCondition(struct entity *user, struct entity *target);

bool8 DoMoveHpGauge(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryActivateIdentifyCondition(attacker, defender);

    return TRUE;
}

bool8 DoMoveVacuumCut(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    return ov29_02332F18(attacker, defender, move, ov10_022C456C, item_id) != 0;
}
