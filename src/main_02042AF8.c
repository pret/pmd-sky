#include "main_02042AF8.h"

extern struct unk_020AFED4 UNK_STORAGE_STRUCT_0XC;

void ClearBagSelectedItemTable(void)
{
    s32 i;

    for (i = 0; i < 0x32; i++) {
        UNK_STORAGE_STRUCT_0XC.field_0x8[i] = 0;
    }
}

s32 sub_02042B20(void)
{
    s32 n;
    s32 i;

    n = 0;

    for (i = 0; i < 0x32; i++) {
        if (UNK_STORAGE_STRUCT_0XC.field_0x8[i] & 1) {
            n++;
        }
    }

    return n;
}

s32 sub_02042B50(void)
{
    s32 i;

    for (i = 0; i < 0x32; i++) {
        if (UNK_STORAGE_STRUCT_0XC.field_0x8[i] & 1) {
            return i;
        }
    }

    return -1;
}
