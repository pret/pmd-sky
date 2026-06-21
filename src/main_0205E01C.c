#include "main_0205E01C.h"
#include "mission.h"

extern struct mission_deliver_list MISSION_DELIVER_LIST_PTR;

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

s32 sub_0205E090(s32 arg0, s32 arg1, s32 arg2)
{
    s32 i;

    for(i = 0; i < 8; i++){
        if (sub_0205E01C((struct unkStruct_0205E01C*)(MISSION_DELIVER_LIST_PTR.unk18 + (i * 32)), arg0, arg1, arg2) != 0) {
            return 1;
        }
    }

    for(i = 0; i < 8; i++){
        if (sub_0205E01C((struct unkStruct_0205E01C*)(MISSION_DELIVER_LIST_PTR.unk18 + 0x100 + (i * 32)), arg0, arg1, arg2) != 0) {
            return 1;
        }
    }

    for(i = 0; i < 8; i++){
        if (sub_0205E01C((struct unkStruct_0205E01C*)(MISSION_DELIVER_LIST_PTR.unk18 + 0x200 + (i * 32)), arg0, arg1, arg2) != 0) {
            return 1;
        }
    }

    for(i = 0; i < 1; i++){
        if (sub_0205E01C((struct unkStruct_0205E01C*)(MISSION_DELIVER_LIST_PTR.unk18 + 0x300 + (i * 32)), arg0, arg1, arg2) != 0) {
            return 1;
        }
    }

    for(i = 0; i < 1; i++){
        if (sub_0205E01C((struct unkStruct_0205E01C*)(MISSION_DELIVER_LIST_PTR.unk18 + 0x320 + (i * 32)), arg0, arg1, arg2) != 0) {
            return 1;
        }
    }

    return 0;
}
