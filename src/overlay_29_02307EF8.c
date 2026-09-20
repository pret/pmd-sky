#include "overlay_29_02307EF8.h"
#include "dg_random.h"
#include "dungeon_items.h"
#include "dungeon_map_access.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_1.h"
#include "dungeon_util_static.h"
#include "main_02001A54.h"
#include "overlay_29_022E9FC0.h"
#include "spawn_2.h"

struct unk_022FD084 {
    s16 field_0x0;
    u8 field_0x2;
    u8 field_0x3;
    s32 field_0x4;
    s16 field_0x8;
    s16 field_0xa;
    s16 field_0xc;
    bool8 field_0xe;
    u8 field_0xf;
};

extern struct dungeon *DUNGEON_PTR[2];
extern const s16 ov10_022C4560;
extern const s16 MONSTER_HOUSE_MAX_MONSTER_SPAWNS;

extern bool8 MewSpawnCheck(s32 monster_id, bool8 a);
extern struct entity *SpawnMonster(struct unk_022FD084 *data, bool8 a);
extern void AnimationDelayOrSomething(bool8 param_1);

bool8 EntityIsValid__02307EF8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

bool8 ItemIsActive__02307F1C(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}

void TryTriggerMonsterHouse(struct entity *entity, bool8 a)
{
    struct unk_022FD084 data;
    struct position positions[100];
    struct room_data *room;
    struct tile *tile;
    struct entity *spawned;
    s32 count;
    s32 idx;
    s32 n_spawns;
    s32 spawn_x;
    s32 i;
    s32 j;
    s32 scan_x;
    s32 x;
    s32 y;
    s32 scan_y;
    s32 x_min;
    s32 x_max;
    s32 y_min;
    s32 y_max;

    if (!EntityIsValid__02307EF8(entity))
        return;

    if (GetEntInfo(entity)->is_not_team_member)
        return;

    if (!(GetTileAtEntity(entity)->terrain_flags & TERRAIN_TYPE_IN_MONSTER_HOUSE))
        return;

    if (DUNGEON_PTR[0]->monster_house_triggered)
        return;

    DUNGEON_PTR[0]->monster_house_triggered = TRUE;
    if (DUNGEON_PTR[0]->gen_info.monster_house_room == 0xFF)
        return;

    room = &DUNGEON_PTR[0]->room_data[DUNGEON_PTR[0]->gen_info.monster_house_room];
    count = 0;

    if (a) {
        for (y = entity->pos.y - 4; y <= entity->pos.y + 4; y++) {
            for (x = entity->pos.x - 4; x <= entity->pos.x + 4; x++) {
                tile = GetTileSafe(x, y);
                if (tile->monster == NULL && GetTerrainType(tile) == TERRAIN_TYPE_NORMAL) {
                    if (count < 100) {
                        positions[count].x = x;
                        positions[count].y = y;
                        count++;
                    }
                }
            }
        }
    }
    else {
        x_min = entity->pos.x - 4;
        if (x_min <= room->bottom_right_corner.x)
            x_min = room->bottom_right_corner.x;
        x_max = entity->pos.x + 5;
        if (x_max >= room->top_left_corner.x)
            x_max = room->top_left_corner.x;
        y_min = entity->pos.y - 4;
        if (y_min <= room->bottom_right_corner.y)
            y_min = room->bottom_right_corner.y;
        y_max = entity->pos.y + 5;
        if (y_max >= room->top_left_corner.y)
            y_max = room->top_left_corner.y;

        for (scan_y = y_min; scan_y < y_max; scan_y++) {
            for (scan_x = x_min; scan_x < x_max; scan_x++) {
                tile = GetTileSafe(scan_x, scan_y);
                if (tile->monster == NULL && GetTerrainType(tile) == TERRAIN_TYPE_NORMAL
                    && tile->terrain_flags & TERRAIN_TYPE_IN_MONSTER_HOUSE) {
                    if (count < 100) {
                        positions[count].x = scan_x;
                        positions[count].y = scan_y;
                        count++;
                    }
                }
            }
        }
    }

    n_spawns = DungeonRandRange(ov10_022C4560, MONSTER_HOUSE_MAX_MONSTER_SPAWNS);
    if (n_spawns >= count)
        n_spawns = count;

    for (i = 0; i < n_spawns; i++) {
        idx = DungeonRandInt(count);
        for (j = 0; j < count; j++) {
            if (positions[idx].x != 0)
                break;
            idx++;
            if (idx >= count)
                idx = 0;
        }

        spawn_x = positions[idx].x;
        if (spawn_x == 0)
            break;

        data.field_0x0 = GetMonsterIdToSpawn(1);
        data.field_0x8 = 0;
        data.field_0x2 = 0;
        data.field_0x4 = 0;
        data.field_0xe = TRUE;
        data.field_0xa = spawn_x;
        data.field_0xc = positions[idx].y;
        if (!MewSpawnCheck(data.field_0x0, TRUE))
            continue;

        spawned = SpawnMonster(&data, FALSE);
        if (!EntityIsValid__02307EF8(spawned))
            continue;

        spawned->elevation = 0xC800;
        for (j = 0; j < 100; j++) {
            spawned->elevation = MultiplyByFixedPoint(spawned->elevation, 0xAA);
            if (spawned->elevation < 0x100)
                break;
            AdvanceFrame(0x57);
        }
        spawned->elevation = 0;
    }

    AnimationDelayOrSomething(TRUE);
}
