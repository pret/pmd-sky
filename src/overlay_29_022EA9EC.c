#include "overlay_29_022EA9EC.h"

extern prng_state DUNGEON_PRNG_STATE;
extern u32 DUNGEON_PRNG_STATE_SECONDARY_VALUES[];

void InitDungeonRng(u32 seed) {
    DUNGEON_PRNG_STATE.last_value_primary = seed|1;
    s32 scratch_0 = 0;
    DUNGEON_PRNG_STATE.seq_num_primary = scratch_0;
    do {
        DUNGEON_PRNG_STATE_SECONDARY_VALUES[scratch_0]=seed;
        scratch_0++;
    } while (scratch_0<5);
}
