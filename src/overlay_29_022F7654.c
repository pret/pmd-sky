#include "overlay_29_022F7654.h"
#include "dungeon.h"
#include "enums.h"
#include "wan.h"

extern struct wan_table *WAN_TABLE;
extern s16 GetSpriteIndex__020526EC(s16 monster_id);
extern s16 ReplaceWanFromBinFile(struct wan_table *wan_table, s16 wan_id, s16 pack_id, s16 file_index, bool8 compressed);
extern void StoreSpriteFileIndexBothGenders(s16 monster_id, s16 file_id);

void SwapMonsterWanFileIndex(s16 src_id, s16 dst_id)
{
    s16 *sprite_indexes = (s16 *)DUNGEON_PTR[0]->sprite_indexes;
    StoreSpriteFileIndexBothGenders(dst_id, ReplaceWanFromBinFile(WAN_TABLE, sprite_indexes[src_id], PACK_ARCHIVE_MONSTER, GetSpriteIndex__020526EC(dst_id), TRUE));
    sprite_indexes[dst_id] = sprite_indexes[src_id];
    sprite_indexes[src_id] = 0;
}

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
