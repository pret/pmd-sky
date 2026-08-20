#include "main_02042B84.h"
#include "main_02042AF8.h"
#include "main_02001188.h"

void *MemAlloc(u32 size, u32 nmemb);

s32 IsBagItemIndexSelected(s32 idx)
{
    return UNK_STORAGE_STRUCT_0XC.field_0x8[idx];
}

void AllocUnkBagStruct(void)
{
    UNK_STORAGE_STRUCT_0XC.field_0x8 = MemAlloc(0xC8, 8);
    ClearBagSelectedItemTable();
}

void FreeUnkBagStruct(void)
{
    MemFree(UNK_STORAGE_STRUCT_0XC.field_0x8);
    UNK_STORAGE_STRUCT_0XC.field_0x8 = 0;
}
