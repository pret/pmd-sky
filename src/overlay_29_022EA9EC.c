#include "overlay_29_022EA9EC.h"

extern prng_state DUNGEON_PRNG_STATE;
extern u32 DUNGEON_PRNG_STATE_SECONDARY_VALUES[];
#define DUNGEON_PRNG_LCG_MULTIPLIER 0x5d588b65
#define DUNGEON_PRNG_LCG_INCREMENT_SECONDARY 0x00269ec3

void InitDungeonRng(u32 seed) {
    DUNGEON_PRNG_STATE.last_value_primary = seed|1;
    s32 scratch_0 = 0;
    DUNGEON_PRNG_STATE.seq_num_primary = scratch_0;
    do {
        DUNGEON_PRNG_STATE_SECONDARY_VALUES[scratch_0]=seed;
        scratch_0++;
    } while (scratch_0<5);
}

u16 DungeonRand16Bit(void) {
    u32 mult = DUNGEON_PRNG_LCG_MULTIPLIER;

    if (DUNGEON_PRNG_STATE.use_secondary) {
        u32 increment = DUNGEON_PRNG_LCG_INCREMENT_SECONDARY;
        s32 idx = DUNGEON_PRNG_STATE.idx_secondary;
        u32 val = DUNGEON_PRNG_STATE_SECONDARY_VALUES[idx];
        
        u64 temp = (u64)val * mult;
        temp += increment; 
        
        u32 result = (u32)temp;
        DUNGEON_PRNG_STATE_SECONDARY_VALUES[idx] = result;
        
        return (u16)result;
    } else {
        // Accessing the global directly often changes register allocation
        DUNGEON_PRNG_STATE.seq_num_primary++;
        
        u32 result = (DUNGEON_PRNG_STATE.last_value_primary * mult) + 1;
        DUNGEON_PRNG_STATE.last_value_primary = result;
        
        return (u16)(result >> 16);
    }
}
