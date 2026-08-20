#include "main_0205EBD8.h"
#include "mission.h"

extern struct mission_deliver_list MISSION_DELIVER_LIST_PTR;

struct mission* sub_0205EBD8(u32 index)
{
    return (struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + 0x300 + (index * 32));
}

bool8 sub_0205EBF0(s32 idx)
{
    return MISSION_DELIVER_LIST_PTR.unk18[idx * 32 + 0x300] == 0;
}
