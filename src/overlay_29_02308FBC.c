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
#include "dungeon_capabilities_1.h"
#include "dungeon_logic_3.h"
#include "dungeon_logic_4.h"
#include "item.h"
#include "main_02054DC4.h"
#include "move_orb_effects.h"
#include "overlay_29_022E3F20.h"
#include "overlay_29_022E406C.h"
#include "overlay_29_0233836C.h"
#include "dungeon_util_2.h"
#include "overlay_29_02345A3C.h"
#include "overlay_29_02306728.h"
#include "overlay_29_02336F4C.h"
#include "main_0205283C.h"
#include "overlay_29_022E9FC0.h"
#include "overlay_29_0234B340.h"
#include "overlay_29_0234B4BC.h"
#include "overlay_29_022EAC7C.h"
#include "overlay_29_022ECDC0.h"

struct unk_023535DC {
    u8 field_0x0;
    u8 filler1[3];
    s32 field_0x4;
    bool8 (*field_0x8)(struct entity *attacker, struct entity *defender, s32 a);
    u8 filler2[4];
};

struct unk_023528A4 {
    u8 field_0x0;
    s32 field_0x4;
};

struct unk_022C593C {
    s16 field_0x0;
    u8 filler[10];
};

extern const struct StatIndex ATK_STAT_IDX;
extern void ActivateMotorDrive(struct entity* entity);
extern void ApplyDamageAndEffectsWrapper(struct entity *entity, s32 damage, s32 a, s32 b);
extern bool8 CategoryIsNotPhysical(s32 category);
extern bool8 IsEitherMonsterInvalid(struct entity *a, struct entity *b);
extern void ResetDamageData(struct unk_02308FE0 *damage_data);
extern void TryHurl(struct entity *user, struct entity *target);
extern void ov29_022E45D0(struct entity *a, struct entity *b);
extern void ov29_022E57D4(struct entity *entity);
extern void ov29_022E5E84(struct entity *a, struct entity *b);
extern void ov29_0230F728(struct entity *attacker, struct entity *defender, enum exclusive_item_effect_id effect_id, s32 a);
extern s32 ov29_023380FC(struct entity *entity, struct entity **targets);
extern struct unk_023535DC ov29_023535DC[];
extern s16 ARENA_TRAP_ACTIVATION_CHANCE;
extern s16 CUTE_CHARM_INFATUATE_CHANCE;
extern s16 MAGNET_PULL_ACTIVATION_CHANCE;
extern u8 RAPID_SPIN_BINDING_REMOVAL;
extern s16 SHADOW_TAG_ACTIVATION_CHANCE;
extern s16 ov10_022C442C;
extern s16 ov10_022C4464;
extern s16 ov10_022C44C0;
extern s16 ov10_022C4550;
extern s16 ov10_022C45AC;
extern s16 ov10_022C45B0;
extern s16 ov10_022C45B4;
extern s16 ov10_022C45C0;
extern s16 ov10_022C4638;
extern s16 ov10_022C467C;
extern void AddExpSpecial(struct entity* attacker, struct entity* defender, s32 base_exp);
extern void ChangeMonsterAnimation(struct entity *entity, s32 animation_id, s32 direction);
extern void ChangeMonsterAnimationToIdle(struct entity* monster, enum direction_id direction);
extern void DisplayAnimatedNumbers(s32 amount, struct entity *entity, bool8 display_sign, s32 number_color);
extern void EndInvisibleClassStatus(struct entity* user, struct entity* target, bool8 no_slip_message);
extern int EndLeechSeedStatusForAllTargets();
extern bool8 ExclusiveItemEffectIsActiveWithLogging(struct entity* user, struct entity* target, bool8 should_log, s32 message_id, enum exclusive_item_effect_id effect_id);
extern void FillRecruitInfo(void *recruit_info, struct entity *monster);
extern void FreeOtherWrappedMonsters(u32 unique_id);
extern struct team_member* GetActiveTeamMember(s32 roster_idx);
extern s32 GetIdleAnimationId(struct entity *entity);
extern void HandleFaint(struct entity *fainted_entity, s32 damage_source, struct entity *killer);
extern bool8 IsMonsterIdInNormalRangeVeneer(enum monster_id monster_id);
extern void LogMessageByIdWithPopupCheckUser(struct entity *user, u32 message_id);
extern void MoveMonsterToPos(struct entity* entity, s32 x_pos, s32 y_pos, bool8 reset_prev_pos_fields);
extern s32 PlayEffectAnimationEntity(struct entity *entity, s32 id, s32 a, u8 b, s32 c, s32 d, s32 e, s32 f);
extern int PlayMissSfx__022E611C();
extern int PlayMissSfx__022E6150();
extern void RemoveHolderForItemInBag(struct item* item);
extern void RestorePpAllMovesSetFlags(struct entity* entity);
extern void RestoreRandomMovePP(struct entity* user, struct entity* target, s32 pp, bool8 log_message);
extern void SubInitMonster(struct monster* monster, bool8 flag);
extern bool8 TryEndPetrifiedOrSleepStatus(struct entity *user, struct entity *target);
extern void TryIncreaseHp(struct entity *user, struct entity *target, s32 hp, s32 a, bool8 b);
extern bool8 TryRecruit(struct entity *user, struct entity *recruit, void *recruit_info);
extern void TrySpawnEnemyItemDrop(struct entity* attacker, struct entity* defender);
extern void UnfreezeAnim(struct entity *e);
extern void UpdateShopkeeperModeAfterAttack(struct entity* attacker, struct entity* defender);
extern s32 abs(s32 n);
extern int ov10_022BDC68();
extern int TerminateEffectWrapper();
extern int ov10_022BF964();
extern int ov29_022E5478();
extern int ov29_022E550C();
extern void ov29_022E81F8(void);
extern void ov29_022EA370(s32 a, s32 b);
extern int ov29_022EFB84();
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

