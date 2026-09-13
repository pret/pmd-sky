#include "overlay_29_0230BBAC.h"
#include "debug.h"
#include "dg_random.h"
#include "dungeon.h"
#include "dungeon_logic.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util_static.h"
#include "enums.h"
#include "item.h"
#include "main_02001894.h"
#include "main_02001A54.h"
#include "main_02001BB4.h"
#include "main_02001CD4.h"
#include "main_02014CEC.h"
#include "main_0201514C.h"
#include "main_02054DC4.h"
#include "move_orb_effects.h"
#include "number_util.h"
#include "overlay_29_022E3F20.h"
#include "overlay_29_022E406C.h"
#include "overlay_29_0230A994.h"
#include "overlay_29_0230A9DC.h"
#include "run_dungeon_1.h"
#include "type_effectiveness.h"
#include "weather.h"
#include "dungeon_util_2.h"
#include "overlay_29_02338350.h"
#include "overlay_29_0234B340.h"
#include "main_0200224C.h"
#include "overlay_29_0231E9F0.h"

extern struct dungeon *DUNGEON_PTR;
extern u8 GetMonsterGenderVeneer(s16 monster_id);
extern u8 ExclusiveItemOffenseBoost(struct entity *entity, s32 idx);
extern u8 ExclusiveItemDefenseBoost(struct entity *entity, s32 idx);
extern s32 FixedPoint64ToInt(struct fixed_point_64 *x);
extern int IsRecoilMove(enum move_id move_id);
extern void PlayEffectAnimation0x1A9__022E6130(struct entity *entity);
extern void PlayEffectAnimation0x1A9__022E617C(struct entity *entity);
extern void PlayEffectAnimation0x18E(struct entity *entity);
extern bool8 AuraBowIsActive(struct entity *entity);
extern bool8 FixedPoint64CmpLt(const struct fixed_point_64 *a, const struct fixed_point_64 *b);
extern void DivideFixedPoint64(struct fixed_point_64 *out, struct fixed_point_64 *a, struct fixed_point_64 *b);
extern void ResetDamageCalcDiagnostics(void);
extern bool8 OtherMonsterAbilityIsActive(struct entity *entity, enum ability_id ability_id);
extern void MultiplyFixedPoint64(struct fixed_point_64 *out, const struct fixed_point_64 *a, const struct fixed_point_64 *b);
extern bool8 UpdateStateFlags(struct monster *info, s32 flag, bool8 value);
extern void ResetDamageData(struct unk_02308FE0 *damage_data);
extern bool8 ExclusiveItemEffectIsActiveWithLogging(struct entity *user, struct entity *target, bool8 should_log, s32 message_id, enum exclusive_item_effect_id effect_id);
extern const u8 ov29_02352984[];
extern const u8 ov29_02352990[];
extern const u8 ov29_0235299C[];
extern const s32 ov29_02352838[];
extern const s16 AURA_BOW_STAT_BOOST;
extern const s16 DEF_SCARF_STAT_BOOST;
extern const s16 MUNCH_BELT_STAT_BOOST;
extern const s16 POWER_BAND_STAT_BOOST;
extern const s16 SPECIAL_BAND_STAT_BOOST;
extern const s16 ZINC_BAND_STAT_BOOST;
extern const s16 SCOPE_LENS_CRIT_RATE_BOOST;
extern const s16 SUPER_LUCK_CRIT_RATE_BOOST;
extern const s16 TYPE_ADVANTAGE_MASTER_CRIT_RATE;
extern const s32 AIR_BLADE_DAMAGE_MULTIPLIER;
extern const s32 ME_FIRST_MULTIPLIER;
extern const s32 POWER_PITCHER_DAMAGE_MULTIPLIER;
extern const s32 DAMAGE_FORMULA_AT_PREFACTOR;
extern const s32 DAMAGE_FORMULA_CONSTANT_SHIFT;
extern const s32 DAMAGE_FORMULA_DEF_PREFACTOR;
extern const s32 DAMAGE_FORMULA_FLV_DEFICIT_DIVISOR;
extern const s32 DAMAGE_FORMULA_FLV_SHIFT;
extern const s32 DAMAGE_FORMULA_LN_ARG_PREFACTOR;
extern const s32 DAMAGE_FORMULA_LN_PREFACTOR;
extern const s32 DAMAGE_FORMULA_NON_TEAM_MEMBER_MODIFIER;
extern const s32 OFFENSIVE_STAT_STAGE_MULTIPLIERS[21];
extern const s32 DEFENSIVE_STAT_STAGE_MULTIPLIERS[21];
extern const struct fixed_point_64 DAMAGE_FORMULA_MAX_BASE;
extern const struct fixed_point_64 DAMAGE_FORMULA_MIN_BASE;
extern const struct fixed_point_64 DAMAGE_MULTIPLIER_0_5;
extern const struct fixed_point_64 DAMAGE_MULTIPLIER_1_5;
extern const struct fixed_point_64 DAMAGE_MULTIPLIER_2;

