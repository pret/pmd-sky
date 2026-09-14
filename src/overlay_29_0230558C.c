#include "overlay_29_0230558C.h"
#include "dg_uty.h"
#include "dungeon_capabilities.h"
#include "dungeon_items.h"
#include "dungeon_logic.h"
#include "dungeon_logic_7.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util_1.h"
#include "dungeon_util_2.h"
#include "dungeon_util_static.h"
#include "overlay_29_022E3F20.h"
#include "overlay_29_022EC7E8.h"
#include "overlay_29_022FFF28.h"
#include "overlay_29_02305C04.h"
#include "overlay_29_023061A8.h"
#include "overlay_29_02306728.h"
#include "overlay_29_0230F810.h"
#include "overlay_29_02336F4C.h"
#include "overlay_29_0234B104.h"
#include "overlay_29_0234B340.h"
#include "position_util.h"

#ifdef JAPAN
#define JPN_MSG_OFFSET -0x2C0
#else
#define JPN_MSG_OFFSET 0
#endif

extern struct dungeon *DUNGEON_PTR[];
extern const u16 ov29_02353318[];

extern s32 GetIdleAnimationId(struct entity *entity);
extern void ChangeMonsterAnimation(struct entity *entity, s32 animation_id, s32 direction);
extern void ov29_02337D68(struct position *pos);
extern struct trap *GetTrapInfo(struct entity *entity);
extern void TryTriggerTrap(struct entity *entity, struct position *pos, s32 a, s32 b);
extern void TryTriggerMonsterHouse(struct entity *entity, bool8 a);
extern void ov29_022E3A58(bool8 a);
extern bool8 ov29_022E2CA0(struct position *pos);
extern void ov29_022EA370(s32 a, s32 b);
extern void EndSleepClassStatus(struct entity *user, struct entity *target, bool8 a, bool8 b, bool8 c);
extern void EndFrozenClassStatus(struct entity *user, struct entity *target, bool8 log);
extern void EndCringeClassStatus(struct entity *user, struct entity *target);
extern void EndLeechSeedClassStatus(struct entity *user, struct entity *target);
extern void EndSureShotClassStatus(struct entity *user, struct entity *target);
extern void EndBlinkerClassStatus(struct entity *user, struct entity *target);
extern void EndMuzzledStatus(struct entity *user, struct entity *target);
extern void EndMiracleEyeStatus(struct entity *user, struct entity *target);
extern void ov29_022E543C(struct entity *entity);

