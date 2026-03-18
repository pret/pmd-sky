#include "main_0205B6EC.h"

extern union unkStruct_020B0A54_union _020B0A54;

bool8 sub_0205B6EC(struct unkStruct_020B0A54 *src)
{
    s32 res = sub_0205B690();

    if (res == -1)
    {
        return FALSE;
    }

    _020B0A54.struct0[res] = *src;

    return TRUE;
}
