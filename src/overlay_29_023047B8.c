#include "overlay_29_023047B8.h"
#include "dungeon_util_static.h"
#include "dg_object.h"
#include "dungeon_capabilities.h"
#include "dungeon_capabilities_1.h"
#include "dungeon_map_access_1.h"
#include "dungeon_util_1.h"
#include "main_0200224C.h"
#include "main_0205283C.h"
#include "options.h"
#include "overlay_29_022E272C.h"
#include "overlay_29_022E869C.h"
#include "overlay_29_022E9FC0.h"
#include "overlay_29_022EC7E8.h"
#include "overlay_29_022F7364.h"
#include "overlay_29_0230558C.h"
#include "overlay_29_02311010.h"
#include "position_util.h"
#include "secondary_terrain_types.h"
#include "overlay_29_02320764.h"

extern struct dungeon *DUNGEON_PTR[2];
extern const u8 ov29_02352808[4];
extern const s16 ov29_0235173C[];
extern const s16 ov29_0235173E[];
extern s32 ov29_0237C9CC;
extern u8 ov29_0237C9C1;
extern bool8 sub_02053038(s16 monster_id, s32 animation_group_id);
extern void WaitUntilAlertBoxTextIsLoaded(u32 message_id);
extern void ov29_02307DD0(void);
extern void ov29_0234AD10(struct entity *entity);
extern void HandleShopTransaction(s32 a);
extern void ov29_02346888(void);
extern void ActivateTerrainEffects(struct entity *entity);
extern void ov29_022EF9BC(void);
extern void EnemyEvolution(struct entity *entity);
extern void CheckLeaderTile(void);
extern void IsFloorOver2(void);
extern void TryForcedLoss(bool8 a);
extern void DiscoverMinimap(struct position *pos);
extern void SetSpriteIdForAnimationControl(struct animation_control *anim, s16 sprite_id);
extern void SetAndPlayAnimationForAnimationControl(struct animation_control *anim,
                                            s32 animation_group_id,
                                            s32 animation_id, s16 a, u8 b,
                                            u32 c, u8 d, u8 e);

bool8 EntityIsValid__023047B8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

void ov29_023047DC(void)
{
    s32 i;

    for (i = 0; i < DUNGEON_MAX_POKEMON; i++) {
        struct entity *entity = DUNGEON_PTR[0]->active_monster_ptrs[i];
        if (EntityIsValid__023047B8(entity))
            ov29_02304830(entity, GetIdleAnimationId(entity));
    }
}

void ov29_02304830(struct entity *entity, s32 animation_group_id)
{
    struct monster *monster = entity->info;
    s32 hallucinating;
    s32 a;

    hallucinating = DUNGEON_PTR[0]->display_data.hallucinating;
    if (entity == DUNGEON_PTR[0]->display_data.camera_target)
        hallucinating = 0;

    entity->field_0x28 = 0;
    entity->animation_group_id = entity->animation_group_id_mirror = animation_group_id;
    entity->animation_id = entity->animation_id_mirror0 = monster->action.direction;
    entity->field_0xb3 = 0;
    a = entity->field_0xac;
    if (monster->curse_class_status.curse != 2 && !hallucinating) {
        SetSpriteIdForAnimationControl(&entity->anim_ctrl, entity->sprite_index);
        SetAndPlayAnimationForAnimationControl(
            &entity->anim_ctrl, entity->animation_group_id, entity->animation_id, a,
            entity->field_0xaa, Rand16Bit() & 3, 0, 0);
    }
    else {
        SetSpriteIdForAnimationControl(&entity->anim_ctrl, DungeonGetSpriteIndex(0x229));
        SetAndPlayAnimationForAnimationControl(
            &entity->anim_ctrl, entity->animation_group_id, entity->animation_id, a,
            entity->field_0xaa, Rand16Bit() & 3, 0, 0);
    }
    entity->field_0xb2 = 0;
    if (!monster->is_not_team_member)
        ov29_022E8104();
}

