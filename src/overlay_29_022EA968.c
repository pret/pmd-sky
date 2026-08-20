#include "overlay_29_022EA968.h"
#include "dg_random.h"

extern prng_state DUNGEON_PRNG_STATE;

void SetDungeonRngPreseed23Bit(u32 preseed)
{
    DUNGEON_PRNG_STATE.preseed = (preseed | 1) & 0xFFFFFF;
}

u32 GenerateDungeonRngSeed(void)
{
    u32 a = DUNGEON_PRNG_STATE.preseed * 0x5D588B65 + 1;
    u32 b = a * 0x5D588B65 + 1;

    DUNGEON_PRNG_STATE.preseed = b;

    return (((u16) (a >> 16) | (b & 0xFFFF0000)) & 0xFFFFFF) | 1;
}
