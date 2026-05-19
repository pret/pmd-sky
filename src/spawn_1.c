#include "dungeon.h" 
#include "spawn_1.h"

extern s32 CopySpawnEntriesMaster(struct monster_spawn_entry[], s32);
extern s32 GetMonsterIdFromSpawnEntry(struct monster_spawn_entry*);
extern u32 GetSpriteSize(s32);
extern struct dungeon *DUNGEON_PTR;

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
