#ifndef PMDSKY_MAIN_02042AF8_H
#define PMDSKY_MAIN_02042AF8_H

#include "util.h"

struct unk_020AFED4 {
    u8 field_0x0[8];
    s32 *field_0x8;
};

struct unk_020AFEE0 {
    u8 field_0x0[8];
    u8 *field_0x8;
};

extern struct unk_020AFED4 UNK_STORAGE_STRUCT_0XC;
extern struct unk_020AFEE0 UNK_STORAGE_STRUCT_0X14;


void ClearBagSelectedItemTable(void);

#endif
