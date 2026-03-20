#include "main_0205B690.h"

extern union unkStruct_020B0A54_union _020B0A54;

s32 sub_0205B690(void)
{
    for (s32 i = 2; i < 32; i++)
    {
        if (_020B0A54.struct0[i].unk0 == 0)
        {
            return i;
        }
    }

    return -1;
}
