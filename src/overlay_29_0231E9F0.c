#include "overlay_29_0231E9F0.h"
#include "moves.h"
#include "moves_1.h"
#include "main_0201514C.h"
#include "dungeon.h"
#include "dungeon_map_access.h"
#include "dungeon_util_static.h"
#include "fixed_room_data_1.h"
#include "overlay_29_0230558C.h"
#include "overlay_29_02320764.h"
#include "overlay_29_022E9FC0.h"
#include "overlay_29_023047B8.h"
#include "overlay_29_0231EDD8.h"
#include "overlay_29_02336F4C.h"
#include "overlay_29_0234B104.h"

extern struct dungeon *DUNGEON_PTR[];

extern bool8 FloorSecondaryTerrainIsChasm(s32 tileset_id);
extern bool8 StairsAlwaysReachable(s32 x, s32 y, bool8 a);
extern void DetermineTileWalkableNeighbors(s32 x, s32 y);
extern void ActivateTerrainEffects(struct entity *entity);
extern void UpdateMinimap(void);
extern void ov29_0233FB1C(void);
extern void ov29_0233785C(void);
extern void ov29_0233665C(void);

#ifdef JAPAN
#define MESSAGE_DFE 0xB3E
#define MESSAGE_DFF 0xB3F
#define MESSAGE_E00 0xB40
#define MESSAGE_E01 0xB41
#else
#define MESSAGE_DFE 0xDFE
#define MESSAGE_DFF 0xDFF
#define MESSAGE_E00 0xE00
#define MESSAGE_E01 0xE01
#endif

s16 GetMaxPpWrapper(struct move *move)
{
    return GetMaxPp(move);
}

void InitMoveWrapper(struct entity *entity, struct move *move, enum move_id move_id)
{
    InitMove(move, move_id);
}

int MoveIsNotPhysical(enum move_id move_id)
{
    s32 category = GetMoveCategory(move_id);

    if (category == CATEGORY_PHYSICAL) {
        return FALSE;
    } else if (category != CATEGORY_PHYSICAL) {
        return TRUE;
    }
    return TRUE;
}

bool8 CategoryIsNotPhysical(s32 category)
{
    if (category == CATEGORY_PHYSICAL) {
        return FALSE;
    } else if (category != CATEGORY_PHYSICAL) {
        return TRUE;
    }
    return TRUE;
}

