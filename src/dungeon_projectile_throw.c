#include "dungeon_projectile_throw.h"
#include "dg_object.h"
#include "dungeon.h"
#include "dungeon_items.h"
#include "dungeon_map_access.h"
#include "dungeon_map_access_1.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "exclusive_item.h"
#include "main_0208655C.h"
#include "moves_1.h"

#ifdef JAPAN
#define CURVED_PROJECTILE_LOG_MESSAGE_1 0x920
#define CURVED_PROJECTILE_LOG_MESSAGE_2 0x923
#define CURVED_PROJECTILE_LOG_MESSAGE_3 0x922
#else
#define CURVED_PROJECTILE_LOG_MESSAGE_1 0xbe1
#define CURVED_PROJECTILE_LOG_MESSAGE_2 0xbe4
#define CURVED_PROJECTILE_LOG_MESSAGE_3 0xbe3
#endif

extern bool8 ov29_022E2CA0(struct position *pos);
extern void ov29_0234B4CC(bool8 val);
extern s32 SinAbs4096(s32 x);
extern bool8 ov29_022E9488(s32 inX, s32 inY, u8 index);
extern bool8 ov29_023457C8(struct entity *entity, bool8 hallucinating, u8 a2, u8 a3, u8 a4);
extern void AdvanceFrame(u32);
extern bool8 TwoTurnMoveForcedMiss(struct entity *target, struct move *move);
extern bool8 DoesProjectileHitTarget(struct entity *user, struct entity *target);
extern void PrepareItemForPrinting__02345754(u8 *buffer, struct item *item);
extern void SubstitutePlaceholderStringTags(u8 *string_id, struct entity *entity, u32 param_3);
extern void ov29_02304A84(struct entity *entity, u32 new_dir);
extern void LogMessageByIdWithPopupCheckUserTarget(struct entity *user, struct entity *target, u32 message_id);
extern bool8 TryEndPetrifiedOrSleepStatus(struct entity *user, struct entity *target);
extern void ApplyItemEffect(char param_1, u8 param_2, u8 param_3, struct entity *attacker, struct entity *defender, struct item *thrown_item);
extern void SpawnDroppedItem(struct entity *entity, struct entity *item_entity, struct item *item, bool8 param_4, struct position *dir_xy, u32 param_6);

bool8 ItemIsActive__02347B50(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}

bool8 ExclusiveItemEffectIsActive__02347B80(struct entity *entity, enum exclusive_item_effect_id effect_id)
{
    struct monster *monster = GetEntInfo(entity);
    if (!monster->is_not_team_member)
        return ExclusiveItemEffectFlagTest(monster->exclusive_item_effect_flags, effect_id);

    return FALSE;
}

