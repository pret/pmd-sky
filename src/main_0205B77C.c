#include "main_0205B77C.h"

extern struct unkStruct_020B0A54 *_020B0A54;

u32* sub_0205B77C(u32 a)
{
    return a * 44 + _020B0A54->data;
}

void sub_0205B794(struct unkStruct_020B0A54 *dest, s32 index)
{
    *dest = _020B0A54[index];
}
