#include "main_02054AA4.h"
#include "enums.h"
#include "util.h"

bool8 IsUnown(s16 monster_id) {
    if(monster_id >= MONSTER_UNOWN_A && monster_id <= MONSTER_UNOWN_QUESTION) return TRUE;
    else return FALSE;
}

bool8 IsShaymin(s16 monster_id) {
    return (u16)(s16)(monster_id - MONSTER_SHAYMIN_LAND) <= 1;
}

bool8 IsCastform(enum monster_id monster_id)
{
    if(monster_id == MONSTER_CASTFORM_NORMAL ||
       monster_id == MONSTER_CASTFORM_SNOWY ||
       monster_id == MONSTER_CASTFORM_SUNNY || 
       monster_id == MONSTER_CASTFORM_RAINY ||
       ((u16)(s16)(monster_id - MONSTER_CASTFORM_NORMAL_SECONDARY) <= 3)
    ) {
       return TRUE;
    }
    
    return FALSE;
}

bool8 IsCherrim(enum monster_id monster_id)
{
    if (monster_id == MONSTER_CHERRIM_OVERCAST || 
        monster_id == MONSTER_CHERRIM_SUNSHINE || 
        ((u16)(s16)(monster_id - MONSTER_CHERRIM_OVERCAST_SECONDARY) <= 1)) {
        return TRUE;
    }
    
    return FALSE;
}
