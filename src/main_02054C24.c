#include "main_02054C24.h"

extern bool8 IsDeoxys(enum monster_id monster_id);

enum monster_id GetBaseFormCastformDeoxysCherrim(enum monster_id monster_id)
{
    if (IsDeoxys(monster_id)) {
        return MONSTER_DEOXYS_NORMAL;
    }
    if ((u32) (u16) (s16) (monster_id + 0xFFFFFE85) <= 3U) {
        return MONSTER_CASTFORM_NORMAL;
    }
    if ((u32) (u16) (s16) (monster_id - MONSTER_CASTFORM_NORMAL_SECONDARY) <= 3U) {
        return MONSTER_CASTFORM_NORMAL_SECONDARY;
    }
    if ((u32) (u16) (s16) (monster_id - MONSTER_CHERRIM_OVERCAST) <= 1U) {
        return MONSTER_CHERRIM_OVERCAST;
    }
    if ((u32) (u16) (s16) (monster_id + 0xFFFFFBDC) <= 1U) {
        return MONSTER_CHERRIM_OVERCAST_SECONDARY;
    }
    return monster_id;
}
