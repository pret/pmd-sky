#include "overlay_29_02320764.h"
#include "dg_object.h"
#include "dg_uty.h"
#include "dungeon.h"
#include "dungeon_ai_movement.h"
#include "dungeon_logic_3.h"
#include "dungeon_map_access.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_2.h"
#include "dungeon_util_static.h"
#include "move_orb_effects.h"
#include "moves_1.h"
#include "weather.h"
#include "overlay_29_022E272C.h"
#include "overlay_29_022E4B8C.h"
#include "overlay_29_022E563C.h"
#include "overlay_29_022E99F0.h"
#include "overlay_29_022E9FC0.h"
#include "overlay_29_022EC7E8.h"
#include "overlay_29_0230558C.h"
#include "overlay_29_0230BBAC.h"
#include "overlay_29_023047B8.h"
#include "overlay_29_02321238.h"
#include "overlay_29_02336F4C.h"
#include "overlay_29_0234B340.h"
#include "overlay_29_02344088.h"
#include "overlay_29_022E9628.h"
#include "overlay_29_023456BC.h"

#ifdef JAPAN
#define MESSAGE_BFB 0x93A
#define MESSAGE_BFC 0x93B
#define MESSAGE_DBF 0xAFF
#define MESSAGE_DC0 0xB00
#define MESSAGE_E71 0xBB3
#define MESSAGE_E72 0xBB4
#define MESSAGE_E73 0xBB5
#define MESSAGE_E74 0xBB6
#define MESSAGE_E75 0xBB7
#else
#define MESSAGE_BFB 0xBFB
#define MESSAGE_BFC 0xBFC
#define MESSAGE_DBF 0xDBF
#define MESSAGE_DC0 0xDC0
#define MESSAGE_E71 0xE71
#define MESSAGE_E72 0xE72
#define MESSAGE_E73 0xE73
#define MESSAGE_E74 0xE74
#define MESSAGE_E75 0xE75
#endif

extern struct dungeon *DUNGEON_PTR[];
extern u32 DUNGEON_FRAMES_PASSED;
extern struct position *ov29_023529B8[];
extern s32 EXPLOSION_FIXED_DAMAGES[];

extern void ov29_02336694(s32 x, s32 y);
extern void DetermineTileWalkableNeighbors(s32 x, s32 y);
extern void UpdateMinimap(void);
extern bool8 TwoTurnMoveForcedMiss(struct entity *target, struct move *move);
extern void TryInflictPetrifiedStatus(struct entity *user, struct entity *target);
extern bool8 TryEndPetrifiedOrSleepStatus(struct entity *user, struct entity *target);
extern void MoveMonsterToPos(struct entity *entity, s32 x_pos, s32 y_pos,
                             bool8 reset_prev_pos_fields);
extern void UpdateCamera(s32 a);
extern bool8 CannotStandOnTile(struct entity *entity, struct position *pos);
extern bool8 CannotStandOnTileNoMonsterCheck(struct entity *entity, struct position *pos);
extern void ov29_022F42F8(struct entity *entity);
extern void DiscoverMinimap(struct position *pos);
extern void HandleShopTransaction(s32 a);
extern void ActivateTerrainEffects(struct entity *entity);

