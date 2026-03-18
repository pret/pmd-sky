#include "main_0205B6EC.h"

extern struct unkStruct_0205B6EC *_020B0A54;

extern s32 sub_0205B690(struct unkStruct_0205B6EC *src);

bool8 sub_0205B6EC(struct unkStruct_0205B6EC *src)
{
    s32 res = sub_0205B690(src);

    if (res == -1)
    {
        return FALSE;
    }

    _020B0A54[res] = *src;

    return TRUE;
}
