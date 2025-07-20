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
