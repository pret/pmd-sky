#include "main_0205E01C.h"

s32 sub_0205E258(struct unkStruct_0205E01C *ptr);

bool8 sub_0205E01C(struct unkStruct_0205E01C *ptr, s32 arg1, s32 arg2, s32 arg3)
{
    if (ptr->unk0 == 0)
        return FALSE;

    if (arg2 < 0 || (sub_0205E258(ptr) != 0 && arg3 == 1))
    {
        if (ptr->unk4 == arg1)
            return TRUE;
    }
    else
    {
        if (ptr->unk4 == arg1 && ptr->unk5 == arg2)
            return TRUE;
    }

    return FALSE;
}
