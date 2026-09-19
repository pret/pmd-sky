#include "main_0202A66C.h"

#include "main_02001188.h"

extern void GetStringFromFileVeneer(u8 *buf, s32 string_id);
extern u8 CreateParentMenuInternal(void *a, u32 b, void *c, struct unk_0202A75C *items);

u8 CreateParentMenuFromStringIds(void *a, u32 b, void *c, struct unk_0202A5CC *items)
{
    struct unk_0202A5CC *p;
    struct unk_0202A75C *buf;
    struct unk_0202A75C *q;
    s32 n;

    p = items;
    n = 0;
    while (p->field_0x0 != 0) {
        p++;
        n++;
    }

    buf = MemAlloc((n + 1) * sizeof(struct unk_0202A75C), 8);
    q = buf;
    while (items->field_0x0 != 0) {
        GetStringFromFileVeneer(q->field_0x0, items->field_0x0);
        q->field_0x100 = items->field_0x4;
        items++;
        q++;
    }
    q->field_0x0[0] = 0;
    q->field_0x100 = items->field_0x4;
    return CreateParentMenuInternal(a, b, c, buf);
}

bool8 IsEmptyString(u8* str)
{
    if (str == 0) {
        return TRUE;
    }
    return *str == 0;
}