#ifdef JAPAN
#define MESSAGE_C3F 0x97E
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
#define MESSAGE_C3F 0xC3F
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

int ApplyDamageAndEffects(struct entity *attacker, struct entity *defender,
                          struct unk_02308FE0 *damage_data, int a4, int a5,
                          s16 a6, int a7, int a8)
{
    struct unk_02308FE0 unk1;
    struct entity *arr[8];
    struct monster *mon1;
    s32 result;
    s32 i;
    s32 k;
    s32 n;
    s32 v1;
    s32 v2;
    bool8 f1;

    if ((result = ApplyDamage(attacker, defender, damage_data, a4, a5, a6, a8)) != 0
        || (result = damage_data->field_0x10) != 0) {
        return result;
    }
    if ((result = EntityIsValid__02308FBC(attacker)) == 0) {
        return result;
    }
    if ((result = EntityIsValid__02308FBC(defender)) == 0) {
        return result;
    }
    if ((result = attacker->type) != ENTITY_MONSTER
        || (result = defender->type) != ENTITY_MONSTER) {
        return result;
    }

    if (((struct monster *)defender->info)->bide_class_status.bide == STATUS_TWO_TURN_ENRAGED) {
        BoostOffensiveStat(attacker, defender, ATK_STAT_IDX, 1);
    }

    if ((result = a7) == 0) {
        return result;
    }

    if (ov29_02300D50(defender)
        || ((struct monster *)defender->info)->bide_class_status.bide != STATUS_TWO_TURN_NONE) {
        result = FALSE;
    } else if (IqSkillIsEnabled(attacker, IQ_HIT_AND_RUNNER)
               && DungeonRandInt(100) < ov10_022C442C) {
        result = FALSE;
    } else {
        if (CategoryIsNotPhysical(damage_data->field_0xd) || attacker == defender
            || abs(attacker->pos.x - defender->pos.x) > 1
            || abs(attacker->pos.y - defender->pos.y) > 1) {
            result = FALSE;
        } else {
            if (((struct monster *)defender->info)->reflect_class_status.reflect
                == STATUS_REFLECT_VITAL_THROW) {
                ov29_022E5E84(defender, attacker);
                TryHurl(defender, attacker);
            }
            result = IsEitherMonsterInvalid(attacker, defender);
        }
        if (result) {
            result = TRUE;
        } else {

            v2 = CategoryIsNotPhysical(damage_data->field_0xd);
            v1 = 0;

            if (attacker == defender
                || abs(attacker->pos.x - defender->pos.x) > 1
                || abs(attacker->pos.y - defender->pos.y) > 1) {
                result = FALSE;
            } else {
                ResetDamageData(&unk1);
                mon1 = defender->info;

                if (!v2) {
                    if (mon1->reflect_class_status.reflect == STATUS_REFLECT_COUNTER) {
                        ov29_022E3F24(defender);
                        v1 += 4;
                    }
                    if (((struct monster *)defender->info)->reflect_class_status.reflect
                        == STATUS_REFLECT_MINI_COUNTER) {
                        ov29_022E3F24(defender);
                        v1 += 1;
                    }
                    if (ExclusiveItemEffectIsActive__0230A9B8(defender, EXCLUSIVE_EFF_COUNTER_PHYSICAL_DAMAGE)) {
                        v1 += 4;
                    }
                    if (ExclusiveItemEffectIsActive__0230A9B8(defender, EXCLUSIVE_EFF_COUNTER_25_PCT_PHYSICAL_DAMAGE)) {
                        v1 += 1;
                    }
                    if (IqSkillIsEnabled(defender, IQ_COUNTER_BASHER)
                        && ov10_022C44C0 > (s16)DungeonRandInt(100)) {
                        v1 += 4;
                    }
                    if (IqSkillIsEnabled(defender, IQ_COUNTER_HITTER)
                        && ov10_022C4464 > (s16)DungeonRandInt(100)) {
                        v1 += 1;
                    }
                } else if (mon1->reflect_class_status.reflect == STATUS_REFLECT_MIRROR_COAT) {
                    ov29_022E40C0(defender);
                    v1 += 4;
                }

                if (((struct monster *)defender->info)->reflect_class_status.reflect
                    == STATUS_REFLECT_METAL_BURST) {
                    ov29_022E57D4(defender);
                    v1 += 2;
                }

#ifdef JAPAN
                if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_ROUGH_SKIN)) {
#else
                if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_ROUGH_SKIN, TRUE)) {
#endif

                    v1 += 2;
                }

                if (v1 != 0) {
                    LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C3F);
                    unk1.field_0x0 = damage_data->field_0x0 * v1 / 4;
                    unk1.field_0xc = damage_data->field_0xc;
                    unk1.field_0x4 = 6;
                    unk1.field_0x8 = MATCHUP_NEUTRAL;
                    unk1.field_0xd = damage_data->field_0xd;
                    unk1.field_0xe = FALSE;
                    unk1.field_0xf = FALSE;
                    unk1.field_0x10 = FALSE;

                    if (((struct monster *)defender->info)->reflect_class_status.reflect
                        == STATUS_REFLECT_METAL_BURST) {
                        unk1.field_0xd = 1;
                        n = ov29_023380FC(defender, arr);
                        for (k = 0; k < n; k = (s16)(k + 1)) {
                            ApplyDamage(defender, arr[k], &unk1, 0, a5, (s16)a6, a8);
                        }
                    } else {
                        ApplyDamage(defender, attacker, &unk1, 0, a5, (s16)a6, a8);
                    }
                }

                result = IsEitherMonsterInvalid(attacker, defender);
            }
            if (result) {
                result = TRUE;
            } else {

                if (attacker == defender
                    || abs(attacker->pos.x - defender->pos.x) > 1
                    || abs(attacker->pos.y - defender->pos.y) > 1) {
                    result = FALSE;
                } else {
                    s32 v3 = CategoryIsNotPhysical(damage_data->field_0xd);
                    struct unk_023535DC *ptr1;
                    struct monster *mon2 = attacker->info;

                    if (ExclusiveItemEffectIsActive__0230A9B8(defender, EXCLUSIVE_EFF_MAY_POISON_PARALYZE_SLEEP_ATTACKERS) && !v3
                        && DungeonRandInt(100) < ov10_022C45B4) {
                        i = DungeonRandInt(300);
                        if (i < 100) {
                            ov29_0230F728(attacker, defender, EXCLUSIVE_EFF_MAY_POISON_PARALYZE_SLEEP_ATTACKERS, 0x40);
                        } else if (i < 200) {
                            ov29_0230F728(attacker, defender, EXCLUSIVE_EFF_MAY_POISON_PARALYZE_SLEEP_ATTACKERS, 0x10);
                        } else {
                            ov29_0230F728(attacker, defender, EXCLUSIVE_EFF_MAY_POISON_PARALYZE_SLEEP_ATTACKERS, 0x80);
                        }
                    }

                    for (ptr1 = ov29_023535DC; *(u8 *)ptr1 != 0; ptr1++) {
                        if (ExclusiveItemEffectIsActive__0230A9B8(defender, (enum exclusive_item_effect_id)ptr1->field_0x0)
                            && ptr1->field_0x8(attacker, defender, v3)) {
                            ov29_0230F728(attacker, defender, (enum exclusive_item_effect_id)ptr1->field_0x0, ptr1->field_0x4);
                        }
                    }

                    if (ExclusiveItemEffectIsActive__0230A9B8(defender, EXCLUSIVE_EFF_MAY_WARP_WHEN_ATTACKED)
                        && DungeonRandInt(100) < ov10_022C45B0 && HasLowHealth(defender)) {
                        ov29_0230F728(attacker, defender, EXCLUSIVE_EFF_MAY_WARP_WHEN_ATTACKED, 0x40000);
                    }

#ifdef JAPAN
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_ARENA_TRAP)) {
#else
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_ARENA_TRAP, TRUE)) {
#endif

                        f1 = FALSE;
                        if (mon2->magnet_rise == 1
                            || HasTypeAffectedByGravity(attacker, TYPE_FLYING)
                            || LevitateIsActive(attacker)) {
                            if (!GravityIsActive()) {
                                f1 = TRUE;
                            }
                        }
                        if (!f1 && DungeonRandInt(100) < ARENA_TRAP_ACTIVATION_CHANCE) {
                            mon2->contact_ability_trigger_bitflags |= 1;
                        }
                    }

