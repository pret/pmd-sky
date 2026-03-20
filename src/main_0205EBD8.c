#include "main_0205EBD8.h"

struct mission* sub_0205EBD8(u32 index)
{
    return (struct mission*) (MISSION_DELIVER_LIST_PTR.unk18 + 0x300 + (index * 32));
}
