#include "main_0205BC30.h"
#include "main_0200330C.h"

struct unkStruct_020B0A54_inner {
    u8 padding[2];
    u8 val;
};

// Should match the struct in main_0205B690, but haven't gotten it to match yet.
// https://decomp.me/scratch/e6YZI
struct unkStruct_020B0A54 {
    u8 padding[8];
    struct unkStruct_020B0A54_inner *inner;
};

extern void sub_02055F04(struct unkStruct_020B0A54_inner *p, u32 a);
extern u32 sub_02051788(u32 val);

extern struct unkStruct_020B0A54 _020B0A54;

void sub_0205BC30(u32 a, u32 b)
{
    if (a == 0)
    {
        MemsetSimple((u8*) _020B0A54.inner, 0, 0x44);
        return;
    }

    sub_02055F04(_020B0A54.inner, a);

    if (b != 0)
    {
        return;
    }

    _020B0A54.inner->val = (u8)sub_02051788(_020B0A54.inner->val);
}
