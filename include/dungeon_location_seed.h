#ifndef PMDSKY_DUNGEON_LOCATION_SEED_H
#define PMDSKY_DUNGEON_LOCATION_SEED_H

#include <nitro/types.h>
#include <nitro/misc.h>
#include "enums.h"

// Eight-byte dungeon location and PRNG preseed. RunDungeon copies the input
// at dungeon_init + 0x14 to dungeon + 0x750, and populates a separate output
// at dungeon_init + 0xB8 on a failure path.
typedef struct dungeon_location_seed {
    union {
        u32 raw;
        struct {
            enum dungeon_id dungeon_id; // 0x0
            u8 floor; // 0x1: For rescue input, the target floor checked by GetFloorType
            u8 field_0x2; // Unknown; cleared in the output block
            u8 field_0x3; // Unknown, possibly padding; cleared in the output block
        };
    };
    // 0x4: PRNG preseed. RunDungeon copies the rescue input directly from dungeon_init
    // to dungeon::rescue_prng_preseed_23_bit; no independent use of the copy
    // inside dungeon::rescue_location_seed has been identified. The output
    // block receives dungeon::rescue_prng_preseed_23_bit.
    u32 prng_preseed_23_bit;
} dungeon_location_seed;

#endif // PMDSKY_DUNGEON_LOCATION_SEED_H
