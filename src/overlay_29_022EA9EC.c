#include "overlay_29_022EA9EC.h"

extern u32 DUNGEON_PRNG_STATE[];
extern u32 DUNGEON_PRNG_STATE_SECONDARY_VALUES[];

void InitDungeonRng(u32 seed) {
    DUNGEON_PRNG_STATE[3] = seed|1;
    s32 scratch_0 = 0;
    DUNGEON_PRNG_STATE[1] = scratch_0;
    do {
        DUNGEON_PRNG_STATE_SECONDARY_VALUES[scratch_0]=seed;
        scratch_0++;
    } while (scratch_0<5);
}
