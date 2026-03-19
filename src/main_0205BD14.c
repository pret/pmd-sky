#include "main_0205BD14.h"
#include "main_0205B690.h"

extern union unkStruct_020B0A54_union _020B0A54;

void sub_0205BD14(u32 *dest, s32 index)
{
    *dest = sub_0205BD40(_020B0A54.struct0[index].unkAE);
}

u32 sub_0205BD40(u32 val)
{
    if (val & 2)
    {
        return 0;
    }

    return val & 1 ? 2 : 1;
}

bool8 sub_0205BD5C(u32 val)
{
    return sub_0205BD40(val) == 0;
}
