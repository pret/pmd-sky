#include "overlay_29_022F73B4.h"
#include "dungeon.h"
#include "util.h"
#include "enums.h"
#include "wan.h"
#include "main_02001188.h"
#include "main_020526EC.h"
#include "main_020527A8.h"
#include "main_02054AA4.h"
#include "main_02054DC4.h"

extern struct dungeon *DUNGEON_PTR[];
extern struct wan_table *WAN_TABLE;
extern void *ov29_0237C9B0[2];
extern s16 LoadWanTableEntryFromPack(struct wan_table *wan_table, u16 pack_id,
                                     u16 file_index, u32 malloc_flags,
                                     bool8 compressed);
extern s16 LoadWanTableEntryFromPackUseProvidedMemory(struct wan_table *wan_table,
                                                      u16 pack_id, u16 file_index,
                                                      void *buf, bool8 compressed);
extern u32 DirectoryFileMngr_GetDirectoryFileSize(enum pack_file_id pack_id,
                                                  u32 file_index);

bool32 FloorNumberIsEven() {
    struct dungeon *dungeon = DUNGEON_PTR[0];
    if (dungeon->id == DUNGEON_LABYRINTH_CAVE && dungeon->floor == 10) return 0;
    return (dungeon->floor & 1) == 0;
}

s16 GetKecleonIdToSpawnByFloor()
{
  if (!FloorNumberIsEven()) return MONSTER_KECLEON;
  else return MONSTER_KECLEON_SECONDARY;
}

void StoreSpriteFileIndexBothGenders(s16 monster_id, s16 file_id)
{
    s16 *sprite_indexes = (s16 *)DUNGEON_PTR[0]->sprite_indexes;
    u16 sprite_index = GetSpriteIndex__020526EC(monster_id);

    sprite_indexes[monster_id] = file_id;
    if (GetMonsterGender(monster_id) == 3)
        return;

    if (monster_id < MONSTER_GENDER_ID_OFFSET) {
        s32 other_id = monster_id + MONSTER_GENDER_ID_OFFSET;
        if (GendersEqualNotGenderless(monster_id, other_id))
            return;
        if (sprite_index == GetSpriteIndex__020526EC(other_id))
            sprite_indexes[other_id] = sprite_indexes[monster_id];
    } else {
        s32 other_id = monster_id - MONSTER_GENDER_ID_OFFSET;
        if (GendersEqualNotGenderless(monster_id, other_id))
            return;
        if (sprite_index == GetSpriteIndex__020526EC(other_id))
            sprite_indexes[other_id] = sprite_indexes[monster_id];
    }
}

void LoadMonsterSpriteInner(s16 monster_id)
{
    struct dungeon *dungeon = DUNGEON_PTR[0];
    u16 sprite_index;
    s32 slot;

    if (((s16 *)dungeon->sprite_indexes)[monster_id] != 0)
        return;

    sprite_index = GetSpriteIndex__020526EC(monster_id);
    if (IsShaymin(monster_id)) {
        if (IsShaymin(monster_id))
            slot = 0;
        ov29_0237C9B0[slot] = MemAlloc(GetSpriteFileSize(monster_id), 0);
        StoreSpriteFileIndexBothGenders(
            monster_id,
            LoadWanTableEntryFromPackUseProvidedMemory(WAN_TABLE, PACK_ARCHIVE_MONSTER,
                                                       sprite_index,
                                                       ov29_0237C9B0[slot], TRUE));
    } else {
        StoreSpriteFileIndexBothGenders(
            monster_id,
            LoadWanTableEntryFromPack(WAN_TABLE, PACK_ARCHIVE_MONSTER,
                                      sprite_index, 0, TRUE));
    }
    DUNGEON_PTR[0]->field_0x2cb0c +=
        DirectoryFileMngr_GetDirectoryFileSize(PACK_ARCHIVE_MONSTER, sprite_index);
}
