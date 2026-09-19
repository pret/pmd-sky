#include "dungeon_map_access_1.h"
#include "dg_random.h"
#include "dungeon.h"
#include "dungeon_map_access.h"
#include "dungeon_util_static.h"
#include "main_0200224C.h"
#include "secondary_terrain_types.h"
#include "tileset.h"

extern struct dungeon *DUNGEON_PTR;

extern s32 GetMonsterIdFromSpawnEntry(struct monster_spawn_entry *entry);

bool8 IsTileGround(struct tile *tile)
{
    bool8 is_ground = FALSE;
    if (IsWaterTileset())
    {
        if (GetTerrainType(tile) == TERRAIN_TYPE_WALL)
            is_ground = TRUE;
    }
    else if (GetTerrainType(tile) != TERRAIN_TYPE_SECONDARY ||
        SECONDARY_TERRAIN_TYPES[DUNGEON_PTR->gen_info.tileset_id] == SECONDARY_TERRAIN_LAVA)
    {
        is_ground = TRUE;
    }
    return is_ground;
}

bool8 IsWaterTileset()
{
    return TILESET_PROPERTIES[DUNGEON_PTR->gen_info.tileset_id].is_water_tileset;
}

void RemoveMonsterFromTile(struct entity *entity, s32 x, s32 y)
{
    struct tile *tile = GetTileSafe(x, y);
    if (tile->monster == entity)
        tile->monster = NULL;
}

s16 ov29_02337EE8(void)
{
    struct dungeon *dungeon = DUNGEON_PTR;
    struct unk_02337EE8 *p = &dungeon->field_0x286b0;
    s16 ids[16];
    s16 i;
    s16 count = 0;
    for (i = 0; i < 16; i = (s16)(i + 1)) {
        s32 id = GetMonsterIdFromSpawnEntry(&p->spawn_entries_master[i]);
        if (id == 0)
            break;
        if (id != MONSTER_KECLEON && id != MONSTER_KECLEON_SECONDARY &&
            id != MONSTER_DECOY && id != MONSTER_STATUE) {
            ids[count] = id;
            count = (s16)(count + 1);
        }
    }
    return ids[RandInt(count)];
}

s16 GetRandomSpawnMonsterID(void)
{
    struct dungeon *dungeon = DUNGEON_PTR;
    struct unk_02337EE8 *p = &dungeon->field_0x286b0;
    s16 ids[16];
    s16 i;
    s16 count = 0;
    for (i = 0; i < 16; i = (s16)(i + 1)) {
        s32 id = GetMonsterIdFromSpawnEntry(&p->spawn_entries_master[i]);
        if (id == 0)
            break;
        if (id != MONSTER_KECLEON && id != MONSTER_KECLEON_SECONDARY &&
            id != MONSTER_DECOY && id != MONSTER_STATUE && id != MONSTER_DITTO) {
            ids[count] = id;
            count = (s16)(count + 1);
        }
    }
    return ids[DungeonRandInt(count)];
}
