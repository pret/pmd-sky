#include "main_020527A8.h"
#include "monster_data.h"

u8 GetMonsterGender(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].gender;
}

u8 GetBodySize(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].body_size;
}
