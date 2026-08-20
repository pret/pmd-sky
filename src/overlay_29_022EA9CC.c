#include "overlay_29_022EA9CC.h"
#include "dg_random.h"

extern prng_state DUNGEON_PRNG_STATE;

u32 GetDungeonRngPreseed(void)
{
    return DUNGEON_PRNG_STATE.preseed;
}

void SetDungeonRngPreseed(u32 preseed)
{
    DUNGEON_PRNG_STATE.preseed = preseed;
}
