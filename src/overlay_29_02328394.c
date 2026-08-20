#include "overlay_29_02328394.h"

extern void TryInflictMistStatus(struct entity *user, struct entity *target);

bool8 DoMoveMist(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictMistStatus(attacker, defender);

    return TRUE;
}
