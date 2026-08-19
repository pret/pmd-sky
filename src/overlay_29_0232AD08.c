#include "overlay_29_0232AD08.h"

extern void TryInflictLightScreenStatus(struct entity *user, struct entity *target);

bool8 DoMoveLightScreen(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictLightScreenStatus(attacker, defender);

    return TRUE;
}