#ifdef JAPAN
#define MESSAGE_C53 0x992
#define MESSAGE_C54 0x993
#define MESSAGE_C55 0x994
#define MESSAGE_C57 0x996
#define MESSAGE_C58 0x997
#define MESSAGE_DC1 0xB01
#else
#define MESSAGE_C53 0xC53
#define MESSAGE_C54 0xC54
#define MESSAGE_C55 0xC55
#define MESSAGE_C57 0xC57
#define MESSAGE_C58 0xC58
#define MESSAGE_DC1 0xDC1
#endif

void CalcDamage(struct entity *attacker, struct entity *defender, enum type_id attack_type,
                s32 power, s32 crit_chance, struct unk_02308FE0 *damage_out,
                s32 damage_mult, enum move_id move_id, s32 a9)
{
    struct fixed_point_64 fp1;
    struct fixed_point_64 fp2;
    struct fixed_point_64 fp3;
    struct fixed_point_64 fp4;
    struct fixed_point_64 fp5;
    s32 arr[2];
    struct fixed_point_64 fp6;
    struct fixed_point_64 fp7;
    struct fixed_point_64 fp8;
    struct fixed_point_64 fp9;
    struct fixed_point_64 fp10;
    struct fixed_point_64 fp11;
    struct fixed_point_64 fp12;
    struct fixed_point_64 fp13;
    struct monster *mon1;
    struct monster *mon2;
    bool8 f1;
    s32 v1;
    s32 v2;
    s32 v3;
    s32 v4;
    bool8 f2;
    bool8 f3;
    s32 v5;
    s32 v6;
    s32 v7;
    s32 v9;
    struct monster *mon3;
    struct monster *mon4;
    int v10;
    s32 v11;
    s32 v12;
    s32 v13;
    s32 v14;
    s32 v15;
    s32 v16;
    s32 v17;
    bool8 f4;
    s32 v18;
    s32 v19;
    s32 v20;
    volatile s32 *p1;
    volatile s32 *p3;
    struct damage_calc_diag *diag;

    mon1 = GetEntInfo(attacker);
    mon2 = GetEntInfo(defender);
    v10 = damage_mult;
    diag = &DUNGEON_PTR->last_damage_calc;
    ResetDamageData(damage_out);

    if (mon1->me_first_flag) {
        v10 = MultiplyByFixedPoint(v10, ME_FIRST_MULTIPLIER);
    }
    if (AbilityIsActiveVeneer(attacker, ABILITY_RECKLESS) && IsRecoilMove(move_id)) {
        v10 = v10 * 3 / 2;
    }
    if (AbilityIsActiveVeneer(attacker, ABILITY_IRON_FIST) && IsPunchMove(move_id)) {
        v10 = MultiplyByFixedPoint(v10, 0x180);
    }
    if (AbilityIsActiveVeneer(attacker, ABILITY_NORMALIZE)) {
        attack_type = TYPE_NORMAL;
    }
    if (move_id == 0x1D3) {
        attack_type = mon1->types[0];
    }
    v11 = MoveIsNotPhysical(move_id);
    ResetDamageCalcDiagnostics();

    if (!mon1->is_team_leader && CeilFixedPoint(mon1->belly) == 0) {
        damage_out->field_0x0 = 1;
        damage_out->field_0x4 = 0;
        damage_out->field_0x8 = MATCHUP_NEUTRAL;
        damage_out->field_0xc = attack_type;
        damage_out->field_0xd = GetMoveCategory(move_id);
        damage_out->field_0xe = FALSE;
        damage_out->field_0xf = FALSE;
        damage_out->field_0x10 = FALSE;
        return;
    }
#ifdef JAPAN
    if (move_id == 0x163
        && DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_WONDER_GUARD)) {
#else
    if (move_id == 0x163
        && DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_WONDER_GUARD, TRUE)) {
#endif
        damage_out->field_0x0 = 1;
        damage_out->field_0x4 = 0;
        damage_out->field_0x8 = MATCHUP_NEUTRAL;
        damage_out->field_0xc = attack_type;
        damage_out->field_0xd = GetMoveCategory(move_id);
        damage_out->field_0xe = FALSE;
        damage_out->field_0xf = FALSE;
        damage_out->field_0x10 = FALSE;
        return;
    }

    damage_out->field_0xc = attack_type;
    damage_out->field_0xd = GetMoveCategory(move_id);
    diag->move_type = attack_type;
    v16 = 0;
    v17 = 0;
    diag->move_category = v11;
    v3 = mon1->stat_modifiers.offensive_multipliers[v11];
    v4 = mon2->stat_modifiers.defensive_multipliers[v11];

    if (AbilityIsActiveVeneer(attacker, ABILITY_DOWNLOAD)) {
        if (mon2->defensive_stats[0] >= mon2->defensive_stats[1]) {
            if (v11 == 1) {
                v16++;
                diag->ability_offense_modifier++;
            }
        } else if (v11 == 0) {
            v16++;
            diag->ability_offense_modifier++;
        }
    }

    v1 = mon1->stat_modifiers.offensive_stages[v11];
    if (a9) {
        if (attack_type == TYPE_FIRE) {
            s16 v21 = mon1->stat_modifiers.flash_fire_boost;
            diag->flash_fire_boost = v21;
            v16 += v21;
        }
    }

    if (IqSkillIsEnabled(attacker, IQ_AGGRESSOR)) {
        v16++;
        diag->iq_skill_offense_modifier++;
    }
    if (IqSkillIsEnabled(attacker, IQ_DEFENDER)) {
        v16--;
        diag->iq_skill_offense_modifier--;
    }
    if (IqSkillIsEnabled(attacker, IQ_PRACTICE_SWINGER) && mon1->practice_swinger_flag) {
        v16++;
        diag->iq_skill_offense_modifier++;
    }
    if (NearbyAllyIqSkillIsEnabled(attacker, IQ_CHEERLEADER)) {
        v16++;
    }

    if (v11 == 0) {
        if (AbilityIsActiveVeneer(attacker, ABILITY_RIVALRY)) {
            if (GendersEqualNotGenderless(mon1->apparent_id, mon2->apparent_id)) {
                v16++;
                diag->ability_offense_modifier++;
            } else if (GetMonsterGenderVeneer(mon1->apparent_id) != 3
                       && GetMonsterGenderVeneer(mon2->apparent_id) != 3) {
                v16--;
                diag->ability_offense_modifier--;
            }
        }
        if (GetApparentWeather(attacker) == WEATHER_SUNNY
            && (AbilityIsActiveVeneer(attacker, ABILITY_FLOWER_GIFT)
                || OtherMonsterAbilityIsActive(attacker, ABILITY_FLOWER_GIFT))) {
            v16++;
            diag->ability_offense_modifier++;
        }
    } else {
        if (AbilityIsActiveVeneer(attacker, ABILITY_SOLAR_POWER)
            && GetApparentWeather(attacker) == WEATHER_SUNNY) {
            v16 += 2;
            diag->ability_offense_modifier += 2;
        }
        if (GetApparentWeather(defender) == WEATHER_SUNNY
            && (AbilityIsActiveVeneer(defender, ABILITY_FLOWER_GIFT)
                || OtherMonsterAbilityIsActive(defender, ABILITY_FLOWER_GIFT))) {
            v17++;
            diag->ability_defense_modifier++;
        }
        if (GetApparentWeather(defender) == WEATHER_SANDSTORM
            && (mon2->types[0] == TYPE_ROCK || mon2->types[1] == TYPE_ROCK)) {
            v17 += 2;
        }
    }

    if (mon1->apparent_id == 0x1A3) {
        v16 += 2;
    }
    if (mon1->apparent_id == 0x1A4) {
        v16 -= 2;
    }
    if (mon1->apparent_id == 0x1A5) {
        v16 -= 2;
    }
    if (mon1->apparent_id == 0x211) {
        v16 -= 2;
    } else if (mon1->apparent_id == 0x218) {
        v16 += 2;
    }

    v1 += v16;
    if (mon1->anger_point_flag && AbilityIsActiveVeneer(attacker, ABILITY_ANGER_POINT)) {
        v1 = 20;
    }

    v13 = mon2->stat_modifiers.defensive_stages[v11];
    if (v11 == 0) {
        if (mon2->bide_class_status.bide == 6) {
            diag->skull_bash_defense_boost_activated = TRUE;
            v17++;
        }
        if (IqSkillIsEnabled(defender, IQ_COUNTER_BASHER)) {
            v17--;
            diag->iq_skill_defense_modifier--;
        }
    }
    if (IqSkillIsEnabled(defender, IQ_AGGRESSOR)) {
        v17--;
        diag->iq_skill_defense_modifier--;
    }
    if (IqSkillIsEnabled(defender, IQ_DEFENDER)) {
        v17++;
        diag->iq_skill_defense_modifier++;
    }
    if (mon2->apparent_id == 0x1A3) {
        v17 -= 2;
    }
    if (mon2->apparent_id == 0x1A4) {
        v17 += 2;
    }
    if (mon2->apparent_id == 0x1A5) {
        v17 -= 2;
    }
