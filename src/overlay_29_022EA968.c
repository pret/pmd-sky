#include "overlay_29_022EA968.h"
#include "dg_random.h"

extern prng_state DUNGEON_PRNG_STATE;

void SetDungeonRngPreseed23Bit(u32 preseed)
{
    DUNGEON_PRNG_STATE.preseed = (preseed | 1) & 0xFFFFFF;
}
