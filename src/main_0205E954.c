#include "main_0205E954.h"
#include "mission.h"

extern struct mission_deliver_list MISSION_DELIVER_LIST_PTR;

void sub_0205E448(u32 a0, struct mission* mission);

void sub_0205E954(void)
{
    sub_0205E448(8, (struct mission*) MISSION_DELIVER_LIST_PTR.unk18);
}
