#include "overlay_29_02329FB4.h"

extern void ActivateSportCondition(bool8 water_sport);

bool8 DoMoveSport(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    if (move->id == 0xD4) {
        ActivateSportCondition(FALSE);
    } else {
        ActivateSportCondition(TRUE);
    }

    return TRUE;
}
