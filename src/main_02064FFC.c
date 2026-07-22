#include "main_02064FFC.h"

void sub_02064F94(struct unk_02064F94* a, u32* data, int count)
{
    int i;

    for (i = 0; i < count; i++, data++) {
        sub_0201E380(_020AFC70 + 0xcc, data, a->field_0x8, i);
    }
}

void sub_02064FE4(struct unk_02064F94* a, struct unk_02064FE4* b)
{
    sub_02064F94(a, (u32*)((u8*)b + b->field_0x20), b->field_0x24);
}

char* sub_02064FFC(s16 id)
{
    return EVENTS[id].field_0x8;
}

int sub_02065014(s16 id)
{
    if (id != -1) {
        s16 value = EVENTS[id].field_0x0;

        if (value == 5 || value == 6 || value == 8) {
            return 0;
        }
    }
    return 1;
}