bool8 EntityIsValid__02320764(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

void TryAftermathExplosion(struct entity *attacker, struct entity *defender,
                           struct position *pos, s32 idx, enum type_id attack_type,
                           s16 damage_source)
{
    struct position tile_pos;
    struct position *p;
    struct tile *tile;
    s32 i;
    s32 dx;
    s32 dy;
    s32 x;
    s32 y;
    bool8 flag_a;
    bool8 flag_b;

    for (i = 0; i < DUNGEON_MAX_POKEMON; i++) {
        struct entity *mon = DUNGEON_PTR[0]->active_monster_ptrs[i];
        if (EntityIsValid__02320764(mon) && AbilityIsActiveVeneer(mon, ABILITY_DAMP))
            break;
    }

    if (i != DUNGEON_MAX_POKEMON) {
        ov29_022E55F0(attacker, defender);
        SubstitutePlaceholderStringTags(0, defender, 0);
        LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_BFC);
        return;
    }

    if (GetApparentWeather(defender) == WEATHER_RAIN) {
        LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_BFC);
        return;
    }

    ov29_022E5560(attacker, defender, idx);
    SubstitutePlaceholderStringTags(0, defender, 0);
    LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_BFB);

    flag_a = FALSE;
    flag_b = FALSE;
    for (p = ov29_023529B8[idx]; p->x != 0x63; p++) {
        tile_pos.x = p->x + pos->x;
        tile_pos.y = p->y + pos->y;
        if (tile_pos.x < 0 || tile_pos.y < 0)
            continue;
        if (tile_pos.x >= DUNGEON_MAX_SIZE_X || tile_pos.y >= DUNGEON_MAX_SIZE_Y)
            continue;

        tile = GetTileSafe(tile_pos.x, tile_pos.y);
        if (tile_pos.x >= 1 && tile_pos.y >= 1 && tile_pos.x < DUNGEON_MAX_SIZE_X - 1
            && tile_pos.y < DUNGEON_MAX_SIZE_Y - 1) {
            if (GetTerrainType(tile) == TERRAIN_TYPE_WALL
                && !(tile->terrain_flags & TERRAIN_TYPE_IMPASSABLE_WALL)) {
                tile->terrain_flags &= ~(TERRAIN_TYPE_NORMAL | TERRAIN_TYPE_SECONDARY);
                tile->terrain_flags |= TERRAIN_TYPE_NORMAL;
                for (dy = -1; dy <= 1; dy++) {
                    for (dx = -1; dx <= 1; dx++) {
                        ov29_02336694(tile_pos.x + dx, tile_pos.y + dy);
                    }
                }
                flag_a = TRUE;
                flag_b = TRUE;
            }
        }

        if (tile->object != NULL) {
            if (tile->object != defender && GetEntityType(tile->object) == ENTITY_ITEM)
                RemoveGroundItem(&tile_pos, FALSE);
            flag_a = TRUE;
        }

        if (tile->monster != NULL && tile->monster != defender
            && GetEntityType(tile->monster) == ENTITY_MONSTER) {
            CalcAftermathExplosionDamage(attacker, tile->monster, attack_type, damage_source,
                          EXPLOSION_FIXED_DAMAGES[idx]);
            if (IsFloorOver())
                break;
        }
    }

    if (IsFloorOver())
        return;

    if (GetEntityType(defender) == ENTITY_MONSTER
        && damage_source != DAMAGE_SOURCE_EXPLOSION) {
        CalcAftermathExplosionDamage(attacker, defender, attack_type, damage_source,
                      EXPLOSION_FIXED_DAMAGES[idx]);
    }

    if (flag_a) {
        if (flag_b) {
            for (y = 0; y < DUNGEON_MAX_SIZE_Y; y++) {
                for (x = 0; x < DUNGEON_MAX_SIZE_X; x++) {
                    DetermineTileWalkableNeighbors(x, y);
                }
            }
        }
        UpdateMinimap();
        UpdateTrapsVisibility();
    }
}

void CalcExplosionDamage(struct entity *attacker, struct entity *defender,
                   enum type_id attack_type, s16 damage_source, s32 fixed_damage)
{
    struct monster *info;
    struct move move;
    bool8 flag;
    s32 damage;

    if (!EntityIsValid__02320764(defender))
        return;

    info = GetEntInfo(defender);
    InitMove(&move, MOVE_REGULAR_ATTACK);
    if (TwoTurnMoveForcedMiss(defender, &move))
        return;

    if (!info->is_not_team_member) {
        damage = info->hp / 2;
        if (MonsterIsType(defender, TYPE_FIRE))
            damage /= 2;
        if (damage < 1)
            damage = 1;
    } else {
        damage = fixed_damage;
        if (MonsterIsType(defender, TYPE_FIRE))
            damage /= 2;
    }

