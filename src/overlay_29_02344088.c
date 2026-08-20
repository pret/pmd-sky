#include "overlay_29_02344088.h"
#include "main_02001188.h"
#include "overlay_29_0234B024.h"

extern u8 ov10_022C6C75[];

extern u8 ov10_022C6C77[];

extern u8 ov10_022C6C78[];

extern u8 ov10_022C6C79[];

extern void *FIXED_ROOM_DATA_PTR;

void CloseFixedBin(void)
{
    MemFree(FIXED_ROOM_DATA_PTR);
    FIXED_ROOM_DATA_PTR = NULL;
}

bool8 AreOrbsAllowed(u32 dungeon_id)
{
    if (dungeon_id == 0 || dungeon_id >= 0xA5) {
        return TRUE;
    }

    return ov10_022C6C77[dungeon_id * 12];
}

bool8 AreTileJumpsAllowed(u32 dungeon_id)
{
    if (dungeon_id == 0 || dungeon_id >= 0xA5) {
        return TRUE;
    }

    return ov10_022C6C78[dungeon_id * 12];
}

bool8 AreTrawlOrbsAllowed(u32 dungeon_id)
{
    if (dungeon_id == 0 || dungeon_id >= 0xA5) {
        return TRUE;
    }

    return ov10_022C6C79[dungeon_id * 12];
}

bool8 AreOrbsAllowedVeneer(u32 dungeon_id)
{
    return AreOrbsAllowed(dungeon_id);
}

bool8 AreLateGameTrapsEnabled(u32 dungeon_id)
{
    return ov10_022C6C75[dungeon_id * 12];
}
