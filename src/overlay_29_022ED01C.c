#include "overlay_29_022ED01C.h"
#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR;

s32 AreLateGameTrapsEnabled(enum fixed_room_id fixed_room_id);

void SetForcedLossReason(enum forced_loss_reason reason)
{
    DUNGEON_PTR->forced_loss_reason = reason;
}

enum forced_loss_reason GetForcedLossReason(void)
{
    return DUNGEON_PTR->forced_loss_reason;
}
