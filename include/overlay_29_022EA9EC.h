#ifndef PMDSKY_OVERLAY_29_022EA9EC_H
#define PMDSKY_OVERLAY_29_022EA9EC_H

#include "util.h"

typedef struct prng_state {
    bool8 use_secondary;
    u32 seq_num_primary;
    u32 preseed;
    u32 last_value_primary;
    s32 idx_secondary;
} prng_state;

void InitDungeonRng(u32 seed);

#endif //PMDSKY_OVERLAY_29_022EA9EC_H
