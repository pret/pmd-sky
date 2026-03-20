#include "main_0205B77C.h"
#include "main_0200330C.h"

extern union unkStruct_020B0A54_union _020B0A54;

u8* sub_0205B77C(u32 a)
{
    return a * 176 + &_020B0A54.struct0->unk0;
}

void sub_0205B794(struct unkStruct_020B0A54 *dest, s32 index)
{
    *dest = _020B0A54.struct0[index];
}

void sub_0205B7C8(s32 index)
{
    MemsetSimple((u8*) &_020B0A54.struct0[index], 0, 0xB0);
    _020B0A54.struct0[index].unk0 = 0;
    _020B0A54.struct0[index].unkA2 = 0;
}
