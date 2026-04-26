#include "dg_random.h"
#include "dungeon.h"
#include "overlay_29_022F73B4.h"
#include "spawn.h"

extern s32 GetMonsterIdFromSpawnEntry(struct monster_spawn_entry *);
extern s32 GetMonsterLevelFromSpawnEntry(struct monster_spawn_entry *);

s32 IsOnMonsterSpawnList(s32 monster_id) {
    for(s32 i = 0; i < 16; i++) {
        s32 entity_monster_id = GetMonsterIdFromSpawnEntry(
            &DUNGEON_PTR[0]->spawn_entries_master[i]);
        
        if(entity_monster_id == 0) {
            break;
        }
        
        if(entity_monster_id == monster_id) {
            return TRUE;
        }
    }
    return FALSE;
}

s32 GetMonsterIdToSpawn(s32 weight_type_idx)
{
    s32 rand = DungeonRandInt(10000);
    s32 i;

    for (i = 0; i < DUNGEON_PTR[0]->monster_spawn_entries_length; i++) {
        s16 threshold = DUNGEON_PTR[0]->spawn_entries[i].incremental_spawn_weight[weight_type_idx];
        if (threshold != 0 && threshold >= rand) {
            return GetMonsterIdFromSpawnEntry(
                (struct monster_spawn_entry *) &DUNGEON_PTR[0]->spawn_entries[i]);
        }
    }

    for (i = 0; i < DUNGEON_PTR[0]->monster_spawn_entries_length; i++) {
        s16 threshold = DUNGEON_PTR[0]->spawn_entries[i].incremental_spawn_weight[weight_type_idx];
        if (threshold != 0) {
            return GetMonsterIdFromSpawnEntry(
                (struct monster_spawn_entry *) &DUNGEON_PTR[0]->spawn_entries[i]);
        }
    }

    return GetKecleonIdToSpawnByFloor();
}

s32 GetMonsterLevelToSpawn(s32 monster_id) {
    for(s32 i = 0; i < DUNGEON_PTR[0]->monster_spawn_entries_length; i++) {
        s32 entry_mon_id = GetMonsterIdFromSpawnEntry(&DUNGEON_PTR[0]->spawn_entries[i]);
        if(monster_id == entry_mon_id) {
            return GetMonsterLevelFromSpawnEntry(&DUNGEON_PTR[0]->spawn_entries[i]);
        }
    }

    return 1;
}