#ifdef JAPAN
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_SHADOW_TAG)
#else
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_SHADOW_TAG, TRUE)
#endif
                        && DungeonRandInt(100) < SHADOW_TAG_ACTIVATION_CHANCE) {
                        mon2->contact_ability_trigger_bitflags |= 2;
                        RAPID_SPIN_BINDING_REMOVAL = 0;
                    }

#ifdef JAPAN
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_MAGNET_PULL)
#else
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_MAGNET_PULL, TRUE)
#endif
                        && MonsterIsType(attacker, TYPE_STEEL)
                        && DungeonRandInt(100) < MAGNET_PULL_ACTIVATION_CHANCE) {
                        mon2->contact_ability_trigger_bitflags |= 4;
                    }

#ifdef JAPAN
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_STATIC)
#else
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_STATIC, TRUE)
#endif
                        && !v3 && DungeonRandInt(100) < ov10_022C4550) {
                        mon2->contact_ability_trigger_bitflags |= 8;
                    }

#ifdef JAPAN
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_POISON_POINT)
#else
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_POISON_POINT, TRUE)
#endif
                        && DungeonRandInt(100) < ov10_022C45C0) {
                        mon2->contact_ability_trigger_bitflags |= 0x20;
                    }

#ifdef JAPAN
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_EFFECT_SPORE)
#else
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_EFFECT_SPORE, TRUE)
#endif
                        && !v3 && DungeonRandInt(100) < ov10_022C45AC) {
                        i = DungeonRandInt(3);
                        if (i < 1) {
                            mon2->contact_ability_trigger_bitflags |= 0x40;
                        } else if (i < 2) {
                            mon2->contact_ability_trigger_bitflags |= 0x10;
                        } else {
                            mon2->contact_ability_trigger_bitflags |= 0x80;
                        }
                    }