#ifdef JAPAN
    if (mon1->apparent_id == 0x211) {
        v17 += 2;
    } else if (mon1->apparent_id == 0x218) {
        v17 -= 2;
    }
#else
    if (mon2->apparent_id == 0x211) {
        v17 += 2;
    } else if (mon2->apparent_id == 0x218) {
        v17 -= 2;
    }
#endif
    v13 += v17;

    if (move_id == 0x1BD) {
        s16 v22 = 0;

        if (mon2->stat_modifiers.offensive_stages[0] > 10) {
            v22 += mon2->stat_modifiers.offensive_stages[0] - 10;
        }
        if (mon2->stat_modifiers.defensive_stages[0] > 10) {
            v22 += mon2->stat_modifiers.defensive_stages[0] - 10;
        }
        if (mon2->stat_modifiers.offensive_stages[1] > 10) {
            v22 += mon2->stat_modifiers.offensive_stages[1] - 10;
        }
        if (mon2->stat_modifiers.defensive_stages[1] > 10) {
            v22 += mon2->stat_modifiers.defensive_stages[1] - 10;
        }
        v1 += v22;
    }

    if (AbilityIsActiveVeneer(attacker, ABILITY_UNAWARE)) {
        v13 = 10;
        v4 = 0x100;
#ifdef JAPAN
    } else if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_UNAWARE)) {
#else
    } else if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_UNAWARE, TRUE)) {
#endif
        v1 = 10;
        v3 = 0x100;
    }

    if (v1 < 0) {
        v1 = 0;
    }
    if (v1 > 20) {
        v1 = 20;
    }
    diag->offensive_stat_stage = v1;
    diag->offensive_stat = mon1->offensive_stats[v11];
    arr[0] = MultiplyByFixedPoint(
        MultiplyByFixedPoint(mon1->offensive_stats[v11] << 8,
                             OFFENSIVE_STAT_STAGE_MULTIPLIERS[v1]),
        v3) >> 8;

    if (v13 < 0) {
        v13 = 0;
    }
    if (v13 > 20) {
        v13 = 20;
    }
    diag->defensive_stat_stage = v13;
    diag->defensive_stat = mon2->defensive_stats[v11];
    arr[1] = MultiplyByFixedPoint(
        MultiplyByFixedPoint(mon2->defensive_stats[v11] << 8,
                             DEFENSIVE_STAT_STAGE_MULTIPLIERS[v13]),
        v4) >> 8;

    if (!mon1->is_not_team_member) {
        arr[0] += ExclusiveItemOffenseBoost(attacker, v11);
    }
    if (!mon2->is_not_team_member) {
        arr[1] += ExclusiveItemDefenseBoost(defender, v11);
    }

    if (v11 == 0) {
        if (ItemIsActive__0230A9DC(attacker, ITEM_POWER_BAND)) {
            arr[0] += POWER_BAND_STAT_BOOST;
            diag->item_atk_modifier += POWER_BAND_STAT_BOOST;
        }
        if (ItemIsActive__0230A9DC(attacker, ITEM_MUNCH_BELT)) {
            arr[0] += MUNCH_BELT_STAT_BOOST;
            diag->item_atk_modifier += MUNCH_BELT_STAT_BOOST;
        }
        if (AuraBowIsActive(attacker)) {
            arr[0] += AURA_BOW_STAT_BOOST;
            diag->item_sp_atk_modifier += AURA_BOW_STAT_BOOST;
        }
        if (a9) {
            if (ItemIsActive__0230A9DC(defender, ITEM_DEF_SCARF)) {
                arr[1] += DEF_SCARF_STAT_BOOST;
                diag->item_def_modifier += DEF_SCARF_STAT_BOOST;
            }
            if (AuraBowIsActive(defender)) {
                arr[1] += AURA_BOW_STAT_BOOST;
                diag->item_def_modifier += AURA_BOW_STAT_BOOST;
            }
        }
    } else {
        if (a9) {
            if (ItemIsActive__0230A9DC(defender, ITEM_ZINC_BAND)) {
                arr[1] += ZINC_BAND_STAT_BOOST;
                diag->item_sp_def_modifier += ZINC_BAND_STAT_BOOST;
            }
            if (AuraBowIsActive(defender)) {
                arr[1] += AURA_BOW_STAT_BOOST;
                diag->item_def_modifier += AURA_BOW_STAT_BOOST;
            }
        }
        if (ItemIsActive__0230A9DC(attacker, ITEM_SPECIAL_BAND)) {
            arr[0] += SPECIAL_BAND_STAT_BOOST;
            diag->item_sp_atk_modifier += SPECIAL_BAND_STAT_BOOST;
        }
        if (ItemIsActive__0230A9DC(attacker, ITEM_MUNCH_BELT)) {
            arr[0] += MUNCH_BELT_STAT_BOOST;
            diag->item_sp_atk_modifier += MUNCH_BELT_STAT_BOOST;
        }
        if (AuraBowIsActive(defender)) {
            arr[0] += AURA_BOW_STAT_BOOST;
            diag->item_sp_atk_modifier += AURA_BOW_STAT_BOOST;
        }
    }

    p1 = &arr[0];
    FixedPoint32To64(&fp4,
                     MultiplyByFixedPoint(MultiplyByFixedPoint(power << 8,
                                                               OFFENSIVE_STAT_STAGE_MULTIPLIERS[v1]),
                                          v3));
    v2 = DungeonRandInt(100);
    mon1->prev_state_flags &= ~0x100;
    mon1->state_flags &= ~0x100;
    v14 = 1;
    v15 = 1;
    v7 = 1;
    v6 = 1;

    v5 = MoveIsNotPhysical(move_id);
    if (v5 == 0 && AbilityIsActiveVeneer(attacker, ABILITY_GUTS)) {
        mon3 = attacker->info;
        f1 = MonsterHasNegativeStatus(attacker, TRUE);
        f4 = UpdateStateFlags(mon3, 1, f1);
        if (f1) {
            v14 *= 2;
        }
        if (f4) {
            PlayEffectAnimation0x1A9__022E6130(attacker);
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C53);
        }
    }

    if (AbilityIsActiveVeneer(attacker, ABILITY_HUGE_POWER)
        || AbilityIsActiveVeneer(attacker, ABILITY_PURE_POWER)) {
        mon3 = attacker->info;
        f2 = (v2 < 0x21 && v5 == 0);
        f4 = UpdateStateFlags(mon3, 0x100, f2);
        if (f2) {
            v14 *= 3;
            v15 *= 2;
        }
        if (f4) {
            PlayEffectAnimation0x1A9__022E617C(attacker);
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C54);
        }
    }

    if (AbilityIsActiveVeneer(attacker, ABILITY_HUSTLE) && v5 == 0) {
        v14 *= 3;
        v15 *= 2;
    }

    v12 = !((struct monster *)attacker->info)->is_not_team_member;
    if (AbilityIsActiveVeneer(attacker, ABILITY_PLUS) && v5 == 1
        && DUNGEON_PTR->minus_is_active[v12]) {
        v14 *= 15;
        v15 *= 10;
    }
    if (AbilityIsActiveVeneer(attacker, ABILITY_MINUS) && v5 == 1
        && DUNGEON_PTR->plus_is_active[v12]) {
        v14 *= 15;
        v15 *= 10;
    }

