#ifndef PMDSKY_SPAWN_1_H
#define PMDSKY_SPAWN_1_H

s32 CopySpawnEntriesMaster(struct monster_spawn_entry out[], s32 idx_out);
s32 MonsterSpawnListPartialCopy(struct monster_spawn_entry entry_out[], s32 idx_out);
void CopySpawnEntriesOnce();

#endif //PMDSKY_SPAWN_1_H
