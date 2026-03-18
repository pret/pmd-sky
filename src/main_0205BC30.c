#include "main_0205BC30.h"
#include "main_0200330C.h"
#include "common.h"

struct unkStruct_020B0A54_inner {
    u8 fill0[0x44];
    u16 unk44;
    u16 unk46;
    u16 unk48;
};

union unkStruct_020B0A54_union
{
    struct ground_monster *monster;
    struct unkStruct_020B0A54_inner *inner;
};

// Should match the struct in main_0205B690, but haven't gotten it to match yet.
// https://decomp.me/scratch/e6YZI
struct unkStruct_020B0A54 {
    u8 unk0[8];
    union unkStruct_020B0A54_union inner;
};

extern void sub_02055F04(struct ground_monster *p, u32 a);
extern u32 sub_02051788(u32 val);

extern struct unkStruct_020B0A54 _020B0A54;

void sub_0205BC30(u32 a, u32 b)
{
    if (a == 0)
    {
        MemsetSimple((u8*) _020B0A54.inner.monster, 0, 0x44);
        return;
    }

    sub_02055F04(_020B0A54.inner.monster, a);

    if (b != 0)
    {
        return;
    }

    _020B0A54.inner.monster->joined_at = sub_02051788(_020B0A54.inner.monster->joined_at);
}

void sub_0205BC94(struct unkStruct_0205BC94 *p)
{
    struct unkStruct_020B0A54_inner *inner = _020B0A54.inner.inner;

    p->unk0 = inner->unk44;
    p->unk2 = inner->unk46;
    p->unk4 = inner->unk48;
    *(u8 *)p = 1;
}
