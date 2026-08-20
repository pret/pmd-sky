#ifndef PMDSKY_MAIN_02042AF8_H
#define PMDSKY_MAIN_02042AF8_H

#include "util.h"

struct unk_020AFED4 {
    u8 field_0x0[8];
    s32 *field_0x8;
};

struct unk_02043148 {
    s32 field_0x0;
    s16 field_0x4[1000];
    s8 field_0x7D4;
    s8 field_0x7D5;
    s8 field_0x7D6;
    u8 field_0x7D7[0x139];
    s16 field_0x910;
    u8 field_0x912[0xFAA];
    u32 field_0x18BC;
};

struct unk_020AFEE0 {
    u16 field_0x0;
    u16 field_0x2;
    struct unk_02043148 *field_0x4;
    u8 *field_0x8;
    s32 field_0xC;
    u32 field_0x10;
};

extern struct unk_020AFED4 UNK_STORAGE_STRUCT_0XC;
extern struct unk_020AFEE0 UNK_STORAGE_STRUCT_0X14;


void sub_02010044(s16 a);
void sub_020444B0(void);
s32 IsStorageFull(s32 a);
void sub_0202D134(s8 a);
s32 sub_0202C620(s8 a);
bool8 IsCollectionMenuActive(s8 a);
bool8 IsCollectionMenuState3(s8 a);

void ClearBagSelectedItemTable(void);

#endif
