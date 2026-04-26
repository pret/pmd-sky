#ifndef PMDSKY_SPAWN_H
#define PMDSKY_SPAWN_H

// Weight type index is 0 for normal spawns and 1 for monster house spawns.
// Returns a monster ID.
s32 GetMonsterIdToSpawn(s32 weight_type_idx);
s32 GetMonsterLevelToSpawn(s32 monster_id);

#endif //PMDSKY_SPAWN_H
