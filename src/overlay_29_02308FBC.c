#include "overlay_29_02308FBC.h"
#include "common.h"
#include "dg_object.h"
#include "dg_random.h"
#include "dungeon_logic_6.h"
#include "dungeon_logic_7.h"
#include "dungeon_misc.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_recruitment.h"
#include "dungeon_recruitment_2.h"
#include "dungeon_statuses.h"
#include "dungeon_util_1.h"
#include "dungeon_visibility.h"
#include "joined_at_checks.h"
#include "main_0200D81C.h"
#include "main_0204D188.h"
#include "main_0204FDFC.h"
#include "options.h"
#include "overlay_29_022E272C.h"
#include "overlay_29_022E66C4.h"
#include "overlay_29_022EAE14.h"
#include "overlay_29_022EAEFC.h"
#include "overlay_29_022F0590.h"
#include "overlay_29_022F7364.h"
#include "overlay_29_0230A994.h"
#include "overlay_29_0230A9DC.h"
#include "overlay_29_0233847C.h"
#include "overlay_29_02344B9C.h"
#include "overlay_29_02349208.h"
#include "overlay_29_02349688.h"
#include "overlay_29_0234B024.h"
#include "overlay_29_0234BA54.h"
#include "position_util.h"
#include "util.h"
#include "dungeon_util_static.h"

struct unk_023528A4 {
    u8 field_0x0;
    s32 field_0x4;
};

struct unk_022C593C {
    s16 field_0x0;
    u8 filler[10];
};

extern void ActivateMotorDrive(struct entity* entity);
extern void AddExpSpecial(struct entity* attacker, struct entity* defender, s32 base_exp);
extern void AdvanceFrame(u32);
extern bool8 AftermathCheck(struct entity *attacker, struct entity *defender, s32 damage_source);
extern void ChangeMonsterAnimation(struct entity *entity, s32 animation_id, s32 direction);
extern void ChangeMonsterAnimationToIdle(struct entity* monster, enum direction_id direction);
extern void DisplayAnimatedNumbers(s32 amount, struct entity *entity, bool8 display_sign, s32 number_color);
extern void EndCurseClassStatus(struct entity* user, struct entity* target, u8 next_curse_class_status_being_applied, bool8 log_message);
extern void EndInvisibleClassStatus(struct entity* user, struct entity* target, bool8 no_slip_message);
extern int EndLeechSeedStatusForAllTargets();
extern bool8 ExclusiveItemEffectIsActiveWithLogging(struct entity* user, struct entity* target, bool8 should_log, s32 message_id, enum exclusive_item_effect_id effect_id);
extern void FillRecruitInfo(void *recruit_info, struct entity *monster);
extern void FreeOtherWrappedMonsters(u32 unique_id);
extern struct team_member* GetActiveTeamMember(s32 roster_idx);
extern s32 GetExp(enum monster_id monster_id, s32 level);
extern s32 GetIdleAnimationId(struct entity *entity);
extern void HandleFaint(struct entity *fainted_entity, s32 damage_source, struct entity *killer);
extern bool8 IsMonsterIdInNormalRangeVeneer(enum monster_id monster_id);
extern void LogMessageByIdWithPopup(struct entity* user, s32 message_id);
extern void LogMessageByIdWithPopupCheckUser(struct entity *user, u32 message_id);
extern void LogMessageByIdWithPopupCheckUserTarget(struct entity *user, struct entity *target, u32 message_id);
extern void MoveMonsterToPos(struct entity* entity, s32 x_pos, s32 y_pos, bool8 reset_prev_pos_fields);
extern enum music_id MusicTableIdxToMusicId(s32 music_table_idx);
extern s32 PlayEffectAnimationEntity(struct entity *entity, s32 id, s32 a, u8 b, s32 c, s32 d, s32 e, s32 f);
extern int PlayMissSfx__022E611C();
extern int PlayMissSfx__022E6150();
extern void RemoveHolderForItemInBag(struct item* item);
extern void RestorePpAllMovesSetFlags(struct entity* entity);
extern void RestoreRandomMovePP(struct entity* user, struct entity* target, s32 pp, bool8 log_message);
extern bool8 SpawnDroppedItemWrapper(struct entity *entity, struct position *pos, struct item *item, u32 param_4);
extern void SubInitMonster(struct monster* monster, bool8 flag);
extern void SubstitutePlaceholderStringTags(s32 slot, struct entity *entity, u32 param_3);
extern bool8 TryEndPetrifiedOrSleepStatus(struct entity *user, struct entity *target);
extern void TryIncreaseHp(struct entity *user, struct entity *target, s32 hp, s32 a, bool8 b);
extern bool8 TryRecruit(struct entity *user, struct entity *recruit, void *recruit_info);
extern void TrySpawnEnemyItemDrop(struct entity* attacker, struct entity* defender);
extern void UnfreezeAnim(struct entity *e);
extern void UpdateShopkeeperModeAfterAttack(struct entity* attacker, struct entity* defender);
extern void UpdateStatusIconFlags(struct entity *);
extern void UpdateTrapsVisibility(void);
extern s32 abs(s32 n);
extern int ov10_022BDC68();
extern int TerminateEffectWrapper();
extern int ov10_022BF964();
extern int ov29_022E5478();
extern int ov29_022E550C();
extern void ov29_022E81F8(void);
extern void ov29_022EA370(s32 a, s32 b);
extern int ov29_022ECD84();
extern int ov29_022EFB20();
extern int ov29_022EFB84();
extern int ov29_022F0534();
extern int ov29_022F0780();
extern int ov29_022F9AF4();
extern int ov29_022FB98C();
extern int ov29_022FBD24();
extern int ov29_02303E0C();
extern int ov29_02304830();
extern int ov29_02307C48();
extern int ov29_0230D628();
extern int ov29_0230D688();
extern int ov29_0230D7D4();
extern int ov29_0234B1A4();

