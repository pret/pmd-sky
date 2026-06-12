#include "main_0205E954.h"
#include "main_0205E288.h"
#include "mission.h"

extern struct mission_deliver_list MISSION_DELIVER_LIST_PTR;

s32 sub_0205E954(void)
{
    return sub_0205E448(8, (struct mission*) MISSION_DELIVER_LIST_PTR.unk18);
}

struct mission* sub_0205E970(u32 index)
{
    return (struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + (index * 32));
}