#ifdef JAPAN
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_FLAME_BODY)
#else
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_FLAME_BODY, TRUE)
#endif
                        && DungeonRandInt(100) < ov10_022C467C) {
                        mon2->contact_ability_trigger_bitflags |= 0x100;
                    }

#ifdef JAPAN
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_CUTE_CHARM)
#else
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_CUTE_CHARM, TRUE)
#endif
                        && GendersNotEqualNotGenderless(
                               mon2->id, ((struct monster *)defender->info)->id)
                        && !v3 && DungeonRandInt(100) < CUTE_CHARM_INFATUATE_CHANCE) {
                        mon2->contact_ability_trigger_bitflags |= 0x200;
                    }

#ifdef JAPAN
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_STENCH)
#else
                    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_STENCH, TRUE)
#endif
                        && DungeonRandInt(100) < ov10_022C4638) {
                        mon2->contact_ability_trigger_bitflags |= 0x400;
                    }

                    result = IsEitherMonsterInvalid(attacker, defender);
                }
                if (result) {
                    result = TRUE;
                } else {

                    mon1 = defender->info;
                    if (mon1->leech_seed_class_status.leech_seed == STATUS_LEECH_SEED_DESTINY_BOND) {
                        struct entity *ent1 =
                            DUNGEON_PTR->active_monster_ptrs[mon1->leech_seed_class_status
                                                                 .leech_seed_source_monster_index];

                        if (ent1 == NULL) {
                            mon1->leech_seed_class_status.leech_seed = STATUS_LEECH_SEED_NONE;
                        } else if (mon1->leech_seed_class_status.statuses_applier_id
                                   != ((struct monster *)ent1->info)->unique_id) {
                            mon1->leech_seed_class_status.leech_seed = STATUS_LEECH_SEED_NONE;
                        } else {
                            ov29_022E45D0(ent1, defender);
                            ApplyDamageAndEffectsWrapper(ent1, damage_data->field_0x0,
                                                         0xC, DAMAGE_SOURCE_DESTINY_BOND);
                        }
                    }

                    result = IsEitherMonsterInvalid(attacker, defender) != 0;
                }
            }
        }
    }
    if (result) {
        return result;
    }
    return (u32)result;
}

bool8 EntityIsValid__02308FBC(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

extern void ov29_02307DC0(struct entity *entity);
#ifdef EUROPE
extern u16 ov29_02353E44[];
#endif

bool8 ApplyDamage(struct entity *attacker, struct entity *defender,
                  struct unk_02308FE0 *damage_data, int a4, int a5,
                  s16 damage_source, int a7)
{
    bool8 f1 = FALSE;
    struct unk_023528A4 *ptr1;
    struct tile *tile = NULL;
    struct team_member *member;
    bool8 f2;
    bool8 f3 = FALSE;
    bool8 f4;
    bool8 f5;
    s32 v1;
    s32 v2;
    struct monster *mon1;
    s32 v3;
    s32 v4;
    struct monster *mon2;
    u8 v5;
    s32 i;
    struct entity *ent1;
    s32 j;
    struct item *item4;
    s16 v6;
    struct position pos;
    u8 buf[0x48];
#ifdef EUROPE
    bool8 f6;
#endif

    damage_data->field_0x10 = FALSE;

    if (defender->type != 1
        || IsSecretBazaarNpcBehavior(
               ((struct monster *)defender->info)->monster_behavior)) {
        damage_data->field_0x10 = TRUE;
        return FALSE;
    }

    if (((struct monster *)defender->info)->is_not_team_member
        && !((struct monster *)defender->info)->is_ally) {
        f3 = TRUE;
    }
    mon1 = defender->info;

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

    if (mon1->frozen_class_status.freeze == 1) {
        if (damage_source != 0x250) {
            SubstitutePlaceholderStringTags(1, defender, 0);
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C41);
            PlayMissSfx__022E611C(attacker, defender);
        }
        damage_data->field_0x10 = TRUE;
        return FALSE;
    }

    if ((mon1->sleep_class_status.sleep == 1 || mon1->sleep_class_status.sleep == 5
         || mon1->sleep_class_status.sleep == 3)
        && mon1->sleep_class_status.sleep_turns == 0x7F) {
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
        } else
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
        } else
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
        } else
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

    ptr1 = TYPE_DAMAGE_NEGATING_EXCLUSIVE_ITEM_EFFECTS;
    while (ptr1->field_0x0 != 0x12) {
        if (ptr1->field_0x0 == damage_data->field_0xc
            && ExclusiveItemEffectIsActiveWithLogging(attacker, defender, 0, 0,
                                                     (enum exclusive_item_effect_id)(ptr1->field_0x4 & 0xFF))) {
            if (ptr1->field_0x4 > 0x71) {
                TryIncreaseHp(attacker, defender, damage_data->field_0x0, 0, 1);
            } else {
                damage_data->field_0x10 = TRUE;
            }
            f2 = FALSE;
            goto negation_checked;
        }
        ptr1++;
    }
    f2 = TRUE;
