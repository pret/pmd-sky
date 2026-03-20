#include "main_0205ED84.h"
#include "mission.h"

extern s32 sub_0205E448(u32 a0, struct mission* mission);

extern struct mission_deliver_list MISSION_DELIVER_LIST_PTR;

s32 CountJobListMissions(void)
{
    return sub_0205E448(8, (struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + 0x100));
}
