#include "main_0205B354.h"

bool8 sub_0205B354(struct unkStruct_0205B354 *ptr)
{
    if (ptr->unk45 != 0)
    {
        return FALSE;
    }

    for (s16 i = 0; i < 2; i++)
    {
        if (ptr->unk18[i] == 111)
        {
            return TRUE;
        }
    }

    return FALSE;
}