negation_checked:

    if (!f2) {
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

    if (!mon1->apply_flash_fire_boost) {
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
            if (!mon1->apply_flash_fire_boost) {
                LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C47);
            }
            PlayMissSfx__022E611C(attacker, defender);
        } else {
            if (!mon1->apply_flash_fire_boost) {
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
            v6 = PlayEffectAnimationEntity(defender, 0x2B5, 0, 3, 0, 1, 0, 0);
            ov29_023535D4 = -1;
            if (v6 != -1) {
                while (ov10_022BF964(v6)) {
                    AdvanceFrame(0x18);
                }
                TerminateEffectWrapper(v6);
                ov29_023535D4 =
                    PlayEffectAnimationEntity(defender, 0x2B6, 0, 3, 0, 1, 0, 0);
            }
        }
        if (!mon1->apply_flash_fire_boost) {
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C48);
        }
        mon1->bide_damage_tally = 0x3E7;
    } else {
        u16 v7;

        SetMessageLogPreprocessorArgsNumberVal(0, damage_data->field_0x0);

        if (damage_data->field_0x4 >= 0x1B) {
            v7 = 0;
        } else {
            v7 = DAMAGE_STRING_IDS[damage_data->field_0x4];
        }

        mon1->bide_damage_tally += damage_data->field_0x0;
        if (mon1->bide_damage_tally > 0x3E7) {
            mon1->bide_damage_tally = 0x3E7;
        }

        if (ShouldDisplayEntityWrapper(defender)) {
            if (damage_data->field_0x4 != 0xE
                && damage_data->field_0x4 != 0x17
                && damage_source != 0x25F) {
                DisplayAnimatedNumbers(-damage_data->field_0x0, defender, TRUE,
                                       -1);
            }
            if (!mon1->apply_flash_fire_boost && v7 != 0) {
                LogMessageByIdWithPopupCheckUserTarget(attacker, defender,
                                                      v7);
            }
        } else if (!mon1->apply_flash_fire_boost && v7 != 0) {
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, v7);
        }
    }

    if ((damage_data->field_0x4 != 0xE || mon1->hp <= 1) && tile == NULL
        && ShouldDisplayEntityWrapper(defender)) {
        if ((attacker->pos.x != defender->pos.x
             || attacker->pos.y != defender->pos.y)
            && attacker->type == 1) {
            f4 = FALSE;
            if (mon1->is_team_leader) {
                if (GetDamageTurnOption() && !ov29_022F9AF4(defender)) {
                    if (CanSeeTarget(defender, attacker)) {
                        f4 = TRUE;
                    } else {
                        f4 = FALSE;
                    }
                }
            } else {
                f4 = FALSE;
            }
            if (mon1->blinker_class_status.blinded == 2
                || IsBlinded(defender, TRUE)) {
                f4 = FALSE;
            }
            if (f4) {
                struct monster *mon3 = defender->info;

                mon3->action.direction =
                    GetDirectionTowardsPosition(&defender->pos, &attacker->pos) & 7;
            }
            UpdateAiTargetPos(defender);
        }
        if (damage_source != 0x25F) {
            ChangeMonsterAnimation(defender, 6,
                                   ((struct monster *)defender->info)->action.direction);
            ov29_022E5478(defender, damage_data);
            f1 = TRUE;
        }
    }

    if (mon1->is_not_team_member && damage_data->field_0x0 > 0
        && attacker->type == 1
        && !((struct monster *)attacker->info)->is_not_team_member) {
        SetMonsterFlag2(mon1->id);
        SetPokemonBattled(mon1->id);
    }

    v2 = mon1->hp;
    if (mon1->hp > damage_data->field_0x0) {
        mon1->hp -= damage_data->field_0x0;
    } else {
        mon1->hp = 0;
    }

    if (mon1->reflect_class_status.reflect == 9) {
        if (mon1->hp == 0) {
            mon1->hp = 1;
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C49);
        }
    } else if (a4 == 1) {
        if (mon1->hp == 0) {
            mon1->hp = 1;
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C4A);
        }
    } else if (ExclusiveItemEffectIsActive__0230A9B8(defender, EXCLUSIVE_EFF_MAY_ENDURE)
               && DungeonRandOutcome__022EAB20(ov10_022C4834)
               && mon1->hp == 0) {
        mon1->hp = 1;
        LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C49);
    }

    ov29_022E81F8();

    v2 -= mon1->hp;
    if (v2 < 0) {
        v2 = 0;
    }

    if (f1 || tile != NULL) {
        ov29_022EA370(0xA, 0x18);
    }

