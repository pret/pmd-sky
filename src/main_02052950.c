#include "main_02052950.h"
#include "monster_data.h"

extern struct monster_data_table *MONSTER_DATA_TABLE_PTR;

bool8 CanThrowItems(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].can_throw_items & 0x20 ? TRUE : FALSE;
}
