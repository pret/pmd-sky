#include "main_0205BBFC.h"
#include "main_0200330C.h"
#include "main_0205B690.h"

extern union unkStruct_020B0A54_union _020B0A54;

extern void sub_02055F04(struct ground_monster *p, u32 a);
extern u32 sub_02051788(u32 val);

void sub_0205BBFC(struct ground_monster *dest)
{
    *dest = *_020B0A54.struct1.unk8.monster;
}

void sub_0205BC30(u32 a, u32 b)
{
    if (a == 0)
    {
        MemsetSimple((u8*) _020B0A54.struct1.unk8.monster, 0, 0x44);
        return;
    }

    sub_02055F04(_020B0A54.struct1.unk8.monster, a);

    if (b != 0)
    {
        return;
    }

    _020B0A54.struct1.unk8.monster->joined_at = sub_02051788(_020B0A54.struct1.unk8.monster->joined_at);
}

void sub_0205BC94(struct unkStruct_0205BC94 *p)
{
    struct unkStruct_020B0A54_unk8_inner *inner = _020B0A54.struct1.unk8.unk8;

    p->unk0 = inner->unk44;
    p->unk2 = inner->unk46;
    p->unk4 = inner->unk48;
    *(u8 *)p = 1;
}
