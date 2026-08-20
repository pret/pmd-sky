#include "main_02042AF8.h"

void ClearBagSelectedItemTable(void)
{
    s32 i;

    for (i = 0; i < 0x32; i++) {
        UNK_STORAGE_STRUCT_0XC.field_0x8[i] = 0;
    }
}