    if (ExclusiveItemEffectIsActiveWithLogging(attacker, defender, TRUE, MESSAGE_DC0,
                                              EXCLUSIVE_EFF_NO_EXPLOSION_DAMAGE)) {
        damage = 1;
    } else if (ExclusiveItemEffectIsActiveWithLogging(attacker, defender, TRUE, MESSAGE_DBF,
                                                      EXCLUSIVE_EFF_HALVED_EXPLOSION_DAMAGE)) {
        damage /= 2;
    }

    CalcDamageFixedNoCategory(attacker, defender, damage, 0, &flag, attack_type,
                              damage_source, 0, 0, 0);
}

void CalcAftermathExplosionDamage(struct entity *attacker, struct entity *defender,
                   enum type_id attack_type, s16 damage_source, s32 fixed_damage)
{
    struct monster *info;
    struct move move;
    bool8 flag;
    s32 damage;

    if (!EntityIsValid__02320764(defender))
        return;

    info = GetEntInfo(defender);
    InitMove(&move, MOVE_REGULAR_ATTACK);
    if (TwoTurnMoveForcedMiss(defender, &move))
        return;

    if (!info->is_not_team_member) {
        damage = info->hp / 2;
        if (MonsterIsType(defender, TYPE_FIRE))
            damage /= 2;
        if (damage < 1)
            damage = 1;
    } else {
        damage = fixed_damage;
        if (MonsterIsType(defender, TYPE_FIRE))
            damage /= 2;
    }

    if (ExclusiveItemEffectIsActiveWithLogging(attacker, defender, TRUE, MESSAGE_DC0,
                                              EXCLUSIVE_EFF_NO_EXPLOSION_DAMAGE)) {
        damage = 1;
    } else if (ExclusiveItemEffectIsActiveWithLogging(attacker, defender, TRUE, MESSAGE_DBF,
                                                      EXCLUSIVE_EFF_HALVED_EXPLOSION_DAMAGE)) {
        damage /= 2;
    }

    if (damage >= info->hp)
        damage = info->hp - 1;
    if (damage < 0)
        damage = 0;

    CalcDamageFixedNoCategory(attacker, defender, damage, 0, &flag, attack_type,
                              damage_source, 0, 0, 0);
}

void TryWarp(struct entity *user, struct entity *target, s32 warp_type,
             struct position *pos)
{
    struct position p;
    struct monster *info;
    bool8 flag;
    bool8 blocked;
    s32 direction;

    flag = FALSE;
    info = GetEntInfo(target);
    SubstitutePlaceholderStringTags(0, target, 0);

    if (user != target
        && (user == NULL ? FALSE : (bool8)(GetEntityType(user) == ENTITY_MONSTER))
        && AbilityIsActiveVeneer(user, ABILITY_MOLD_BREAKER))
        blocked = FALSE;
    else
        blocked = AbilityIsActiveVeneer(target, ABILITY_SUCTION_CUPS);

    if (blocked) {
        LogMessageByIdWithPopupCheckUserTarget(user, target, MESSAGE_E74);
        return;
    }

    if (!AreTileJumpsAllowed(DUNGEON_PTR[0]->gen_info.fixed_room_id)) {
        LogMessageByIdWithPopupCheckUserTarget(user, target, MESSAGE_E72);
        return;
    }

    if (warp_type == 1 && DUNGEON_PTR[0]->gen_info.stairs_pos.x == target->pos.x
        && DUNGEON_PTR[0]->gen_info.stairs_pos.y == target->pos.y) {
        LogMessageByIdWithPopupCheckUserTarget(user, target, MESSAGE_E73);
        TryInflictPetrifiedStatus(user, target);
        return;
    }

    LogMessageByIdWithPopupCheckUserTarget(user, target, MESSAGE_E71);
    TryEndPetrifiedOrSleepStatus(target, target);
    ov29_022E5650(user, target);