#ifdef JAPAN
    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_INTIMIDATE)
        && v5 == 0) {
#else
    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_INTIMIDATE, TRUE)
        && v5 == 0) {
#endif
        v14 *= 4;
        v15 *= 5;
    }
#ifdef JAPAN
    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_MARVEL_SCALE)
        && v5 == 0) {
#else
    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_MARVEL_SCALE, TRUE)
        && v5 == 0) {
#endif
        mon4 = defender->info;
        f3 = MonsterHasNegativeStatus(defender, TRUE);
        f4 = UpdateStateFlags(mon4, 8, f3);
        if (f3) {
            v7 *= 3;
            v6 *= 2;
        }
        if (f4) {
            PlayEffectAnimation0x18E(defender);
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C55);
        }
    }

    p3 = &arr[1];
    v9 = *p1 * v14;
    *p3 = *p3 * v7;
    *p1 = v9;
    if (v15 != 1) {
        *p1 = v9 / v15;
    }
    if (v6 != 1) {
        p3 = &arr[1];
        *p3 = *p3 / v6;
    }

    diag->offense_calc = arr[0];
    diag->defense_calc = arr[1];
    if (arr[0] < 0) {
        arr[0] = 0;
    }
    if (arr[0] >= 999) {
        arr[0] = 999;
    }
    diag->damage_calc_def = arr[1];
    IntToFixedPoint64(&fp5, arr[1]);
    IntToFixedPoint64(&fp6, arr[0] - arr[1]);
    FixedPoint32To64(&fp7, DAMAGE_FORMULA_FLV_DEFICIT_DIVISOR);
    DivideFixedPoint64(&fp6, &fp6, &fp7);
    IntToFixedPoint64(&fp7, mon1->level);
    AddFixedPoint64(&fp3, &fp7, &fp6);
    IntToFixedPoint64(&fp7, arr[0]);
    AddFixedPoint64(&fp4, &fp4, &fp7);
    diag->damage_calc_at = FixedPoint64ToInt(&fp4);
    diag->attacker_level = mon1->level;
    diag->damage_calc_flv = FixedPoint64ToInt(&fp3);
    Debug_Print0(ov29_02352984, FixedPoint64ToInt(&fp3));
    Debug_Print0(ov29_02352990, FixedPoint64ToInt(&fp4));
    Debug_Print0(ov29_0235299C, FixedPoint64ToInt(&fp5));

    FixedPoint32To64(&fp9, DAMAGE_FORMULA_AT_PREFACTOR);
    MultiplyFixedPoint64(&fp9, &fp4, &fp9);
    FixedPoint32To64(&fp10, DAMAGE_FORMULA_DEF_PREFACTOR);
    MultiplyFixedPoint64(&fp10, &fp5, &fp10);
    FixedPoint32To64(&fp8, DAMAGE_FORMULA_FLV_SHIFT);
    AddFixedPoint64(&fp11, &fp3, &fp8);
    FixedPoint32To64(&fp8, DAMAGE_FORMULA_LN_ARG_PREFACTOR);
    MultiplyFixedPoint64(&fp11, &fp11, &fp8);
    ClampedLn(&fp11, FixedPoint64ToInt(&fp11));
    FixedPoint32To64(&fp8, DAMAGE_FORMULA_LN_PREFACTOR);
    MultiplyFixedPoint64(&fp11, &fp11, &fp8);
    AddFixedPoint64(&fp2, &fp10, &fp9);
    AddFixedPoint64(&fp2, &fp2, &fp11);
    FixedPoint32To64(&fp8, DAMAGE_FORMULA_CONSTANT_SHIFT);
    AddFixedPoint64(&fp2, &fp2, &fp8);

    if (!FixedRoomIsSubstituteRoom() && mon1->is_not_team_member) {
        FixedPoint32To64(&fp8, DAMAGE_FORMULA_NON_TEAM_MEMBER_MODIFIER);
        DivideFixedPoint64(&fp2, &fp2, &fp8);
    }

    if (FixedPoint64CmpLt(&DAMAGE_FORMULA_MAX_BASE, &fp2)) {
        fp2.lower = ((const struct fixed_point_64 *)&ov29_02352838[13])->lower;
        fp2.upper = ((const struct fixed_point_64 *)&ov29_02352838[13])->upper;
    }
    if (FixedPoint64CmpLt(&fp2, &DAMAGE_FORMULA_MIN_BASE)) {
        fp2.lower = ((const struct fixed_point_64 *)&ov29_02352838[17])->lower;
        fp2.upper = ((const struct fixed_point_64 *)&ov29_02352838[17])->upper;
    }

    v18 = CalcTypeBasedDamageEffects(&fp1, attacker, defender, power, attack_type,
                                         damage_out, IsRegularAttackOrProjectile(move_id) != 0);

    if (attack_type == TYPE_FIRE) {
        v20 = FlashFireShouldActivate(attacker, defender);
        if (v20 && !mon2->apply_flash_fire_boost && a9) {
            mon2->apply_flash_fire_boost = TRUE;
            SubstitutePlaceholderStringTags(1, defender, 0);
            if (v20 == 1) {
                LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C58);
            } else {
                LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C57);
            }
        }
    }

    if (a9 && !ExclusiveItemEffectIsActive__0230A9B8(attacker, EXCLUSIVE_EFF_BYPASS_REFLECT_LIGHT_SCREEN)) {
        if (v11 == 0) {
            if ((move_id != 0x48 && mon2->reflect_class_status.reflect == 1)
                || ExclusiveItemEffectIsActive__0230A9B8(defender, EXCLUSIVE_EFF_HALVED_PHYSICAL_DAMAGE)) {
                PlayEffectAnimation0x171(defender);
                MultiplyFixedPoint64(&fp1, &fp1, &DAMAGE_MULTIPLIER_0_5);
                diag->half_physical_damage_activated = TRUE;
            }
        }
        if (v11 == 1
            && (mon2->reflect_class_status.reflect == 3
                || ExclusiveItemEffectIsActive__0230A9B8(defender, EXCLUSIVE_EFF_HALVED_SPECIAL_DAMAGE))) {
            PlayEffectAnimation0x171Full(defender);
            MultiplyFixedPoint64(&fp1, &fp1, &DAMAGE_MULTIPLIER_0_5);
            diag->half_special_damage_activated = TRUE;
        }
    }

