#include "main_02052B28.h"
#include "monster_data.h"

s32 GetIqGroup(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].iq_group;
}
