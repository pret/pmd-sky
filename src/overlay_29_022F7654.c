#include "overlay_29_022F7654.h"
#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR[];
extern void LoadMonsterSpriteInner(s16 monster_id);
void LoadMonsterSprite(s16 monster_id, u8 skip_deoxys_check)
{
    if (!skip_deoxys_check && (u16)(s16)(monster_id - MONSTER_DEOXYS_NORMAL) <= 3) LoadMonsterSpriteInner((s16)DUNGEON_PTR[0]->deoxys_floor_id);
    else {
        LoadMonsterSpriteInner(monster_id);
        if (monster_id == MONSTER_CASTFORM_NORMAL || monster_id == MONSTER_CASTFORM_SNOWY || monster_id == MONSTER_CASTFORM_SUNNY || monster_id == MONSTER_CASTFORM_RAINY || 3 >= (u16)(s16)(monster_id - MONSTER_CASTFORM_NORMAL_SECONDARY)) {
            LoadMonsterSpriteInner(MONSTER_CASTFORM_NORMAL);
            LoadMonsterSpriteInner(MONSTER_CASTFORM_SNOWY);
            LoadMonsterSpriteInner(MONSTER_CASTFORM_SUNNY);
            LoadMonsterSpriteInner(MONSTER_CASTFORM_RAINY);
        }
        if (monster_id == MONSTER_CHERRIM_OVERCAST || monster_id == MONSTER_CHERRIM_SUNSHINE || (u16)(s16)(monster_id - MONSTER_CHERRIM_OVERCAST_SECONDARY) <= 1) {
            LoadMonsterSpriteInner(MONSTER_CHERRIM_OVERCAST);
            LoadMonsterSpriteInner(MONSTER_CHERRIM_SUNSHINE);
        }
    }
}
