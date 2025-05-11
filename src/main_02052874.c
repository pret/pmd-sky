#include "main_02052874.h"
#include "monster_data.h"

extern struct monster_data_table *MONSTER_DATA_TABLE_PTR;

enum mobility_type GetMobilityType(s16 monster_id)
{
    return MONSTER_DATA_TABLE_PTR->entries[monster_id].mobility_type;
}
