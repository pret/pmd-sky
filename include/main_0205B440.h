#ifndef PMDSKY_MAIN_0205B440_H
#define PMDSKY_MAIN_0205B440_H

#include "util.h"

struct unk_022B580C_entry {
    u32 field_0x0;
    s32 field_0x4;
};

struct unk_022B580C {
    u32 field_0x0;
    struct unk_022B580C_entry field_0x4[32];
};

u8* sub_0205B440(void);
void sub_0205B44C(void);
void sub_0205B478(void);

#endif //PMDSKY_MAIN_0205B440_H