    if (ShouldDisplayEntityWrapper(target)) {
        direction = info->action.direction;
        while (TRUE) {
            target->elevation += 0x800;
            if (target->elevation >= 0xA000)
                break;
            if ((DUNGEON_FRAMES_PASSED & 3) == 0) {
                direction = (direction + 1) & 7;
                info->action.direction = direction;
                ChangeMonsterAnimationToIdle(target, direction);
            }
            AdvanceFrame(0x22);
        }
    }

    switch (warp_type) {
    default:
        if (!GetRandomTile(&p, TRUE)) {
            flag = TRUE;
            p = target->pos;
        }
        break;
    case 1:
        if (!FindClosestUnoccupiedTileWithin2(&p, &DUNGEON_PTR[0]->gen_info.stairs_pos,
                                              FALSE)) {
            flag = TRUE;
            p = target->pos;
        }
        break;
    case 2:
        if (!FindClosestUnoccupiedTileWithin2(&p, pos, FALSE)) {
            flag = TRUE;
            p = target->pos;
        }
        break;
    case 3:
        p = *pos;
        break;
    case 4:
        if (!FindUnoccupiedTileWithin3(&p, &DUNGEON_PTR[0]->gen_info.stairs_pos, TRUE)) {
            flag = TRUE;
            p = target->pos;
        }
        break;
    case 5:
        if (!info->is_not_team_member && !info->is_team_leader) {
            if (FindClosestUnoccupiedTileWithin2(&p, &GetLeader()->pos, FALSE))
                break;
        }
        if (!GetRandomTile(&p, TRUE)) {
            flag = TRUE;
            p = target->pos;
        }
        break;
    }

    MoveMonsterToPos(target, p.x, p.y, TRUE);
    UpdateEntityPixelPos(target, NULL);
    sub_01FFB62C(target);
    UpdateCamera(1);

    if (ShouldDisplayEntityWrapper(target)) {
        direction = info->action.direction;
        target->elevation = 0xA000;
        while (TRUE) {
            target->elevation -= 0x400;
            if (target->elevation <= 0)
                break;
            if ((DUNGEON_FRAMES_PASSED & 3) == 0) {
                direction = (direction + 1) & 7;
                info->action.direction = direction;
                ChangeMonsterAnimationToIdle(target, direction);
            }
            AdvanceFrame(0x22);
        }
    }

    target->elevation = 0;
    AdvanceFrame(0x22);

    if (flag)
        LogMessageByIdWithPopupCheckUserTarget(user, target, MESSAGE_E75);

    if (warp_type == 1)
        TryInflictPetrifiedStatus(user, target);

    ov29_02321238(target);
}

void EnsureCanStandCurrentTile(struct entity *entity)
{
    if (CannotStandOnTile(entity, &entity->pos))
        TryWarp(entity, entity, 5, NULL);
}

void ov29_02321134(struct entity *entity)
{
    if (CannotStandOnTileNoMonsterCheck(entity, &entity->pos))
        TryWarp(entity, entity, 5, NULL);
}

void ov29_02321164(struct entity *a, struct entity *b)
{
    if (CannotStandOnTile(b, &b->pos))
        TryWarp(a, b, 5, NULL);
}

void ov29_0232119C(struct entity *entity, s32 a, s32 b)
{
    bool8 valid;

    if (entity == NULL)
        valid = FALSE;
    else
        valid = GetEntityType(entity) != ENTITY_NOTHING;

    if (!valid)
        return;

    if (a)
        ChangeMonsterAnimationToIdle(entity, 8);

    if (GetEntInfo(entity)->is_team_leader) {
        if (b)
            ov29_022F42F8(entity);
        DiscoverMinimap(&entity->pos);
        HandleShopTransaction(0);
    }

    ActivateTerrainEffects(entity);
    ov29_02305814(entity, DUNGEON_PTR[0]->gen_info.force_create_monster_house);
}
