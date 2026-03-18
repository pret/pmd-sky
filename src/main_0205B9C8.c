#include "main_0205B9C8.h"
#include "main_0205B690.h"

extern union unkStruct_020B0A54_union _020B0A54;

s32 sub_0205B9C8(s32 a)
{
    struct unkStruct_020B0A54 *ptr = _020B0A54.struct0;
    s32 count = 0;

    for (s32 i = (a != 0) ? 2 : 0; i < 32; i++)
    {
        if (_020B0A54.struct0[i].unk0 != 0)
        {
            count++;
        }
    }

    return count;
}
