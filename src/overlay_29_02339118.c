#include "overlay_29_02339118.h"
#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR;

s32 AreLateGameTrapsEnabled(enum fixed_room_id fixed_room_id);

struct minimap_display_data* GetMinimapData(void)
{
    struct dungeon *dungeon = DUNGEON_PTR;

    return dungeon != NULL ? &dungeon->minimap_display_data : NULL;
}