void ov29_02304954(void)
{
    s32 i;

    for (i = 0; i < DUNGEON_MAX_POKEMON; i++) {
        struct entity *entity = DUNGEON_PTR[0]->active_monster_ptrs[i];
        if (EntityIsValid__023047B8(entity))
            ov29_02304830(entity, GetIdleAnimationId(entity));
    }
}

void ChangeMonsterAnimation(struct entity *entity, s32 animation_id, s32 direction)
{
    if (entity->type != ENTITY_MONSTER)
        return;

    entity->field_0x28 = 0;
    entity->animation_group_id = animation_id;
    if (direction < 0)
        return;

    if (direction < NUM_DIRECTIONS)
        entity->animation_id = direction;
}

void ov29_023049D4(struct entity *entity, s32 animation_id, s32 direction)
{
    if (entity->type != ENTITY_MONSTER)
        return;

    if (entity->animation_group_id_mirror == animation_id &&
        entity->animation_id_mirror0 == direction)
        return;

    ChangeMonsterAnimation(entity, animation_id, direction);
}

void MakeMonsterIdleInDirectionIfValid(struct entity *entity, s32 direction)
{
    struct monster *monster;

    if (entity->type != ENTITY_MONSTER)
        return;

    entity->animation_group_id = GetIdleAnimationId(entity);
    entity->field_0x28 = 0;
    if (direction < 0)
        return;

    if (direction < NUM_DIRECTIONS) {
        monster = entity->info;
        monster->action.direction = direction & DIRECTION_MASK;
        entity->animation_id = direction & DIRECTION_MASK;
    }
}

void ChangeMonsterAnimationToIdle(struct entity *entity, s32 direction)
{
    if (entity->type != ENTITY_MONSTER)
        return;

    entity->animation_group_id = GetIdleAnimationId(entity);
    entity->field_0x28 = 0;
    if (direction < 0)
        return;

    if (direction < NUM_DIRECTIONS)
        entity->animation_id = direction;
}

void ChangeMonsterAnimationToHurt(struct entity *entity, s32 direction)
{
    if (entity->type != ENTITY_MONSTER)
        return;

    entity->animation_group_id = 6;
    entity->field_0x28 = 0;
    if (direction < 0)
        return;

    if (direction < NUM_DIRECTIONS)
        entity->animation_id = direction;
}

s32 GetIdleAnimationId(struct entity *entity)
{
    struct monster *monster = entity->info;

    if (monster->sleep_class_status.sleep == STATUS_SLEEP_SLEEP ||
        monster->sleep_class_status.sleep == STATUS_SLEEP_NAPPING ||
        monster->sleep_class_status.sleep == STATUS_SLEEP_NIGHTMARE) {
        if (monster->apparent_id == 0xb9 &&
            monster->sleep_class_status.sleep_turns == 0x7f)
            return 7;

        return 5;
    }

    if (monster->bide_class_status.bide == STATUS_TWO_TURN_BIDE)
        return 0xb;

    return 7;
}

void MakeMonsterIdleInDirection(struct entity *entity, s32 direction)
{
    struct monster *monster = entity->info;

    monster->action.direction = direction & DIRECTION_MASK;
    ChangeMonsterAnimationToIdle(entity, direction & DIRECTION_MASK);
}

void ov29_02304B14(struct entity *entity)
{
    s32 i;
    struct monster *monster;

    if (!EntityIsValid__023047B8(entity))
        return;

    monster = entity->info;
    for (i = 0; i < 100; i++) {
        AdvanceFrame(0x21);
        if (!sub_02053038(monster->apparent_id, entity->animation_group_id_mirror))
            return;
    }
}

void DetermineAllMonsterShadow(void)
{
    s32 i;

    for (i = 0; i < DUNGEON_MAX_POKEMON; i++) {
        struct entity *entity = DUNGEON_PTR[0]->active_monster_ptrs[i];
        if (EntityIsValid__023047B8(entity))
            DetermineMonsterShadow(entity);
    }
}