void MakeFloorOneRoom(struct entity *user, struct entity *target)
{
    struct tile *tile;
    s32 terrain;
    s32 y;
    s32 i;
    struct entity *monster;
    bool8 monster_house;
    s32 secondary_terrain;
    bool8 make_secondary;
    s32 x;
    struct entity *mon;
    s32 j;

    if (IsFullFloorFixedRoom() ||
        DUNGEON_PTR[0]->gen_info.tileset_id == 26 ||
        DUNGEON_PTR[0]->gen_info.tileset_id == 27) {
        LogMessageByIdWithPopupCheckUser(user, MESSAGE_E01);
        return;
    }
    if (DUNGEON_PTR[0]->gen_info.force_create_monster_house) {
        LogMessageByIdWithPopupCheckUser(user, MESSAGE_DFF);
        return;
    }
    if (DUNGEON_PTR[0]->gen_info.unk_one_room_flag) {
        LogMessageByIdWithPopupCheckUser(user, MESSAGE_E00);
        return;
    }
    if (FloorSecondaryTerrainIsChasm(DUNGEON_PTR[0]->gen_info.tileset_id))
        secondary_terrain = TERRAIN_TYPE_CHASM;
    else
        secondary_terrain = TERRAIN_TYPE_SECONDARY;
    monster_house = FALSE;
    for (x = 1; x < DUNGEON_MAX_SIZE_X - 1; x++) {
        for (y = 1; y < DUNGEON_MAX_SIZE_Y - 1; y++) {
            make_secondary = FALSE;
            tile = GetTileSafe(x, y);
            tile->terrain_flags &= ~0x400;
            tile->room = 0;
            if (tile->terrain_flags & TERRAIN_TYPE_IMPASSABLE_WALL)
                continue;
            if (tile->terrain_flags & TERRAIN_TYPE_UNBREAKABLE)
                continue;
            tile->spawn_or_visibility_flags.visibility |= 3;
            tile->terrain_flags &= ~TERRAIN_TYPE_NATURAL_JUNCTION;
            if (tile->terrain_flags & TERRAIN_TYPE_IN_MONSTER_HOUSE)
                monster_house = TRUE;
            terrain = GetTerrainType(tile);
            if (terrain == TERRAIN_TYPE_SECONDARY || terrain == TERRAIN_TYPE_CHASM)
                continue;
            if (x == 1 || y == 1 || x == DUNGEON_MAX_SIZE_X - 2 ||
                y == DUNGEON_MAX_SIZE_Y - 2) {
                if (tile->object == NULL && !DUNGEON_PTR[0]->drought_orb_flag)
                    make_secondary = TRUE;
            }
            if (make_secondary) {
                tile->terrain_flags &= ~(TERRAIN_TYPE_NORMAL | TERRAIN_TYPE_SECONDARY);
                tile->terrain_flags |= secondary_terrain;
            } else if (terrain != TERRAIN_TYPE_NORMAL) {
                tile->terrain_flags &= ~(TERRAIN_TYPE_NORMAL | TERRAIN_TYPE_SECONDARY);
                tile->terrain_flags |= TERRAIN_TYPE_NORMAL;
                tile->terrain_flags |= 0x400;
            }
        }
    }
    if (StairsAlwaysReachable(DUNGEON_PTR[0]->gen_info.stairs_pos.x,
                              DUNGEON_PTR[0]->gen_info.stairs_pos.y, TRUE)) {
        for (x = 0; x < DUNGEON_MAX_SIZE_X; x++) {
            for (y = 0; y < DUNGEON_MAX_SIZE_Y; y++) {
                tile = GetTileSafe(x, y);
                if (!(tile->terrain_flags & TERRAIN_TYPE_UNBREAKABLE) &&
                    (tile->terrain_flags & 0x400) && (tile->terrain_flags & 0x8000)) {
                    tile->terrain_flags &= ~(TERRAIN_TYPE_NORMAL | TERRAIN_TYPE_SECONDARY);
                    tile->terrain_flags |= secondary_terrain;
                }
            }
        }
    }
    if (monster_house)
        DUNGEON_PTR[0]->gen_info.monster_house_room = 0;
    for (x = 0; x < DUNGEON_MAX_SIZE_X; x++) {
        for (y = 0; y < DUNGEON_MAX_SIZE_Y; y++) {
            if (monster_house)
                GetTileSafe(x, y)->terrain_flags |= TERRAIN_TYPE_IN_MONSTER_HOUSE;
            DetermineTileWalkableNeighbors(x, y);
        }
    }
    for (i = 0; i < DUNGEON_MAX_POKEMON; i++) {
        monster = DUNGEON_PTR[0]->active_monster_ptrs[i];
        if (EntityIsValid__0231EDD8(monster))
            monster->room_idx = GetTile(monster->pos.x, monster->pos.y)->room;
    }
    ov29_0233FB1C();
    ov29_0233785C();
    ov29_0233665C();
    DetermineAllMonsterShadow();
    UpdateMinimap();
    UpdateTrapsVisibility();
    LogMessageByIdWithPopupCheckUser(user, MESSAGE_DFE);
    ov29_022EA370(0x28, 0x2B);
    ov29_02305814(user, TRUE);
    for (j = 0; j < DUNGEON_MAX_POKEMON; j++) {
        mon = DUNGEON_PTR[0]->active_monster_ptrs[j];
        if (EntityIsValid__0231EDD8(mon)) {
            ActivateTerrainEffects(mon);
            if (EntityIsValid__0231EDD8(mon))
                EnsureCanStandCurrentTile(mon);
        }
    }
    DUNGEON_PTR[0]->gen_info.force_create_monster_house = TRUE;
    ov29_022EA370(0x14, 0x2B);
}
