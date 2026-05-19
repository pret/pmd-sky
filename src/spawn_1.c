#include "dungeon.h" 
#include "spawn_1.h"

extern s32 CopySpawnEntriesMaster(struct monster_spawn_entry[], s32);
extern struct dungeon *DUNGEON_PTR;

void CopySpawnEntriesOnce() {
    if (DUNGEON_PTR->spawn_entries_copied != FALSE) {
        return;
    }

    DUNGEON_PTR->spawn_entries_copied = 1;
    DUNGEON_PTR->monster_spawn_entries_length =
        CopySpawnEntriesMaster(DUNGEON_PTR->spawn_entries, 0);
}