bool8 EntityIsValid__0230558C(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

void ov29_023055B0(s32 a)
{
    s32 i;

    for (i = 0; i < DUNGEON_MAX_POKEMON; i++) {
        struct entity *entity = DUNGEON_PTR[0]->active_monster_ptrs[i];
        if (EntityIsValid__0230558C(entity)) {
            struct monster *monster = GetEntInfo(entity);
            if (!monster->is_team_leader) {
                if (IsTeamMemberOnFirstTurnInFixedRoom(monster))
                    return;

                if (monster->target_pos.x != 0 || monster->target_pos.y != 0) {
                    if (monster->target_pos.x != entity->pos.x ||
                        monster->target_pos.y != entity->pos.y) {
                        if (!CheckVariousStatuses2__02301244(entity, TRUE)) {
                            s32 direction =
                                GetDirectionTowardsPosition(&entity->pos, &monster->target_pos);
                            monster->action.direction = direction & DIRECTION_MASK;
                            ChangeMonsterAnimation(entity, GetIdleAnimationId(entity), direction);
                        }
                    }
                }
            }
        }
    }
}

void CheckNonLeaderTile(struct entity *entity)
{
    struct monster *monster = GetEntInfo(entity);
    struct tile *tile;
    struct entity *object;

    if (!EntityIsValid__0230558C(entity))
        return;

    tile = GetTileAtEntity(entity);
    if (IqSkillIsEnabled(entity, IQ_ABSOLUTE_MOVER) &&
        monster->invisible_class_status.status != STATUS_INVISIBLE_MOBILE) {
        bool8 item_active;
        if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
            item_active = FALSE;
        else
            item_active = HasHeldItem(entity, ITEM_MOBILE_SCARF);

        if (!item_active)
            ov29_02337D68(&entity->pos);
    }

    object = tile->object;
    if (object == NULL)
        return;

    switch (object->type) {
    case ENTITY_NOTHING:
    case ENTITY_MONSTER:
        break;
    case ENTITY_TRAP: {
        struct trap *trap = GetTrapInfo(object);
        bool8 trigger = FALSE;
        bool8 revealed = FALSE;

        if (!monster->is_not_team_member && IqSkillIsEnabled(entity, IQ_TRAP_SEER) &&
            !object->is_visible) {
            object->is_visible = TRUE;
            UpdateTrapsVisibility();
            revealed = TRUE;
        }

        if (trap->team == 0) {
            if (object->is_visible && !monster->is_not_team_member)
                trigger = TRUE;
        }
        else if (trap->team == 1) {
            if (monster->is_not_team_member)
                trigger = TRUE;
        }
        else if (trap->team == 2) {
            if (!monster->is_not_team_member)
                trigger = TRUE;
        }

        if (trigger && !revealed)
            TryTriggerTrap(entity, &entity->pos, FALSE, TRUE);
        break;
    }
    case ENTITY_ITEM:
        TryNonLeaderItemPickUp(entity);
        break;
    case ENTITY_HIDDEN_STAIRS:
    case ENTITY_TEMPORARY:
        break;
    }
}

void ov29_02305814(struct entity *entity, bool8 a)
{
    if (!EntityIsValid__0230558C(entity))
        return;

    if (GetEntInfo(entity)->is_not_team_member)
        return;

    if (IsFloorOver() || DUNGEON_PTR[0]->monster_house_triggered)
        return;

    if (!(GetTileAtEntity(entity)->terrain_flags & TERRAIN_TYPE_IN_MONSTER_HOUSE))
        return;

    LogMessageByIdWithPopupCheckUser(GetLeader(), 0xC82 + JPN_MSG_OFFSET);
    DUNGEON_PTR[0]->monster_house_triggered_event = TRUE;
    TryTriggerMonsterHouse(entity, a);
    ov29_022E3A58(FALSE);
    if (ov29_022E2CA0(&entity->pos))
        ov29_022EA370(0x78, 0x39);
}

s32 EndNegativeStatusCondition(struct entity *user, struct entity *target, bool8 a, bool8 b,
                               bool8 c)
{
    struct monster *monster;
    s32 result = FALSE;
    s32 speed_stage;
    s32 log_sealed = FALSE;
    s32 i;

    if (!EntityIsValid__02305C04(target))
        return result;

    monster = GetEntInfo(target);
    if (MonsterHasNegativeStatus(target, FALSE)) {
        result = TRUE;
        if (IsMonsterDrowsy(target))
            EndSleepClassStatus(user, target, FALSE, FALSE, TRUE);

        if (!EntityIsValid__02305C04(target))
            return FALSE;

        if (MonsterHasNonvolatileNonsleepStatus(target))
            EndBurnClassStatus(user, target);

        if (c) {
            if (MonsterHasImmobilizingStatus(target))
                EndFrozenClassStatus(user, target, TRUE);
        }
        else if (MonsterHasImmobilizingStatus(target) &&
                 monster->frozen_class_status.freeze != STATUS_FROZEN_WRAP) {
            EndFrozenClassStatus(user, target, TRUE);
        }

        if (MonsterHasAttackInterferingStatus(target))
            EndCringeClassStatus(user, target);

        if (MonsterHasSkillInterferingStatus(target))
            EndCurseClassStatus(user, target, 0, TRUE);

        if (MonsterHasLeechSeedStatus(target))
            EndLeechSeedClassStatus(user, target);

        if (MonsterHasWhifferStatus(target))
            EndSureShotClassStatus(user, target);

        if (IsMonsterVisuallyImpaired(target, FALSE))
            EndBlinkerClassStatus(user, target);

        if (IsMonsterMuzzled(target))
            EndMuzzledStatus(user, target);

        if (MonsterHasMiracleEyeStatus(target))
            EndMiracleEyeStatus(user, target);

        if (monster->perish_song_turns != 0) {
            monster->perish_song_turns = 0;
            LogMessageByIdWithPopupCheckUserTarget(user, target, 0xC83 + JPN_MSG_OFFSET);
        }

        if (monster->exposed) {
            monster->exposed = FALSE;
            LogMessageByIdWithPopupCheckUserTarget(user, target, 0xC84 + JPN_MSG_OFFSET);
        }
    }

    speed_stage = CalcSpeedStageWrapper(target);
    for (i = 0; i < NUM_SPEED_COUNTERS; i++)
        monster->speed_down_counters[i] = 0;

    if (speed_stage != CalcSpeedStageWrapper(target)) {
        result = TRUE;
        SubstitutePlaceholderStringTags(0, target, 0);
        LogMessageByIdWithPopupCheckUserTarget(user, target,
                                               ov29_02353318[monster->speed_stage]);
    }

    for (i = 0; i < MAX_MON_MOVES; i++) {
        struct move *move = &monster->moves.moves[i];
        if (MoveExists(move)) {
            if (move->flags2 & MOVE_FLAG_SEALED) {
                result = TRUE;
                log_sealed = TRUE;
                move->flags2 &= ~MOVE_FLAG_SEALED;
            }
        }
    }

    if (result) {
        if (a)
            ov29_022E543C(target);

        if (log_sealed)
            LogMessageByIdWithPopupCheckUserTarget(user, target, 0xC85 + JPN_MSG_OFFSET);
    }
    else if (!b) {
        LogMessageByIdWithPopupCheckUserTarget(user, target, 0xC86 + JPN_MSG_OFFSET);
    }

    UpdateStatusIconFlags(target);
    return result;
}