extern struct unk_023528A4 TYPE_DAMAGE_NEGATING_EXCLUSIVE_ITEM_EFFECTS[];
extern s16 SET_DAMAGE_STATUS_DAMAGE;
extern s16 ov10_022C45C4;
extern s32 ov10_022C4834;
extern s16 ov10_022C45FC;
extern struct unk_022C593C ov10_022C593C[];
extern s16 ov29_023535D4;
extern u16 DAMAGE_STRING_IDS[];
extern u16 DEFEAT_STRING_IDS[];
extern u16 ov29_02353218[];
extern u16 ov29_02353220[];
extern u16 ov29_02353224[];
extern u16 ov29_02353228[];
extern u16 ov29_0235322C[];
extern u16 ov29_02353230[];
extern u16 ov29_02353234[];
extern bool8 ov29_0237CA6C;
extern struct dungeon *DUNGEON_PTR;
extern struct bag_items *BAG_ITEMS_PTR_MIRROR;

bool8 EntityIsValid__02308FBC(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

#ifdef JAPAN
#define MESSAGE_C40 0x97F
#define MESSAGE_C41 0x980
#define MESSAGE_C42 0x981
#define MESSAGE_C43 0x982
#define MESSAGE_C44 0x983
#define MESSAGE_C45 0x984
#define MESSAGE_C46 0x985
#define MESSAGE_C47 0x986
#define MESSAGE_C48 0x987
#define MESSAGE_C49 0x988
#define MESSAGE_C4A 0x989
#define MESSAGE_C4B 0x98A
#define MESSAGE_C4C 0x98B
#define MESSAGE_C4D 0x98C
#define MESSAGE_C6A 0x9A9
#define MESSAGE_C6B 0x9AA
#define MESSAGE_C6C 0x9AB
#define MESSAGE_C6D 0x9AC
#else
#define MESSAGE_C40 0xC40
#define MESSAGE_C41 0xC41
#define MESSAGE_C42 0xC42
#define MESSAGE_C43 0xC43
#define MESSAGE_C44 0xC44
#define MESSAGE_C45 0xC45
#define MESSAGE_C46 0xC46
#define MESSAGE_C47 0xC47
#define MESSAGE_C48 0xC48
#define MESSAGE_C49 0xC49
#define MESSAGE_C4A 0xC4A
#define MESSAGE_C4B 0xC4B
#define MESSAGE_C4C 0xC4C
#define MESSAGE_C4D 0xC4D
#define MESSAGE_C6A 0xC6A
#define MESSAGE_C6B 0xC6B
#define MESSAGE_C6C 0xC6C
#define MESSAGE_C6D 0xC6D
#endif

extern void ov29_02307DC0(struct entity *entity);
#ifdef EUROPE
extern u16 ov29_02353E44[];
#endif

bool8 ApplyDamage(struct entity *attacker, struct entity *defender,
                  struct unk_02308FE0 *damage_data, int a4, int a5,
                  enum damage_source_non_move damage_source, int a7)
{
    bool8 played_hurt_anim;
    struct unk_023528A4 *neg;
    struct tile *tile;
    struct team_member *member;
    struct item *reviver_seed;
    struct item *revival_item;
    bool8 proceed;
    bool8 is_wild_enemy;
    bool8 face_attacker;
    bool8 gained_exp;
    s32 defeat_idx;
    s32 hp_lost;
    struct monster *dmon;
    s32 hp;
    s32 exp;
    struct monster *amon;
    u8 music;
    s32 i;
    struct entity *other;
    s32 j;
    struct item *bag_item;
    struct item *held_item;
    s16 anim;
    u16 message_id;
    struct position revive_pos;
    u8 recruit_info[0x48];
#ifdef EUROPE
    bool8 defer_defeat_message;
#endif

    damage_data->field_0x10 = FALSE;
    played_hurt_anim = FALSE;
    tile = NULL;
    is_wild_enemy = FALSE;

    if (defender->type != 1
        || IsSecretBazaarNpcBehavior(
               ((struct monster *)defender->info)->monster_behavior)) {
        damage_data->field_0x10 = TRUE;
        return FALSE;
    }

    if (((struct monster *)defender->info)->is_not_team_member
        && !((struct monster *)defender->info)->is_ally) {
        is_wild_enemy = TRUE;
    }
    dmon = defender->info;

    TryEndPetrifiedOrSleepStatus(attacker, defender);
    UpdateShopkeeperModeAfterAttack(attacker, defender);

    if (attacker->type == 1
        && ((struct monster *)attacker->info)->sure_shot_class_status.sure_shot == 3
        && !damage_data->field_0xf) {
        damage_data->field_0x0 = SET_DAMAGE_STATUS_DAMAGE;
    }

    if (attacker->type == 1) {
#ifdef JAPAN
        if (DefenderAbilityIsActive__0230A940(attacker, defender,
                                              ABILITY_MAGIC_GUARD)
#else
        if (DefenderAbilityIsActive__0230A940(attacker, defender,
                                              ABILITY_MAGIC_GUARD, TRUE)
#endif
            && damage_data->field_0x4 != 4
            && damage_data->field_0x4 != 0xE
            && damage_data->field_0x4 != 0
            && damage_data->field_0x4 != 0x17) {
            SubstitutePlaceholderStringTags(1, defender, 0);
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C46);
            if (ShouldDisplayEntityWrapper(attacker)
                && ShouldDisplayEntityWrapper(defender)) {
                PlayMissSfx__022E611C(attacker, defender);
            }
            damage_data->field_0x10 = TRUE;
            return FALSE;
        }
    } else if (attacker->type == 6) {
        if (AbilityIsActiveVeneer(defender, ABILITY_MAGIC_GUARD)
            && damage_data->field_0x4 != 4
            && damage_data->field_0x4 != 0xE
            && damage_data->field_0x4 != 0x17) {
            SubstitutePlaceholderStringTags(1, defender, 0);
            LogMessageByIdWithPopupCheckUser(defender, MESSAGE_C46);
            if (ShouldDisplayEntityWrapper(defender)) {
                PlayMissSfx__022E6150(defender);
            }
            damage_data->field_0x10 = TRUE;
            return FALSE;
        }
    }

    if (damage_source != 0x24D && attacker->type == 1
#ifdef JAPAN
        && DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_STURDY)
#else
        && DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_STURDY,
                                             TRUE)
#endif
        && damage_data->field_0x0 == 0x270F) {
        SubstitutePlaceholderStringTags(1, defender, 0);
        LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C40);
        PlayMissSfx__022E611C(attacker, defender);
        damage_data->field_0x10 = TRUE;
        return FALSE;
    }

    if (dmon->frozen_class_status.freeze == 1) {
        if (damage_source != 0x250) {
            SubstitutePlaceholderStringTags(1, defender, 0);
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C41);
            PlayMissSfx__022E611C(attacker, defender);
        }
        damage_data->field_0x10 = TRUE;
        return FALSE;
    }

    if ((dmon->sleep_class_status.sleep == 1 || dmon->sleep_class_status.sleep == 5
         || dmon->sleep_class_status.sleep == 3)
        && dmon->sleep_class_status.sleep_turns == 0x7F) {
        ov29_02307C48(defender);
    }

    if (attacker->type == 1) {
#ifdef JAPAN
        if (DefenderAbilityIsActive__0230A940(attacker, defender,
                                              ABILITY_VOLT_ABSORB)
#else
        if (DefenderAbilityIsActive__0230A940(attacker, defender,
                                              ABILITY_VOLT_ABSORB, TRUE)
#endif
            && damage_data->field_0xc == 5) {
            TryIncreaseHp(attacker, defender, damage_data->field_0x0, 0, 0);
            damage_data->field_0x10 = TRUE;
            return FALSE;
        }
#ifdef JAPAN
        if (DefenderAbilityIsActive__0230A940(attacker, defender,
                                              ABILITY_WATER_ABSORB)
#else
        if (DefenderAbilityIsActive__0230A940(attacker, defender,
                                              ABILITY_WATER_ABSORB, TRUE)
#endif
            && damage_data->field_0xc == 3) {
            TryIncreaseHp(attacker, defender, damage_data->field_0x0, 0, 0);
            damage_data->field_0x10 = TRUE;
            return FALSE;
        }
#ifdef JAPAN
        if (DefenderAbilityIsActive__0230A940(attacker, defender,
                                              ABILITY_DRY_SKIN)
#else
        if (DefenderAbilityIsActive__0230A940(attacker, defender,
                                              ABILITY_DRY_SKIN, TRUE)
#endif
            && damage_data->field_0xc == 3) {
            TryIncreaseHp(attacker, defender, damage_data->field_0x0, 0, 0);
            damage_data->field_0x10 = TRUE;
            return FALSE;
        }
#ifdef JAPAN
        if (DefenderAbilityIsActive__0230A940(attacker, defender,
                                              ABILITY_MOTOR_DRIVE)
#else
        if (DefenderAbilityIsActive__0230A940(attacker, defender,
                                              ABILITY_MOTOR_DRIVE, TRUE)
#endif
            && damage_data->field_0xc == 5) {
            ActivateMotorDrive(defender);
            damage_data->field_0x10 = TRUE;
            return FALSE;
        }
    }

    neg = TYPE_DAMAGE_NEGATING_EXCLUSIVE_ITEM_EFFECTS;
    while (neg->field_0x0 != 0x12) {
        if (neg->field_0x0 == damage_data->field_0xc
            && ExclusiveItemEffectIsActiveWithLogging(attacker, defender, 0, 0,
                                                     (enum exclusive_item_effect_id)(neg->field_0x4 & 0xFF))) {
            if (neg->field_0x4 > 0x71) {
                TryIncreaseHp(attacker, defender, damage_data->field_0x0, 0, 1);
            } else {
                damage_data->field_0x10 = TRUE;
            }
            proceed = FALSE;
            goto negation_checked;
        }
        neg++;
    }
    proceed = TRUE;
negation_checked:

    if (!proceed) {
        if (damage_data->field_0x10) {
            if (attacker->type == 1) {
                if (ShouldDisplayEntityWrapper(attacker)
                    && ShouldDisplayEntityWrapper(defender)) {
                    ov29_022FB98C(attacker, defender);
                }
            } else if (ShouldDisplayEntityWrapper(defender)) {
                ov29_022FB98C(attacker, defender);
            }
        }
        damage_data->field_0x10 = TRUE;
        return FALSE;
    }

    if (damage_data->field_0x0 > 0
        && ExclusiveItemEffectIsActive__0230A9B8(defender,
                                            EXCLUSIVE_EFF_MAY_RESTORE_PP_FROM_DAMAGE)
        && DungeonRandOutcome__022EAB20(ov10_022C45C4)) {
        RestoreRandomMovePP(defender, defender, 1, 0);
    }

    if (!dmon->apply_flash_fire_boost) {
        if (damage_data->field_0xe) {
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C42);
        }
        switch (damage_data->field_0x8) {
        case 0:
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C43);
            break;
        case 1:
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C44);
            break;
        case 3:
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C45);
            break;
        }
    }

    SubstitutePlaceholderStringTags(0, attacker, 0);
    SubstitutePlaceholderStringTags(1, defender, 0);

    if (damage_data->field_0x0 == 0) {
        if (ShouldDisplayEntityWrapper(attacker)
            && ShouldDisplayEntityWrapper(defender)) {
            if (!dmon->apply_flash_fire_boost) {
                LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C47);
            }
            PlayMissSfx__022E611C(attacker, defender);
        } else {
            if (!dmon->apply_flash_fire_boost) {
                LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C47);
            }
            ov29_022EA370(0x1E, 0x18);
        }
        damage_data->field_0x10 = TRUE;
        return FALSE;
    }

    if (damage_data->field_0x0 == 0x270F) {
        if (a7 && ShouldDisplayEntityWrapper(defender)) {
            tile = GetTileAtEntity(defender);
            anim = PlayEffectAnimationEntity(defender, 0x2B5, 0, 3, 0, 1, 0, 0);
            ov29_023535D4 = -1;
            if (anim != -1) {
                while (ov10_022BF964(anim)) {
                    AdvanceFrame(0x18);
                }
                TerminateEffectWrapper(anim);
                ov29_023535D4 =
                    PlayEffectAnimationEntity(defender, 0x2B6, 0, 3, 0, 1, 0, 0);
            }
        }
        if (!dmon->apply_flash_fire_boost) {
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C48);
        }
        dmon->bide_damage_tally = 0x3E7;
    } else {
        SetMessageLogPreprocessorArgsNumberVal(0, damage_data->field_0x0);

        if (damage_data->field_0x4 >= 0x1B) {
            message_id = 0;
        } else {
            message_id = DAMAGE_STRING_IDS[damage_data->field_0x4];
        }

        dmon->bide_damage_tally += damage_data->field_0x0;
        if (dmon->bide_damage_tally > 0x3E7) {
            dmon->bide_damage_tally = 0x3E7;
        }

        if (ShouldDisplayEntityWrapper(defender)) {
            if (damage_data->field_0x4 != 0xE
                && damage_data->field_0x4 != 0x17
                && damage_source != 0x25F) {
                DisplayAnimatedNumbers(-damage_data->field_0x0, defender, TRUE,
                                       -1);
            }
            if (!dmon->apply_flash_fire_boost && message_id != 0) {
                LogMessageByIdWithPopupCheckUserTarget(attacker, defender,
                                                      message_id);
            }
        } else if (!dmon->apply_flash_fire_boost && message_id != 0) {
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, message_id);
        }
    }

    if ((damage_data->field_0x4 != 0xE || dmon->hp <= 1) && tile == NULL
        && ShouldDisplayEntityWrapper(defender)) {
        if ((attacker->pos.x != defender->pos.x
             || attacker->pos.y != defender->pos.y)
            && attacker->type == 1) {
            face_attacker = FALSE;
            if (dmon->is_team_leader && GetDamageTurnOption()
                && !ov29_022F9AF4(defender)
                && CanSeeTarget(defender, attacker)) {
                face_attacker = TRUE;
            }
            if (dmon->blinker_class_status.blinded == 2
                || IsBlinded(defender, TRUE)) {
                face_attacker = FALSE;
            }
            if (face_attacker) {
                struct monster *target_mon = defender->info;

                target_mon->action.direction =
                    GetDirectionTowardsPosition(&defender->pos, &attacker->pos) & 7;
            }
            UpdateAiTargetPos(defender);
        }
        if (damage_source != 0x25F) {
            ChangeMonsterAnimation(defender, 6,
                                   ((struct monster *)defender->info)->action.direction);
            ov29_022E5478(defender, damage_data);
            played_hurt_anim = TRUE;
        }
    }

    if (dmon->is_not_team_member && damage_data->field_0x0 > 0
        && attacker->type == 1
        && !((struct monster *)attacker->info)->is_not_team_member) {
        SetMonsterFlag2(dmon->id);
        SetPokemonBattled(dmon->id);
    }

    hp_lost = dmon->hp;
    if (hp_lost > damage_data->field_0x0) {
        dmon->hp = hp_lost - damage_data->field_0x0;
    } else {
        dmon->hp = 0;
    }

    if (dmon->reflect_class_status.reflect == 9) {
        if (dmon->hp == 0) {
            dmon->hp = 1;
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C49);
        }
    } else if (a4 == 1) {
        if (dmon->hp == 0) {
            dmon->hp = 1;
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C4A);
        }
    } else if (ExclusiveItemEffectIsActive__0230A9B8(defender, EXCLUSIVE_EFF_MAY_ENDURE)
               && DungeonRandOutcome__022EAB20(ov10_022C4834)
               && dmon->hp == 0) {
        dmon->hp = 1;
        LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C49);
    }

    ov29_022E81F8();

    hp_lost -= dmon->hp;
    if (hp_lost < 0) {
        hp_lost = 0;
    }

    if (played_hurt_anim || tile != NULL) {
        ov29_022EA370(0xA, 0x18);
    }

