#include "main_02043380.h"
#include "main_02042AF8.h"
#include "main_0202C748.h"

s32 sub_02043380(s32 a)
{
    if (a == 8) {
        return 0;
    }
    return IsStorageFull(a);
}

void sub_02043398(void)
{
    struct unk_02043148 *contents = UNK_STORAGE_STRUCT_0X14.field_0x4;

    if (contents == NULL) {
        return;
    }
    sub_0202D134(contents->field_0x7D4);
}

s32 sub_020433C0(void)
{
    return sub_0202C620(UNK_STORAGE_STRUCT_0X14.field_0x4->field_0x7D4);
}

bool8 sub_020433E0(void)
{
    return UNK_STORAGE_STRUCT_0X14.field_0x4 != NULL;
}

bool8 sub_02043400(void)
{
    struct unk_02043148 *contents = UNK_STORAGE_STRUCT_0X14.field_0x4;

    if (contents == NULL || contents->field_0x7D4 == -2) {
        return 0;
    }
    return IsCollectionMenuActive(contents->field_0x7D4);
}

bool8 sub_02043434(void)
{
    struct unk_02043148 *contents = UNK_STORAGE_STRUCT_0X14.field_0x4;

    if (contents == NULL || contents->field_0x7D4 == -2) {
        return 0;
    }
    return IsCollectionMenuState3(contents->field_0x7D4);
}

s16 sub_02043468(void)
{
    s32 index;

    if (IsCollectionMenuActive(UNK_STORAGE_STRUCT_0X14.field_0x4->field_0x7D4)) {
        index = GetWindowIdSelectedMenuItemIdx(UNK_STORAGE_STRUCT_0X14.field_0x4->field_0x7D4);
    } else {
        index = sub_0202C75C(UNK_STORAGE_STRUCT_0X14.field_0x4->field_0x7D4);
    }
    if (index < 0) {
        return -1;
    }
    return UNK_STORAGE_STRUCT_0X14.field_0x4->field_0x4[index];
}

void ClearStorageSelectedItemTable(void)
{
    s32 i;

    for (i = 0; i < 1000; i++) {
        UNK_STORAGE_STRUCT_0X14.field_0x8[i] = 0;
    }
}

s32 CountSelectedStorageItems(void)
{
    s32 count = 0;
    s32 i;
    u8 *table = UNK_STORAGE_STRUCT_0X14.field_0x8;

    for (i = 0; i < 1000; i++) {
        if (table[i] & 1) {
            count++;
        }
    }
    return count;
}

s16 GetFirstSelectedStorageItemIndex(void)
{
    s32 i;
    u8 *table = UNK_STORAGE_STRUCT_0X14.field_0x8;

    for (i = 0; i < 1000; i++) {
        if (table[i] & 1) {
            return i;
        }
    }
    return -1;
}
