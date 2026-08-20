#include "main_0205B6EC.h"
#include "main_0205B690.h"

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

bool8 sub_0205B738(struct unkStruct_020B0A54* src)
{
    bool8 result = FALSE;

    if (_020B0A54.struct0[1].unk0 != 0) {
        result = TRUE;
    }

    _020B0A54.struct0[1] = *src;

    return result;
}
