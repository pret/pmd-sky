#include "overlay_29_0232D270.h"

extern void TryInflictGastroAcidStatus(struct entity *user, struct entity *target, bool8 displayMessage, bool8 onlyCheck);

extern void TryInflictAquaRingStatus(struct entity *user, struct entity *target);

bool8 DoMoveAquaRing(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictAquaRingStatus(attacker, defender);

    return TRUE;
}

bool8 DoMoveGastroAcid(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictGastroAcidStatus(attacker, defender, TRUE, FALSE);

    return TRUE;
}