#ifdef JAPAN
    if (mon2->reflect_class_status.reflect != 0x11
        && !DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_BATTLE_ARMOR)
        && !DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_SHELL_ARMOR)
        && !IqSkillIsEnabled(defender, IQ_CRITICAL_DODGER)) {
#else
    if (mon2->reflect_class_status.reflect != 0x11
        && !DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_BATTLE_ARMOR, TRUE)
        && !DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_SHELL_ARMOR, TRUE)
        && !IqSkillIsEnabled(defender, IQ_CRITICAL_DODGER)) {
#endif
        if (GetMonsterGenderVeneer(mon1->id) == 2) {
            v19 = crit_chance;
        } else {
            v19 = crit_chance + crit_chance / 2;
        }
        if (mon1->sure_shot_class_status.sure_shot == 4) {
            v19 = 999;
            diag->focus_energy_activated = TRUE;
        } else {
            if (ItemIsActive__0230A9DC(attacker, ITEM_SCOPE_LENS)
                || IqSkillIsEnabled(attacker, IQ_SHARPSHOOTER)) {
                diag->scope_lens_or_sharpshooter_activated = TRUE;
                v19 += SCOPE_LENS_CRIT_RATE_BOOST;
            }
            if (AbilityIsActiveVeneer(attacker, ABILITY_SUPER_LUCK)) {
                diag->super_luck_activated = TRUE;
                v19 += SUPER_LUCK_CRIT_RATE_BOOST;
            }
            if (ItemIsActive__0230A9DC(defender, ITEM_PATSY_BAND)) {
                diag->patsy_band_activated = TRUE;
                v19 += SCOPE_LENS_CRIT_RATE_BOOST;
            }
            if (v18 && IqSkillIsEnabled(attacker, IQ_TYPE_ADVANTAGE_MASTER)) {
                diag->type_advantage_master_activated = TRUE;
                v19 = TYPE_ADVANTAGE_MASTER_CRIT_RATE;
            }
        }
        if (DungeonRandInt(100) < v19
            && !ExclusiveItemEffectIsActiveWithLogging(attacker, defender, TRUE, MESSAGE_DC1, EXCLUSIVE_EFF_NO_CRITICAL_HITS)) {
            damage_out->field_0xe = TRUE;
            if (AbilityIsActiveVeneer(attacker, ABILITY_SNIPER)) {
                MultiplyFixedPoint64(&fp1, &fp1, &DAMAGE_MULTIPLIER_2);
                diag->sniper_activated = TRUE;
            } else {
                MultiplyFixedPoint64(&fp1, &fp1, &DAMAGE_MULTIPLIER_1_5);
            }
        }
    }

    diag->damage_calc_base = FixedPoint64ToInt(&fp2);
    MultiplyFixedPoint64(&fp2, &fp2, &fp1);
    diag->static_damage_mult = v10;
    FixedPoint32To64(&fp12, v10);
    MultiplyFixedPoint64(&fp2, &fp2, &fp12);
    diag->damage_calc = FixedPoint64ToInt(&fp2);

    fp1.lower = DungeonRandInt(0x4000);
    fp1.upper = 0;
    fp1.lower += 0xE000;
    MultiplyFixedPoint64(&fp2, &fp2, &fp1);
    IntToFixedPoint64(&fp13, 100);
    MultiplyFixedPoint64(&fp1, &fp13, &fp1);
    diag->damage_calc_random_mult_pct = FixedPoint64ToInt(&fp1);
    damage_out->field_0x0 = FixedPoint64ToInt(&fp2);

    if (move_id == 0x195) {
        damage_out->field_0x0 = RoundUpDiv256(MultiplyByFixedPoint(damage_out->field_0x0 << 8, 0x80));
    }
    if (move_id == 0x195 && IqSkillIsEnabled(attacker, IQ_POWER_PITCHER)) {
        damage_out->field_0x0 = RoundUpDiv256(
            MultiplyByFixedPoint(damage_out->field_0x0 << 8, POWER_PITCHER_DAMAGE_MULTIPLIER));
    }
    if (damage_out->field_0x0 > 0
        && ExclusiveItemEffectIsActive__0230A9B8(attacker, EXCLUSIVE_EFF_DAMAGE_BOOST_50_PCT)) {
        damage_out->field_0x0 = RoundUpDiv256(
            MultiplyByFixedPoint(damage_out->field_0x0 << 8, AIR_BLADE_DAMAGE_MULTIPLIER));
    }

    damage_out->field_0x4 = 0;
    if (damage_out->field_0x0 == 0) {
        damage_out->field_0xe = FALSE;
    }
    mon2->anger_point_flag = damage_out->field_0xe;
}
