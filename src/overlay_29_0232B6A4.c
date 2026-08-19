#include "overlay_29_0232B6A4.h"

extern void TryInflictPerishSongStatus(struct entity *user, struct entity *target, bool8 onlyCheck);

bool8 DoMovePerishSong(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictPerishSongStatus(attacker, defender, FALSE);

    return TRUE;
}
