#include "main_02043218.h"
#include "main_02042AF8.h"

void sub_02043218(void)
{
    UNK_STORAGE_STRUCT_0X14.field_0x2 = 0;
}

void sub_0204322C(u16 value)
{
    UNK_STORAGE_STRUCT_0X14.field_0x2 = value;
}

void sub_0204323C(s16 value)
{
    UNK_STORAGE_STRUCT_0X14.field_0x2 = sub_02043254(value);
}

s32 sub_02043254(s16 value)
{
    s32 i;
    struct unk_02043148 *contents = UNK_STORAGE_STRUCT_0X14.field_0x4;

    for (i = 0; i < 1000 && contents->field_0x4[i] != -1; i++) {
        if (value == contents->field_0x4[i]) {
            return i;
        }
    }
    return 0;
}

s16 sub_0204329C(s32 index)
{
    return UNK_STORAGE_STRUCT_0X14.field_0x4->field_0x4[index];
}
