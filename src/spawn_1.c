#include "dg_random.h"
#include "dungeon.h" 
#include "enums.h"
#include "item.h"
#include "item_util.h"
#include "spawn_1.h"

extern s32 CopySpawnEntriesMaster(struct monster_spawn_entry[], s32);
extern s32 GetMonsterIdFromSpawnEntry(struct monster_spawn_entry*);
extern u32 GetSpriteSize(s32);
extern struct dungeon *DUNGEON_PTR;

s16 GetItemIdToSpawn(enum spawn_weight_type spawn_type) {
    s32 idx;
    s32 rnd = DungeonRandInt(10000);
    enum item_category category = CATEGORY_DUMMY;
    for(idx = 0; idx < 16; idx++) {
        s16 threshold = DUNGEON_PTR->item_spawn_weights[spawn_type].category_threshold[idx];
        if(threshold == 0) {
            continue;
        }

        if(threshold >= rnd) {
            category = (enum item_category)idx;
            break;
        }
    }

    if(category == CATEGORY_DUMMY) {
        return ITEM_POKE;
    }

    rnd = DungeonRandInt(10000);
    for(idx = 0; idx < 0x16c; idx++) {
        s16 threshold = DUNGEON_PTR->item_spawn_weights[spawn_type].item_threshold[idx];
        if(threshold == 0) {
            continue;
        }

        if(category != GetItemCategoryVeneer(idx)) {
            continue;
        }

        threshold = DUNGEON_PTR->item_spawn_weights[spawn_type].item_threshold[idx];
        if(threshold >= rnd) {
            return idx;
        }
    } 

    return ITEM_POKE;
}

s32 GetRandomBazaarItem() {
    s32 item_id = GetItemIdToSpawn(SPAWN_BAZAAR);
    if(item_id == ITEM_POKE) {
        return ITEM_ORAN_BERRY;
    }
    return item_id;
}

s32 GetRandomSecretRoomItem() {
    s32 item_id = GetItemIdToSpawn(SPAWN_SECRET_ROOM);
    if(item_id == ITEM_POKE) {
        return ITEM_ORAN_BERRY;
    }
    return item_id;
}

s32 CopySpawnEntriesMaster(struct monster_spawn_entry out[], s32 idx_out) {
    for(s32 i = 0; i < 16; i++) {
        s32 monster_id = GetMonsterIdFromSpawnEntry(&(DUNGEON_PTR->spawn_entries_master[i]));
        if(monster_id == 0) {
            break;
        }

        out[idx_out] = DUNGEON_PTR->spawn_entries_master[i];
        idx_out++;
    }

    return idx_out;
}

s32 MonsterSpawnListPartialCopy(struct monster_spawn_entry entry_out[], s32 idx_out) {
    for(s32 i = 0; i < 16; i++) {
        s32 monster_id = GetMonsterIdFromSpawnEntry(&(DUNGEON_PTR->spawn_entries_master[i]));
        if(monster_id == 0) {
            break;
        }

        if(GetSpriteSize(monster_id) > 6) {
            continue;
        }

        if(DUNGEON_PTR->spawn_entries_master[i].incremental_spawn_weight[0] == 0) {
            continue;
        }

        entry_out[idx_out] = DUNGEON_PTR->spawn_entries_master[i];
        idx_out++;
    }
    return idx_out;
}

void CopySpawnEntriesOnce() {
    if (DUNGEON_PTR->spawn_entries_copied != FALSE) {
        return;
    }

    DUNGEON_PTR->spawn_entries_copied = 1;
    DUNGEON_PTR->monster_spawn_entries_length =
        CopySpawnEntriesMaster(DUNGEON_PTR->spawn_entries, 0);
}
