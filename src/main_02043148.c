#include "main_02043148.h"

extern void sub_02044474(void);

extern void sub_020442CC(void);

extern void sub_020445C8(void);

extern void CloseTextBox(s32 id);

extern void CloseCollectionMenu(s32 id);

extern void MemFree(void *ptr);
#include "main_02042AF8.h"

void sub_02043148(s32 index)
{
    sub_02010044(UNK_STORAGE_STRUCT_0X14.field_0x4->field_0x4[index]);
    sub_020444B0();
}

s32 sub_0204316C(s32 a)
{
    return a != 0 ? 5 : 7;
}

void FreeUnkStorageStruct0x18c0(void)
{
    struct unk_02043148 *s = UNK_STORAGE_STRUCT_0X14.field_0x4;

    if (s == NULL) {
        return;
    }

    sub_02044474();
    sub_020442CC();
    sub_020445C8();

    s = UNK_STORAGE_STRUCT_0X14.field_0x4;
    if (s->field_0x0 == 6) {
        CloseTextBox(s->field_0x7D5);
    }

    if (UNK_STORAGE_STRUCT_0X14.field_0x4->field_0x7D6 != -2) {
        CloseTextBox(UNK_STORAGE_STRUCT_0X14.field_0x4->field_0x7D6);
    }

    UNK_STORAGE_STRUCT_0X14.field_0xC = UNK_STORAGE_STRUCT_0X14.field_0x4->field_0x0;
    CloseCollectionMenu(UNK_STORAGE_STRUCT_0X14.field_0x4->field_0x7D4);
    MemFree(UNK_STORAGE_STRUCT_0X14.field_0x4);
    UNK_STORAGE_STRUCT_0X14.field_0x4 = NULL;
}
