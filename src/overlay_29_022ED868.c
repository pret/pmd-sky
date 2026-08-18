#include "overlay_29_022ED868.h"
#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR;

s32 AreLateGameTrapsEnabled(enum fixed_room_id fixed_room_id);

s32 AreLateGameTrapsEnabledWrapper(void)
{
    return AreLateGameTrapsEnabled(DUNGEON_PTR->gen_info.fixed_room_id);
}