s32 DetermineMonsterShadow(struct entity *entity)
{
    s32 terrain_type;
    s32 shadow_size;
    struct monster *monster;

    terrain_type = GetTerrainType(GetTileAtEntity(entity));
    monster = entity->info;
    shadow_size = GetShadowSize(monster->apparent_id);
    if (terrain_type == TERRAIN_TYPE_CHASM)
        return 6;

    if (terrain_type == TERRAIN_TYPE_NORMAL) {
        if (IsWaterTileset())
            shadow_size = ov29_02352808[shadow_size];
    }
    else if (terrain_type == TERRAIN_TYPE_SECONDARY) {
        if (SECONDARY_TERRAIN_TYPES[DUNGEON_PTR[0]->gen_info.tileset_id] !=
            SECONDARY_TERRAIN_LAVA)
            shadow_size = ov29_02352808[shadow_size];
    }

    monster->water_shadow_ripple_tracker = shadow_size;
    return shadow_size;
}

void ov29_02304C3C(struct entity *entity, s32 a)
{
    struct monster *monster;
    s16 start_direction;
    s16 direction;
    s16 i;

    if (!EntityIsValid__023047B8(entity))
        return;

    if (entity->type != ENTITY_MONSTER)
        return;

    monster = entity->info;
    start_direction = monster->action.direction;
    direction = start_direction;
    if (!ShouldDisplayEntityWrapper(entity))
        return;

    for (i = 0; i < a * NUM_DIRECTIONS; i++) {
        ChangeMonsterAnimationToIdle(entity, direction);
        ov29_022EA370(2, 0x43);
        direction++;
        direction &= DIRECTION_MASK;
    }

    while (direction != start_direction) {
        ChangeMonsterAnimationToIdle(entity, direction);
        ov29_022EA370(2, 0x43);
        direction++;
        direction &= DIRECTION_MASK;
    }

    ChangeMonsterAnimationToIdle(entity, direction);
    ov29_022EA370(2, 0x43);
}

void ov29_02304D20(struct entity *entity, s32 b, struct position *c)
{
    struct unk_02304D20 *e;
    s32 i;
    struct monster *monster = entity->info;

    if (monster->field_0x20c >= 4) {
        monster->action.action_id = ACTION_NOTHING;
        return;
    }

    ov29_0237C9CC = GetSpeedOption() ? 2 : 1;
    e = &monster->field_0x19c[monster->field_0x20c];
    e->field_0x1a = 0;
    e->field_0xc = b;
    e->pos.x = entity->pos.x;
    e->pos.y = entity->pos.y;
    e->field_0x4 = c->x;
    e->field_0x8 = c->y;
    e->field_0x10 = ov29_0237C9CC * ov29_0235173C[b * 2];
    e->field_0x14 = ov29_0237C9CC * ov29_0235173E[b * 2];
    ov29_0237C9CC = GetSpeedOption() ? 2 : 1;
    monster->field_0x20c++;
    if (monster->field_0x20c == 2) {
        s32 k;

        for (k = 0; k < 1; k++) {
            monster->field_0x19c[k].field_0x18 = 0x18 / (ov29_0237C9CC * 2);
            monster->field_0x19c[k].field_0x10 *= 2;
            monster->field_0x19c[k].field_0x14 *= 2;
        }
        e->field_0x18 = 0x18 / (ov29_0237C9CC * 2);
        e->field_0x10 *= 2;
        e->field_0x14 *= 2;
    }
    else if (monster->field_0x20c == 3) {
        s32 k;

        for (k = 0; k < 2; k++) {
            monster->field_0x19c[k].field_0x18 = 0x18 / (ov29_0237C9CC * 3);
            monster->field_0x19c[k].field_0x10 *= 3;
            monster->field_0x19c[k].field_0x14 *= 3;
            monster->field_0x19c[k].field_0x10 /= 2;
            monster->field_0x19c[k].field_0x14 /= 2;
        }
        e->field_0x18 = 0x18 / (ov29_0237C9CC * 3);
        e->field_0x10 *= 3;
        e->field_0x14 *= 3;
    }
    else if (monster->field_0x20c == 4) {
        for (i = 0; i < 3; i++) {
            monster->field_0x19c[i].field_0x18 = 0x18 / (ov29_0237C9CC * 4);
            monster->field_0x19c[i].field_0x10 *= 4;
            monster->field_0x19c[i].field_0x14 *= 4;
            monster->field_0x19c[i].field_0x10 /= 3;
            monster->field_0x19c[i].field_0x14 /= 3;
        }
        e->field_0x18 = 0x18 / (ov29_0237C9CC * 4);
        e->field_0x10 *= 4;
        e->field_0x14 *= 4;
    }
    else {
        e->field_0x18 = 0x18 / ov29_0237C9CC;
    }
}