#ifndef JAPAN
    UpdateStatusIconFlags(defender);
#endif

    if (dmon->hp != 0) {
        if (played_hurt_anim) {
            ChangeMonsterAnimationToIdle(defender, DIR_CURRENT);
        }
        if (damage_data->field_0x4 != 0xE) {
            if (ItemIsActive__0230A9DC(defender, ITEM_JOY_RIBBON) && hp_lost > 0
                && damage_data->field_0x0 != 0x270F) {
                AddExpSpecial(attacker, defender, ov10_022C45FC);
            }
            if (ExclusiveItemEffectIsActive__0230A9B8(defender, EXCLUSIVE_EFF_EXP_FROM_DAMAGE)
                && hp_lost > 0 && damage_data->field_0x0 != 0x270F) {
                AddExpSpecial(attacker, defender, ov10_022C45FC);
            }
        }
        if (tile != NULL) {
            ov29_0230D7D4(defender);
            UpdateTrapsVisibility();
        }
        return FALSE;
    }

    if (damage_source == 0x25F) {
        ChangeMonsterAnimation(defender, 6,
                               ((struct monster *)defender->info)->action.direction);
        ov29_022E5478(defender, damage_data);
        ov29_022EA370(0xA, 0x18);
        played_hurt_anim = TRUE;
    }

    if (dmon->invisible_class_status.status == 2) {
        EndInvisibleClassStatus(attacker, defender, 0);
    }

    if (tile != NULL) {
        ov29_022EA370(0x14, 0x18);
        defender->transparent = 2;
        ov29_0230D7D4(defender);
        UpdateTrapsVisibility();
    } else if (played_hurt_anim) {
        defender->transparent = 1;
        ov29_022EA370(0x1E, 0x18);
    }

    defeat_idx = 1;
    if (EntityIsValid__02308FBC(attacker) && attacker->type == 1
        && attacker != defender) {
        defeat_idx = 0;
    }

    dmon->field_0x156 = 0;
    SubstitutePlaceholderStringTags(0, attacker, 0);
    SubstitutePlaceholderStringTags(1, defender, 0);

