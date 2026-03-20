#include "main_0205E288.h"

extern struct mission_deliver_list MISSION_DELIVER_LIST_PTR;

bool8 sub_0205E288(struct mission *mission, u32 val, u8 *ptr2)
{
    if (mission->status == MISSION_STATUS_INVALID)
        return FALSE;

    if (mission->type == val && mission->subtype.other == *ptr2)
        return TRUE;

    return FALSE;
}

bool8 sub_0205E2B8(u32 arg0, u8 *arg1)
{
    for (s32 i = 0; i < 8; i++)
    {
        if (sub_0205E288((struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + i * 32), arg0, arg1))
            return TRUE;
    }

    for (s32 i = 0; i < 8; i++)
    {
        if (sub_0205E288((struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + 0x100 + i * 32), arg0, arg1))
            return TRUE;
    }

    for (s32 i = 0; i < 8; i++)
    {
        if (sub_0205E288((struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + 0x200 + i * 32), arg0, arg1))
            return TRUE;
    }

    for (s32 i = 0; i < 1; i++)
    {
        if (sub_0205E288((struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + 0x300 + i * 32), arg0, arg1))
            return TRUE;
    }

    for (s32 i = 0; i < 1; i++)
    {
        if (sub_0205E288((struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + 0x320 + i * 32), arg0, arg1))
            return TRUE;
    }

    return FALSE;
}

bool8 sub_0205E3F8(struct unkStruct_0205E3F8 *src, s32 limit, struct unkStruct_0205E3F8 *destArray)
{
    for (s32 i = 0; i < limit; i++)
    {
        if (*(u8 *)&destArray[i] == 0)
        {
            destArray[i] = *src;
            return FALSE;
        }
    }

    return TRUE;
}