bool8 DisplayActions(struct entity *a)
{
    s32 i;
    bool8 moved;
    bool8 display;
    s32 frame;
    struct entity *prev_active;
    struct entity *entity;
    struct unk_02304D20 *e;
    struct monster *monster;
    s32 pass;
    struct pixel_position pixel_pos;
    struct pixel_position pixel_pos2;
    struct position prev_pos;

    ov29_0237C9C1 = FALSE;
    moved = FALSE;
    display = FALSE;
    ov29_0237C9CC = GetSpeedOption() ? 2 : 1;
    for (i = 0; i < DUNGEON_MAX_POKEMON; i++) {
        struct entity *entity = DUNGEON_PTR[0]->active_monster_ptrs[i];
        struct monster *monster;

        if (!EntityIsValid__0230558C(entity))
            continue;

        monster = entity->info;
        if (monster->field_0x20c == 0) {
            s32 direction;

            if (!monster->waiting)
                continue;

            monster->waiting = FALSE;
            if (monster->target_pos.x == 0 && monster->target_pos.y == 0)
                continue;

            if (monster->target_pos.x == entity->pos.x &&
                monster->target_pos.y == entity->pos.y)
                continue;

            if (CheckVariousStatuses2__02301244(entity, TRUE) &&
                CheckVariousStatuses__023016DC(entity))
                continue;

            direction = GetDirectionTowardsPosition(&entity->pos, &monster->target_pos);
            if (direction == monster->action.direction)
                continue;

            ChangeMonsterAnimationToIdle(entity, direction);
        }
        else {
            monster->flags |= 0x2000;
            pixel_pos.x = ((monster->field_0x19c[0].field_0x4 * 0x18) + 0xc) << 8;
            pixel_pos.y = ((monster->field_0x19c[0].field_0x8 * 0x18) + 0x10) << 8;
            UpdateEntityPixelPos(entity, &pixel_pos);
            ov29_023049D4(entity, 0, monster->field_0x19c[0].field_0xc);
            monster->field_0x20e = 0;
            moved = TRUE;
            if (ShouldDisplayEntityWrapper(entity))
                display = TRUE;
        }
    }

    if (!moved)
        return FALSE;

    prev_active = DUNGEON_PTR[0]->current_active_entity;
    DUNGEON_PTR[0]->current_active_entity = a;
    if (!DUNGEON_PTR[0]->leader_running && display) {
        WaitUntilAlertBoxTextIsLoaded(0x35);
        for (frame = 0; frame < 0x18 / ov29_0237C9CC; frame++) {
            s32 j;

            AdvanceFrame(7);
            for (j = 0; j < DUNGEON_MAX_POKEMON; j++) {
                entity = DUNGEON_PTR[0]->active_monster_ptrs[j];

                if (!EntityIsValid__0230558C(entity))
                    continue;

                monster = entity->info;
                e = &monster->field_0x19c[monster->field_0x20e];
                if (monster->field_0x20c == 0)
                    continue;

                IncrementEntityPixelPosXY(entity, e->field_0x10, e->field_0x14);
                if (monster->is_team_leader && DUNGEON_PTR[0]->field_0x1dc.x >= 0) {
                    DUNGEON_PTR[0]->field_0x1dc.x = (s32)entity->pixel_pos.x >> 8;
                    DUNGEON_PTR[0]->field_0x1dc.y = (s32)entity->pixel_pos.y >> 8;
                }

                e->field_0x18--;
                if (e->field_0x18 != 0)
                    continue;

                monster->field_0x20e++;
                if (monster->field_0x20e == monster->field_0x20c) {
                    monster->field_0x20c = 0;
                    continue;
                }

                pixel_pos2.x =
                    ((monster->field_0x19c[monster->field_0x20e].field_0x4 * 0x18) + 0xc) << 8;
                pixel_pos2.y =
                    ((monster->field_0x19c[monster->field_0x20e].field_0x8 * 0x18) + 0x10) << 8;
                UpdateEntityPixelPos(entity, &pixel_pos2);
                ov29_023049D4(entity, 0,
                              monster->field_0x19c[monster->field_0x20e].field_0xc);
            }
        }
    }

    for (i = 0; i < DUNGEON_MAX_POKEMON; i++) {
        struct entity *entity = DUNGEON_PTR[0]->active_monster_ptrs[i];
        struct monster *monster;

        if (!EntityIsValid__0230558C(entity))
            continue;

        monster = entity->info;
        monster->field_0x20c = 0;
        if (monster->flags & 0x2000)
            UpdateEntityPixelPos(entity, NULL);
    }

    ov29_02307DD0();
    for (pass = 0; pass < 2; pass++) {
        for (i = 0; i < DUNGEON_MAX_POKEMON; i++) {
            struct entity *entity = DUNGEON_PTR[0]->active_monster_ptrs[i];
            struct monster *monster;

            if (!EntityIsValid__0230558C(entity))
                continue;

            if (IsFloorOver())
                break;

            monster = entity->info;
            if (pass == 0) {
                if (!monster->is_team_leader)
                    continue;
            }
            else if (monster->is_team_leader) {
                continue;
            }

            prev_pos = entity->pos;
            if (!(monster->flags & 0x2000)) {
                ov29_0234AD10(entity);
                if (!EntityIsValid__0230558C(entity))
                    continue;
            }
            else {
                monster->flags &= ~0x2000;
                if (monster->is_team_leader) {
                    DiscoverMinimap(&entity->pos);
                    HandleShopTransaction(0);
                    CheckLeaderTile();
                }
                else {
                    ov29_0234AD10(entity);
                    if (!EntityIsValid__0230558C(entity))
                        continue;

                    CheckNonLeaderTile(entity);
                }

                if (!EntityIsValid__0230558C(entity))
                    continue;

                if (IsFloorOver())
                    break;

                TryForcedLoss(FALSE);
                ActivateEndOfTurnEffects(entity);
                if (!EntityIsValid__0230558C(entity))
                    continue;

                if (IsFloorOver())
                    break;

                EnemyEvolution(entity);
                ov29_02346888();
                ov29_02305814(entity, DUNGEON_PTR[0]->gen_info.force_create_monster_house);
            }

            if (!EntityIsValid__0230558C(entity))
                continue;

            if (IsFloorOver())
                break;

            if (prev_pos.x != entity->pos.x || prev_pos.y != entity->pos.y)
                ov29_0237C9C1 = TRUE;

            ActivateTerrainEffects(entity);
            EnsureCanStandCurrentTile(entity);
        }
    }

    IsFloorOver2();
    if (IsFloorOver()) {
        DUNGEON_PTR[0]->current_active_entity = prev_active;
        return TRUE;
    }

    ov29_022EF9BC();
    DUNGEON_PTR[0]->current_active_entity = prev_active;
    return TRUE;
}
