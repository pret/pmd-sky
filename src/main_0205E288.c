#include "main_0205E288.h"

bool8 sub_0205E288(struct unkStruct_0205E288 *ptr, u32 val, struct unkStruct_0205E288 *ptr2)
{
    if (ptr->unk0 == 0)
        return FALSE;

    if (ptr->unk1 == val && ptr->unk2 == ptr2->unk0)
        return TRUE;

    return FALSE;
}
