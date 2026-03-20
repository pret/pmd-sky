#include "main_0205EAC8.h"
#include "mission.h"

extern s32 sub_0205E448(u32 a, struct mission *mission);

extern struct mission_deliver_list MISSION_DELIVER_LIST_PTR;

s32 sub_0205EAC8(void)
{
    return sub_0205E448(8, (struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + 0x200));
}

struct mission* sub_0205EAE8(u32 index)
{
    return (struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + 0x200 + index * 32);
}