bool8 EntityIsValid__02347BA4(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

void HandleCurvedProjectileThrow(struct entity *user, struct item *item, struct position *start_pos, struct position *target_pos, struct projectile_throw_info *projectile_throw_info)
{
    struct entity *projectile;
    bool8 r4;
    const struct tile *tile;
    bool8 throwResult;
    bool8 hallucinating;
    bool8 lockOnSpecs;
    struct projectile_hit_entry hitResult;

    hallucinating = DUNGEON_PTR[0]->display_data.hallucinating;
    hitResult.target = NULL;
    projectile = &DUNGEON_PTR[0]->thrown_item;

    projectile->type = ENTITY_ITEM;
    projectile->field_0x24 = 0;
    projectile->is_visible = TRUE;
    projectile->transparent = 0;
    projectile->info = item;
    projectile->elevation = 0;
    projectile->pos = *start_pos;

    SetEntityPixelPosXY(projectile, (start_pos->x * 24 + 4) << 8, (start_pos->y * 24 + 4) << 8);
    projectile->spawn_genid = 0;

    throwResult = 1;
    lockOnSpecs = FALSE;
    if (GetEntityType(user) == ENTITY_MONSTER && ItemIsActive__02347B50(user, ITEM_LOCKON_SPECS)) {
        lockOnSpecs = TRUE;
    }

    r4 = FALSE;
    if (ov29_022E2CA0(start_pos)) {
        r4 = TRUE;
    }
    if (ov29_022E2CA0(target_pos)) {
        r4 = TRUE;
    }

    ov29_0234B4CC(TRUE);
    if (r4) {
        s32 i;
        s32 posXFixed, posYFixed;
        s32 totalSteps;
        s32 arcHeight;
        s32 deltaXFixed;
        s32 deltaYFixed;
        s32 sinePhase;
        s32 sinePhaseStep;
        s32 unkX, unkY;
        bool8 runFrameActions;
        s32 posX, posY;
        s32 entPosX, entPosY;
        s32 absX, absY;
        s32 displayX, displayY;
        s32 sinVal;

        entPosX = projectile->pos.x;
        posX = target_pos->x;
        posY = target_pos->y;
        absX = abs(entPosX - posX);
        entPosY = projectile->pos.y;
        absY = abs(entPosY - posY);
        totalSteps = (absX + absY) * 12;
        arcHeight = totalSteps + 12;
        if (arcHeight >= 64) {
            arcHeight = 64;
        }

        sinePhase = 0;
        sinePhaseStep = 0x80000 / totalSteps;
        posXFixed = (start_pos->x * 24) * 256;
        posYFixed = (start_pos->y * 24) * 256;
        deltaXFixed = (((posX * 24) * 256) - posXFixed) / totalSteps;
        deltaYFixed = (((posY * 24) * 256) - posYFixed) / totalSteps;
        for (i = 0; i < totalSteps - 3; i++) {
            u8 terrainArg;

            runFrameActions = FALSE;
            sinVal = SinAbs4096(sinePhase >> 8) * arcHeight;
            displayX = posXFixed + 0x400;
            displayY = posYFixed + 0x400;

            projectile->elevation = sinVal;
            unkX = (posXFixed >> 8) + 8;
            unkY = (posYFixed >> 8) + 16;
            sinePhase += sinePhaseStep;
            SetEntityPixelPosXY(projectile, displayX, displayY);

            if (IsWaterTileset()) terrainArg = 3;
            else terrainArg = 0;

            if (ov29_022E9488(unkX, unkY, terrainArg))
                runFrameActions = TRUE;
            if (ov29_023457C8(projectile, hallucinating, 0, 0xFF, 1))
                runFrameActions = TRUE;

            if (runFrameActions)
                AdvanceFrame(0x17);

            posXFixed += deltaXFixed;
            posYFixed += deltaYFixed;
        }
    }
    projectile->pos = *target_pos;
    ov29_0234B4CC(FALSE);
    tile = GetTile(target_pos->x, target_pos->y);
    if (tile->monster != NULL) {
        bool8 canHit = TRUE;
        bool8 hasBounceBand = FALSE;

        if (GetEntityType(tile->monster) == ENTITY_MONSTER) {
            struct move move;

            if (ItemIsActive__02347B50(tile->monster, ITEM_BOUNCE_BAND) || ExclusiveItemEffectIsActive__02347B80(tile->monster, EXCLUSIVE_EFF_BOUNCE_THROWN_ITEMS)) {
                hasBounceBand = TRUE;
            }
            InitMove(&move, MOVE_PROJECTILE);
            if (TwoTurnMoveForcedMiss(tile->monster, &move)) {
                canHit = FALSE;
            }
        }
        if (canHit) {
            hitResult.target = tile->monster;
            if (hasBounceBand) {
                hitResult.did_hit = FALSE;
            }
            else {
                hitResult.did_hit = DoesProjectileHitTarget(user, hitResult.target);
            }

            PrepareItemForPrinting__02345754(0, item);
            SubstitutePlaceholderStringTags(0, hitResult.target, 0);
            if (hitResult.did_hit) {
                bool8 immobiSlpEndMsg;

                ov29_02304A84(hitResult.target, 8);
                LogMessageByIdWithPopupCheckUserTarget(user, hitResult.target, CURVED_PROJECTILE_LOG_MESSAGE_1);
                immobiSlpEndMsg = TryEndPetrifiedOrSleepStatus(user, hitResult.target);
                ApplyItemEffect(1, (lockOnSpecs || projectile_throw_info->unk0 != 0) ? 1 : 0, immobiSlpEndMsg, user, hitResult.target, item);
                throwResult = 0;
            }
            else {
                if (hasBounceBand) {
                    LogMessageByIdWithPopupCheckUserTarget(user, hitResult.target, CURVED_PROJECTILE_LOG_MESSAGE_2);
                }
                else {
                    LogMessageByIdWithPopupCheckUserTarget(user, hitResult.target, CURVED_PROJECTILE_LOG_MESSAGE_3);
                }
                throwResult = 1;
            }
        }
    }

    switch (throwResult) {
        case 0:
        case 2:
            break;
        case 1:
            SpawnDroppedItem(user, projectile, item, FALSE, NULL, 0);
            break;
    }
}