#ifndef JAPAN
    UpdateStatusIconFlags(defender);
#endif

    if (mon1->hp != 0) {
        if (f1) {
            ChangeMonsterAnimationToIdle(defender, DIR_CURRENT);
        }
        if (damage_data->field_0x4 != 0xE) {
            if (ItemIsActive__0230A9DC(defender, ITEM_JOY_RIBBON) && v2 > 0
                && damage_data->field_0x0 != 0x270F) {
                AddExpSpecial(attacker, defender, ov10_022C45FC);
            }
            if (ExclusiveItemEffectIsActive__0230A9B8(defender, EXCLUSIVE_EFF_EXP_FROM_DAMAGE)
                && v2 > 0 && damage_data->field_0x0 != 0x270F) {
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
        f1 = TRUE;
    }

    if (mon1->invisible_class_status.status == 2) {
        EndInvisibleClassStatus(attacker, defender, 0);
    }

    if (tile != NULL) {
        ov29_022EA370(0x14, 0x18);
        defender->transparent = 2;
        ov29_0230D7D4(defender);
        UpdateTrapsVisibility();
    } else if (f1) {
        defender->transparent = 1;
        ov29_022EA370(0x1E, 0x18);
    }

    v1 = 1;
    if (EntityIsValid__02308FBC(attacker) && attacker->type == 1
        && attacker != defender) {
        v1 = 0;
    }

    mon1->field_0x156 = 0;
    SubstitutePlaceholderStringTags(0, attacker, 0);
    SubstitutePlaceholderStringTags(1, defender, 0);

#ifdef EUROPE
    f6 = FALSE;
#endif

    if (damage_data->field_0x4 == 0x13 || damage_data->field_0x4 == 4
        || damage_data->field_0x4 == 0x14) {
        if (mon1->is_not_team_member) {
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C4B);
        } else {
            LogMessageByIdWithPopup(attacker, MESSAGE_C4B);
        }
    } else if (mon1->is_not_team_member) {
        if (mon1->monster_behavior == 7) {
            LogMessageByIdWithPopup(attacker, ov29_02353220[v1]);
        } else {
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender,
                                                  DEFEAT_STRING_IDS[v1]);
        }
    } else {
        member = GetActiveTeamMember(mon1->team_index);
        if (mon1->is_team_leader
            || (JoinedAtRangeCheck2Veneer(mon1->joined_at)
                && !DUNGEON_PTR->nonstory_flag)) {
            LogMessageByIdWithPopup(attacker, ov29_02353228[v1]);
        } else if (IsExperienceLocked(mon1)) {
            if (IsSpecialStoryAlly(mon1)) {
                LogMessageByIdWithPopup(attacker, ov29_02353234[v1]);
            } else {
                LogMessageByIdWithPopup(attacker, ov29_0235322C[v1]);
            }
        } else if (mon1->monster_behavior == 7) {
            LogMessageByIdWithPopup(attacker, ov29_02353220[v1]);
        } else if (IsMonsterIdInNormalRangeVeneer((enum monster_id)member->member_index)) {
            if (DUNGEON_PTR->send_home_disabled) {
                LogMessageByIdWithPopup(attacker, ov29_02353224[v1]);
            } else {
                LogMessageByIdWithPopup(attacker, ov29_02353230[v1]);
            }
        } else {
#ifdef EUROPE
            f6 = TRUE;
#else
            LogMessageByIdWithPopup(attacker, ov29_02353218[v1]);
#endif
        }
    }

    if (mon1->frozen_class_status.freeze == 3
        || mon1->frozen_class_status.freeze == 4) {
        FreeOtherWrappedMonsters(mon1->wrap_pair_unique_id);
    }

    item4 = &mon1->held_item;
    if (GetFlag(item4->flags, 1))
    if (!GetFlag(item4->flags, 8)
        && !(mon1->held_item.flags & 2)
        && (u32)item4->id == 0x153) {
        ov29_022E550C(defender);
        defender->transparent = 0;
        v3 = mon1->max_hp_stat + mon1->max_hp_boost;
        if (v3 > 0x3E7) {
            v3 = 0x3E7;
        }
        mon1->hp = v3;
        mon1->field_0x162 = 0;
        mon1->field_0x156 = TRUE;
        mon1->belly = mon1->max_belly;
        if (mon1->is_team_leader) {
            DUNGEON_PTR->leader_hunger_message_tracker = 0;
            DUNGEON_PTR->identify_orb_flag = 0;
        }
        ItemZInit(&mon1->held_item);
        if (mon1->curse_class_status.curse == 3) {
            EndCurseClassStatus(attacker, defender, 3, 1);
        } else if (mon1->curse_class_status.curse == 2) {
            EndCurseClassStatus(attacker, defender, 2, 1);
        }
        EndLeechSeedStatusForAllTargets(defender);
        SubInitMonster(mon1, 0);
        ov10_022BDC68();
        RestorePpAllMovesSetFlags(defender);
        ov29_02304830(defender, GetIdleAnimationId(defender));
        UpdateStatusIconFlags(defender);
        SubstitutePlaceholderStringTags(1, defender, 0);
        LogMessageByIdWithPopup(attacker, MESSAGE_C4C);
        ov29_0230D628(defender);
        return FALSE;
    }

    if (mon1->is_team_leader
        && GetFlag(mon1->held_item.flags, 1)
        && !GetFlag(mon1->held_item.flags, 8)
        && (u32)mon1->held_item.id == 0x159) {
        ent1 = NULL;
        for (i = 0; i < 4; i++) {
            ent1 = DUNGEON_PTR->monster_slot_ptrs[i];
            if (EntityIsValid__02308FBC(ent1) && ent1 != defender
                && CanSeeTarget(defender, ent1)
                && abs(ent1->pos.x - defender->pos.x) <= 1
                && abs(ent1->pos.y - defender->pos.y) <= 1) {
                break;
            }
        }
        if (i != 4) {
            ov29_022E550C(defender);
            SubstitutePlaceholderStringTags(0, defender, 0);
            pos = ent1->pos;
            HandleFaint(ent1, DAMAGE_SOURCE_POSSESS, defender);
            MoveMonsterToPos(defender, pos.x, pos.y, 1);
            UpdateEntityPixelPos(defender, 0);
            defender->transparent = 0;
            v3 = mon1->max_hp_stat + mon1->max_hp_boost;
            if (v3 > 0x3E7) {
                v3 = 0x3E7;
            }
            mon1->hp = v3;
            ov29_022E66D8(defender);
            mon1->field_0x162 = 0;
            mon1->field_0x156 = TRUE;
            mon1->belly = mon1->max_belly;
            if (mon1->is_team_leader) {
                DUNGEON_PTR->leader_hunger_message_tracker = 0;
                DUNGEON_PTR->identify_orb_flag = 0;
            }
            ItemZInit(&mon1->held_item);
            if (mon1->curse_class_status.curse == 3) {
                EndCurseClassStatus(attacker, defender, 3, 1);
            } else if (mon1->curse_class_status.curse == 2) {
                EndCurseClassStatus(attacker, defender, 2, 1);
            }
            EndLeechSeedStatusForAllTargets(defender);
            SubInitMonster(mon1, 0);
            ov10_022BDC68();
            RestorePpAllMovesSetFlags(defender);
            ov29_02304830(defender, GetIdleAnimationId(defender));
            UpdateStatusIconFlags(defender);
            SubstitutePlaceholderStringTags(0, defender, 0);
            SubstitutePlaceholderStringTags(1, ent1, 0);
            LogMessageByIdWithPopup(attacker, MESSAGE_C4D);
            ov29_0230D628(defender);
            return FALSE;
        }
    }

    if (IqSkillIsEnabled(defender, IQ_ITEM_MASTER)) {
        struct item *item1 = NULL;
        struct item *item2 = NULL;
        struct item *item3;

        if (GetFlag(mon1->held_item.flags, 1)
            && !AbilityIsActiveVeneer(defender, ABILITY_KLUTZ)
            && !GetFlag(mon1->held_item.flags, 8)) {
            if ((u32)mon1->held_item.id == 0x49) {
                item1 = &mon1->held_item;
            } else if ((u32)mon1->held_item.id == 0x69) {
                item2 = &mon1->held_item;
            }
        }

        if (item1 == NULL && !mon1->is_not_team_member) {
            for (j = 0; j < 0x32; j++) {
                item3 = &BAG_ITEMS_PTR_MIRROR->bag_items->bag_items[j];
                if (!GetFlag(item3->flags, 1)) {
                    continue;
                }
                if (GetFlag(item3->flags, 8)) {
                    continue;
                }
                if (item3->held_by != 0) {
                    continue;
                }
                if ((u32)item3->id == 0x49) {
                    item1 = item3;
                    break;
                }
                if (item2 == NULL && (u32)item3->id == 0x69) {
                    item2 = item3;
                }
            }
        }

        if (item1 != NULL) {
#ifdef EUROPE
            if (f6) {
                LogMessageByIdWithPopup(attacker, ov29_02353E44[v1]);
            }
#endif
#ifndef JAPAN
            ov29_022FBD24(defender);
#endif
            ov29_022E550C(defender);
            ov29_0230D688(item1);
            defender->transparent = 0;
            v3 = mon1->max_hp_stat + mon1->max_hp_boost;
            if (v3 > 0x3E7) {
                v3 = 0x3E7;
            }
            mon1->hp = v3;
            mon1->field_0x162 = 0;
            mon1->field_0x156 = TRUE;
            mon1->belly = mon1->max_belly;
            if (mon1->is_team_leader) {
                DUNGEON_PTR->leader_hunger_message_tracker = 0;
                DUNGEON_PTR->identify_orb_flag = 0;
            }
            if (mon1->curse_class_status.curse == 3) {
                EndCurseClassStatus(attacker, defender, 3, 1);
            } else if (mon1->curse_class_status.curse == 2) {
                EndCurseClassStatus(attacker, defender, 2, 1);
            }
#ifdef JAPAN
            ov29_02307DC0(defender);
#endif
            EndLeechSeedStatusForAllTargets(defender);
            SubInitMonster(mon1, 0);
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
        if (item2 != NULL) {
#else
        if (!DUNGEON_PTR->end_floor_no_death_check_flag
            && item2 != NULL) {
#endif
#ifdef EUROPE
            if (f6) {
                LogMessageByIdWithPopup(attacker, ov29_02353E44[v1]);
            }
#endif
            v5 = ov29_022EAF20();
            if (mon1->curse_class_status.curse == 2) {
                EndCurseClassStatus(defender, defender,
                                    *(volatile u8 *)&mon1->curse_class_status.curse,
                                    0);
            }
            ov29_02344B9C(0, 0x69);
            ov29_02344B9C(1, 0x49);
            SubstitutePlaceholderStringTags(0, defender, 0);
            ov29_022EFB20(1);
            ov29_022E550C(defender);
            ov29_0230D688(item2);
            defender->transparent = 0;
            mon1->unk_revive_visual_tracker = TRUE;
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
            mon1->unk_revive_visual_tracker = FALSE;
            LogMessageByIdWithPopup(attacker, MESSAGE_C6D);
            WaitUntilAlertBoxPauseIsOver(0xA);
            ov29_022F0534(0);
            ChangeDungeonMusic(MusicTableIdxToMusicId(
                DUNGEON_PTR->gen_info.music_table_idx));
            SetUnkMusicFlag(v5);
            ov29_0230D628(defender);
        }
#ifdef EUROPE
        else if (f6) {
            LogMessageByIdWithPopup(attacker, ov29_02353218[v1]);
        }
#endif
    }

    if (!mon1->is_team_leader) {
        if (GetFlag(mon1->held_item.flags, 1)) {
            if (mon1->is_not_team_member) {
                if (IsCurrentMissionType(MISSION_TAKE_ITEM_FROM_OUTLAW) && IsMonsterLoneOutlaw(mon1)
                    && (mon1->held_item.flags & 0x40)) {
                    mon1->held_item.flags &= ~0x40;
                    mon1->held_item.flags |= 0x80;
                }
                if (SpawnDroppedItemWrapper(defender, &defender->pos,
                                            &mon1->held_item, 1)
                    && (mon1->held_item.flags & 0x80)) {
                    ov29_0234969C(1);
                }
            } else {
                RemoveHolderForItemInBag(&mon1->held_item);
            }
            ItemZInit(&mon1->held_item);
        } else {
            TrySpawnEnemyItemDrop(attacker, defender);
        }
    }

    f5 = FALSE;
    if (mon1->boss_flag) {
        DUNGEON_PTR->field_0x796 = 0x3E7;
    }

    if (attacker->type == 1) {
        mon2 = attacker->info;
        v4 = GetExp((enum monster_id)mon1->id, mon1->level);
        if (!ov29_02303E0C(mon1)) {
            if (mon1->boss_flag) {
                v4 = ov10_022C593C[mon1->field_0x168].field_0x0;
            } else {
                if (mon1->exp_yield == 0) {
                    v4 /= 2;
                } else if (mon1->exp_yield == 2) {
                    v4 *= 3;
                    v4 /= 2;
                }
                if (v4 == 0) {
                    v4 = 1;
                }
            }
            if (mon1->grudge) {
                mon2->hit_grudge_monster = TRUE;
            }
            if (a5 == 1) {
                if (!mon2->is_not_team_member) {
                    if (mon1->is_not_team_member) {
                        AddExpSpecial(attacker, attacker, v4);
                        for (i = 0; i < 4; i++) {
                            ent1 = DUNGEON_PTR->monster_slot_ptrs[i];
                            if (EntityIsValid__02308FBC(ent1)
                                && ent1 != attacker) {
                                AddExpSpecial(attacker, ent1, v4);
                            }
                        }
                        f5 = TRUE;
                    }
                } else if (CanEnemyEvolve(DUNGEON_PTR->id)) {
                    mon2->should_evolve = TRUE;
                    DUNGEON_PTR->should_enemy_evolve = TRUE;
                }
            }
        }
    }

    if (EntityIsValid__02308FBC(attacker) && attacker->type == 1
        && !((struct monster *)attacker->info)->is_team_leader) {
        f5 = FALSE;
    }

    if (f5) {
        FillRecruitInfo(buf, defender);
        if (RecruitCheck(attacker, defender)) {
            if (!TryRecruit(attacker, defender, buf)) {
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

    if (!ov29_0237CA6C && f3) {
        ov29_0233847C();
    }

    return TRUE;
}
