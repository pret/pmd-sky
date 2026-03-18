#include "main_0205B9C8.h"
#include "main_0205B7C8.h"

extern struct unkStruct_020B0A54 *_020B0A54;

s32 sub_0205B9C8(s32 a)
{
    struct unkStruct_020B0A54 *ptr = _020B0A54;
    s32 count = 0;
    s32 i = (a != 0) ? 2 : 0;

    for (; i < 32; i++)
    {
        if (_020B0A54[i].f0 != 0)
        {
            count++;
        }
    }

    return count;
}
