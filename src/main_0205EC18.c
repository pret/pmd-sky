#include "main_0205EC18.h"
#include "mission.h"

extern struct mission_deliver_list MISSION_DELIVER_LIST_PTR;

extern void ClearMissionData(struct mission* mission);

void sub_0205EC18(u32 index)
{
    ClearMissionData((struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + 0x300 + index * 32));
}

u8 * sub_0205EC38(s32 i)
{
    u8 *p;

    p = MISSION_DELIVER_LIST_PTR.unk18 + 0x320;
    return &p[i * 0x20];
}

bool8 sub_0205EC50(s32 i)
{
    return MISSION_DELIVER_LIST_PTR.unk18[i * 0x20 + 0x320] == 0;
}
