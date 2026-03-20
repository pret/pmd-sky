#include "main_0205EAC8.h"
#include "mission.h"

extern void sub_0205E448(u32 a, struct mission *mission);

extern struct mission_deliver_list MISSION_DELIVER_LIST_PTR;

void sub_0205EAC8(void)
{
    sub_0205E448(8, (struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + 0x200));
}