#ifdef EUROPE
    defer_defeat_message = FALSE;
#endif

    if (damage_data->field_0x4 == 0x13 || damage_data->field_0x4 == 4
        || damage_data->field_0x4 == 0x14) {
        if (dmon->is_not_team_member) {
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C4B);
        } else {
            LogMessageByIdWithPopup(attacker, MESSAGE_C4B);
        }
    } else if (dmon->is_not_team_member) {
        if (dmon->monster_behavior == 7) {
            LogMessageByIdWithPopup(attacker, ov29_02353220[defeat_idx]);
        } else {
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender,
                                                  DEFEAT_STRING_IDS[defeat_idx]);
        }
    } else {
        member = GetActiveTeamMember(dmon->team_index);
        if (dmon->is_team_leader
            || (JoinedAtRangeCheck2Veneer(dmon->joined_at)
                && !DUNGEON_PTR->nonstory_flag)) {
            LogMessageByIdWithPopup(attacker, ov29_02353228[defeat_idx]);
        } else if (IsExperienceLocked(dmon)) {
            if (IsSpecialStoryAlly(dmon)) {
                LogMessageByIdWithPopup(attacker, ov29_02353234[defeat_idx]);
            } else {
                LogMessageByIdWithPopup(attacker, ov29_0235322C[defeat_idx]);
            }
        } else if (dmon->monster_behavior == 7) {
            LogMessageByIdWithPopup(attacker, ov29_02353220[defeat_idx]);
        } else if (IsMonsterIdInNormalRangeVeneer((enum monster_id)member->member_index)) {
            if (DUNGEON_PTR->send_home_disabled) {
                LogMessageByIdWithPopup(attacker, ov29_02353224[defeat_idx]);
            } else {
                LogMessageByIdWithPopup(attacker, ov29_02353230[defeat_idx]);
            }
        } else {
#ifdef EUROPE
            defer_defeat_message = TRUE;
#else
            LogMessageByIdWithPopup(attacker, ov29_02353218[defeat_idx]);
#endif
        }
    }

    if (dmon->frozen_class_status.freeze == 3
        || dmon->frozen_class_status.freeze == 4) {
        FreeOtherWrappedMonsters(dmon->wrap_pair_unique_id);
    }

    held_item = &dmon->held_item;
    if (GetFlag(held_item->flags, 1) && !GetFlag(held_item->flags, 8)
        && !(dmon->held_item.flags & 2)
        && held_item->id == 0x153) {
        ov29_022E550C(defender);
        defender->transparent = 0;
        hp = dmon->max_hp_stat + dmon->max_hp_boost;
        if (hp > 0x3E7) {
            hp = 0x3E7;
        }
        dmon->hp = hp;
        dmon->field_0x162 = 0;
        dmon->field_0x156 = TRUE;
        dmon->belly = dmon->max_belly;
        if (dmon->is_team_leader) {
            DUNGEON_PTR->leader_hunger_message_tracker = 0;
            DUNGEON_PTR->identify_orb_flag = 0;
        }
        ItemZInit(&dmon->held_item);
        if (dmon->curse_class_status.curse == 3) {
            EndCurseClassStatus(attacker, defender, 3, 1);
        } else if (dmon->curse_class_status.curse == 2) {
            EndCurseClassStatus(attacker, defender, 2, 1);
        }
        EndLeechSeedStatusForAllTargets(defender);
        SubInitMonster(dmon, 0);
        ov10_022BDC68();
        RestorePpAllMovesSetFlags(defender);
        ov29_02304830(defender, GetIdleAnimationId(defender));
        UpdateStatusIconFlags(defender);
        SubstitutePlaceholderStringTags(1, defender, 0);
        LogMessageByIdWithPopup(attacker, MESSAGE_C4C);
        ov29_0230D628(defender);
        return FALSE;
    }

    if (dmon->is_team_leader
        && GetFlag(dmon->held_item.flags, 1)
        && !GetFlag(dmon->held_item.flags, 8)
        && dmon->held_item.id == 0x159) {
        other = NULL;
        for (i = 0; i < 4; i++) {
            other = DUNGEON_PTR->monster_slot_ptrs[i];
            if (EntityIsValid__02308FBC(other) && other != defender
                && CanSeeTarget(defender, other)
                && abs(other->pos.x - defender->pos.x) <= 1
                && abs(other->pos.y - defender->pos.y) <= 1) {
                break;
            }
        }
        if (i != 4) {
            ov29_022E550C(defender);
            SubstitutePlaceholderStringTags(0, defender, 0);
            revive_pos = other->pos;
            HandleFaint(other, DAMAGE_SOURCE_POSSESS, defender);
            MoveMonsterToPos(defender, revive_pos.x, revive_pos.y, 1);
            UpdateEntityPixelPos(defender, 0);
            defender->transparent = 0;
            hp = dmon->max_hp_stat + dmon->max_hp_boost;
            if (hp > 0x3E7) {
                hp = 0x3E7;
            }
            dmon->hp = hp;
            ov29_022E66D8(defender);
            dmon->field_0x162 = 0;
            dmon->field_0x156 = TRUE;
            dmon->belly = dmon->max_belly;
            if (dmon->is_team_leader) {
                DUNGEON_PTR->leader_hunger_message_tracker = 0;
                DUNGEON_PTR->identify_orb_flag = 0;
            }
            ItemZInit(&dmon->held_item);
            if (dmon->curse_class_status.curse == 3) {
                EndCurseClassStatus(attacker, defender, 3, 1);
            } else if (dmon->curse_class_status.curse == 2) {
                EndCurseClassStatus(attacker, defender, 2, 1);
            }
            EndLeechSeedStatusForAllTargets(defender);
            SubInitMonster(dmon, 0);
            ov10_022BDC68();
            RestorePpAllMovesSetFlags(defender);
            ov29_02304830(defender, GetIdleAnimationId(defender));
            UpdateStatusIconFlags(defender);
            SubstitutePlaceholderStringTags(0, defender, 0);
            SubstitutePlaceholderStringTags(1, other, 0);
            LogMessageByIdWithPopup(attacker, MESSAGE_C4D);
            ov29_0230D628(defender);
            return FALSE;
        }
    }

    if (IqSkillIsEnabled(defender, IQ_ITEM_MASTER)) {
        reviver_seed = NULL;
        revival_item = NULL;
        if (GetFlag(dmon->held_item.flags, 1)
            && !AbilityIsActiveVeneer(defender, ABILITY_KLUTZ)
            && !GetFlag(dmon->held_item.flags, 8)) {
            if (dmon->held_item.id == 0x49) {
                reviver_seed = &dmon->held_item;
            } else if (dmon->held_item.id == 0x69) {
                revival_item = &dmon->held_item;
            }
        }

        if (reviver_seed == NULL && !dmon->is_not_team_member) {
            for (j = 0; j < 0x32; j++) {
                bag_item = &BAG_ITEMS_PTR_MIRROR->bag_items->bag_items[j];
                if (GetFlag(bag_item->flags, 1) && !GetFlag(bag_item->flags, 8)
                    && bag_item->held_by == 0) {
                    if (bag_item->id == 0x49) {
                        reviver_seed = bag_item;
                        break;
                    }
                    if (revival_item == NULL && bag_item->id == 0x69) {
                        revival_item = bag_item;
                    }
                }
            }
        }

        if (reviver_seed != NULL) {
#ifdef EUROPE
            if (defer_defeat_message) {
                LogMessageByIdWithPopup(attacker, ov29_02353E44[defeat_idx]);
            }
#endif
#ifndef JAPAN
            ov29_022FBD24(defender);
#endif
            ov29_022E550C(defender);
            ov29_0230D688(reviver_seed);
            defender->transparent = 0;
            hp = dmon->max_hp_stat + dmon->max_hp_boost;
            if (hp > 0x3E7) {
                hp = 0x3E7;
            }
            dmon->hp = hp;
            dmon->field_0x162 = 0;
            dmon->field_0x156 = TRUE;
            dmon->belly = dmon->max_belly;
            if (dmon->is_team_leader) {
                DUNGEON_PTR->leader_hunger_message_tracker = 0;
                DUNGEON_PTR->identify_orb_flag = 0;
            }
            if (dmon->curse_class_status.curse == 3) {
                EndCurseClassStatus(attacker, defender, 3, 1);
            } else if (dmon->curse_class_status.curse == 2) {
                EndCurseClassStatus(attacker, defender, 2, 1);
            }
#ifdef JAPAN
            ov29_02307DC0(defender);
#endif
            EndLeechSeedStatusForAllTargets(defender);
            SubInitMonster(dmon, 0);
            ov10_022BDC68();
            RestorePpAllMovesSetFlags(defender);
            ov29_02304830(defender, GetIdleAnimationId(defender));
            UpdateStatusIconFlags(defender);
            SubstitutePlaceholderStringTags(1, defender, 0);
            LogMessageByIdWithPopup(attacker, MESSAGE_C4C);
            ov29_0230D628(defender);
            return FALSE;
        }

#ifdef JAPAN
        if (revival_item != NULL) {
#else
        if (!DUNGEON_PTR->end_floor_no_death_check_flag
            && revival_item != NULL) {
#endif
#ifdef EUROPE
            if (defer_defeat_message) {
                LogMessageByIdWithPopup(attacker, ov29_02353E44[defeat_idx]);
            }
#endif
            music = ov29_022EAF20();
            if (dmon->curse_class_status.curse == 2) {
                EndCurseClassStatus(defender, defender,
                                    *(volatile u8 *)&dmon->curse_class_status.curse,
                                    0);
            }
            ov29_02344B9C(0, 0x69);
            ov29_02344B9C(1, 0x49);
            SubstitutePlaceholderStringTags(0, defender, 0);
            ov29_022EFB20(1);
            ov29_022E550C(defender);
            ov29_0230D688(revival_item);
            defender->transparent = 0;
            dmon->unk_revive_visual_tracker = TRUE;
            ov29_02304830(defender, GetIdleAnimationId(defender));
            SubstitutePlaceholderStringTags(1, defender, 0);
            LogMessageByIdWithPopup(attacker, MESSAGE_C4C);
            WaitUntilAlertBoxPauseIsOver(0xA);
            ov29_0234B1A4(0);
            ov29_022F0534(1);
            ov29_022F0780(MESSAGE_C6A);
            ov29_02304830(defender, 0xB);
            TalkToSecretBazaarNpcStandard(MESSAGE_C6B, defender, 0);
            SetUnkMusicFlag(4);
            UnfreezeAnim(defender);
            ov29_02304830(defender, 6);
            ov29_022F0780(MESSAGE_C6C);
            ov29_022F05E4();
            ov29_022EFB84(1);
            defender->transparent = 1;
            dmon->unk_revive_visual_tracker = FALSE;
            LogMessageByIdWithPopup(attacker, MESSAGE_C6D);
            WaitUntilAlertBoxPauseIsOver(0xA);
            ov29_022F0534(0);
            ChangeDungeonMusic(MusicTableIdxToMusicId(
                DUNGEON_PTR->gen_info.music_table_idx));
            SetUnkMusicFlag(music);
            ov29_0230D628(defender);
        }
#ifdef EUROPE
        else if (defer_defeat_message) {
            LogMessageByIdWithPopup(attacker, ov29_02353218[defeat_idx]);
        }
#endif
    }

    if (!dmon->is_team_leader) {
        if (GetFlag(dmon->held_item.flags, 1)) {
            if (dmon->is_not_team_member) {
                if (IsCurrentMissionType(MISSION_TAKE_ITEM_FROM_OUTLAW) && IsMonsterLoneOutlaw(dmon)
                    && (dmon->held_item.flags & 0x40)) {
                    dmon->held_item.flags &= ~0x40;
                    dmon->held_item.flags |= 0x80;
                }
                if (SpawnDroppedItemWrapper(defender, &defender->pos,
                                            &dmon->held_item, 1)
                    && (dmon->held_item.flags & 0x80)) {
                    ov29_0234969C(1);
                }
            } else {
                RemoveHolderForItemInBag(&dmon->held_item);
            }
            ItemZInit(&dmon->held_item);
        } else {
            TrySpawnEnemyItemDrop(attacker, defender);
        }
    }

    gained_exp = FALSE;
    if (dmon->boss_flag) {
        DUNGEON_PTR->field_0x796 = 0x3E7;
    }

    if (attacker->type == 1) {
        amon = attacker->info;
        exp = GetExp((enum monster_id)dmon->id, dmon->level);
        if (!ov29_02303E0C(dmon)) {
            if (dmon->boss_flag) {
                exp = ov10_022C593C[dmon->field_0x168].field_0x0;
            } else {
                if (dmon->exp_yield == 0) {
                    exp = exp / 2;
                } else if (dmon->exp_yield == 2) {
                    exp = (exp * 3) / 2;
                }
                if (exp == 0) {
                    exp = 1;
                }
            }
            if (dmon->grudge) {
                amon->hit_grudge_monster = TRUE;
            }
            if (a5 == 1) {
                if (!amon->is_not_team_member) {
                    if (dmon->is_not_team_member) {
                        AddExpSpecial(attacker, attacker, exp);
                        for (i = 0; i < 4; i++) {
                            other = DUNGEON_PTR->monster_slot_ptrs[i];
                            if (EntityIsValid__02308FBC(other)
                                && other != attacker) {
                                AddExpSpecial(attacker, other, exp);
                            }
                        }
                        gained_exp = TRUE;
                    }
                } else if (CanEnemyEvolve(DUNGEON_PTR->id)) {
                    amon->should_evolve = TRUE;
                    DUNGEON_PTR->should_enemy_evolve = TRUE;
                }
            }
        }
    }

    if (EntityIsValid__02308FBC(attacker) && attacker->type == 1
        && !((struct monster *)attacker->info)->is_team_leader) {
        gained_exp = FALSE;
    }

    if (gained_exp) {
        FillRecruitInfo(recruit_info, defender);
        if (RecruitCheck(attacker, defender)) {
            if (!TryRecruit(attacker, defender, recruit_info)) {
                if (EntityIsValid__02308FBC(defender)) {
                    AftermathCheck(attacker, defender, damage_source);
                    HandleFaint(defender, DAMAGE_SOURCE_NOT_BEFRIENDED,
                                attacker);
                }
            } else {
                ov29_0237CA6C = TRUE;
            }
        } else {
            AftermathCheck(attacker, defender, damage_source);
            HandleFaint(defender, damage_source, attacker);
        }
    } else {
        AftermathCheck(attacker, defender, damage_source);
        ov29_022ECD84(attacker);
        HandleFaint(defender, damage_source, attacker);
    }

    if (!ov29_0237CA6C && is_wild_enemy) {
        ov29_0233847C();
    }

    return TRUE;
}
