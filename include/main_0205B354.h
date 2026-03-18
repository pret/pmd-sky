#ifndef PMDSKY_MAIN_0205B354_H
#define PMDSKY_MAIN_0205B354_H

#include "util.h"

struct unkStruct_sub_0205B354 {
    u8 fill0[0x18];
    u8 unk18[2];
    u8 fill1A[0x45 - 0x1A];
    u8 unk45;
};

bool8 sub_0205B354(struct unkStruct_sub_0205B354 *ptr);

#endif //PMDSKY_MAIN_0205B354_H
