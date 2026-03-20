#include "main_0205EC18.h"
#include "mission.h"

extern struct mission_deliver_list MISSION_DELIVER_LIST_PTR;

extern void ClearMissionData(struct mission* mission);

void sub_0205EC18(u32 index)
{
    ClearMissionData((struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + 0x300 + index * 32));
}
