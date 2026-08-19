#include "overlay_29_022EAC34.h"
#include "dg_random.h"

extern prng_state DUNGEON_PRNG_STATE;

void DungeonRngUnsetSecondary(void)
{
    DUNGEON_PRNG_STATE.use_secondary = FALSE;
    DUNGEON_PRNG_STATE.idx_secondary = 0;
}

void DungeonRngSetSecondary(s32 idx)
{
    DUNGEON_PRNG_STATE.use_secondary = TRUE;
    DUNGEON_PRNG_STATE.idx_secondary = idx;
}

void DungeonRngSetPrimary(void)
{
    DUNGEON_PRNG_STATE.use_secondary = FALSE;
}
