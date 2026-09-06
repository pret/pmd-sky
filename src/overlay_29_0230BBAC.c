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

extern struct dungeon *DUNGEON_PTR;
extern u8 GetMonsterGenderVeneer(s16 monster_id);
extern u8 ExclusiveItemOffenseBoost(struct entity *entity, s32 idx);
extern u8 ExclusiveItemDefenseBoost(struct entity *entity, s32 idx);
extern int MoveIsNotPhysical(enum move_id move_id);
extern bool8 NearbyAllyIqSkillIsEnabled(struct entity *entity, enum iq_skill_id iq_skill);
extern s32 FixedPoint64ToInt(struct fixed_point_64 *x);
extern void AddFixedPoint64(struct fixed_point_64 *out, struct fixed_point_64 *a, struct fixed_point_64 *b);
extern void ClampedLn(struct fixed_point_64 *out, s32 x);
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
extern void LogMessageByIdWithPopupCheckUserTarget(struct entity *user, struct entity *target, u32 message_id);
extern bool8 UpdateStateFlags(struct monster *info, s32 flag, bool8 value);
extern void ResetDamageData(struct unk_02308FE0 *damage_data);
extern void SubstitutePlaceholderStringTags(s32 string_id, struct entity *entity, u32 param_3);
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
    struct fixed_point_64 type_mult;
    struct fixed_point_64 base;
    struct fixed_point_64 flv_fp;
    struct fixed_point_64 at_fp;
    struct fixed_point_64 def_fp;
    s32 calc[2];
    struct fixed_point_64 tmp2;
    struct fixed_point_64 tmp;
    struct fixed_point_64 scratch;
    struct fixed_point_64 tmp3;
    struct fixed_point_64 mult_fp;
    struct fixed_point_64 ln_fp;
    struct fixed_point_64 mult32_fp;
    struct fixed_point_64 hundred_fp;
    struct monster *amon;
    struct monster *dmon;
    bool8 has_status;
    s32 off_stage;
    s32 ability_roll;
    s32 off_mult;
    s32 def_mult;
    bool8 has_status2;
    bool8 has_status3;
    s32 not_physical2;
    s32 def_ability_div;
    s32 def_ability_mult;
    s32 dv;
    s32 p;
    struct monster *info;
    struct monster *info2;
    int dmult;
    s32 not_physical;
    s32 is_team_member;
    s32 def_stage;
    s32 off_ability_mult;
    s32 off_ability_div;
    s32 off_mod;
    s32 def_mod;
    bool8 boosted;
    s32 type_boosted;
    s32 rate;
    s32 flash;
    volatile s32 *po;
    volatile s32 *po2;
    volatile s32 *pd;
    struct damage_calc_diag *diag;

    amon = GetEntInfo(attacker);
    dmon = GetEntInfo(defender);
    dmult = damage_mult;
    diag = &DUNGEON_PTR->last_damage_calc;
    ResetDamageData(damage_out);

    if (amon->me_first_flag) {
        dmult = MultiplyByFixedPoint(dmult, ME_FIRST_MULTIPLIER);
    }
    if (AbilityIsActiveVeneer(attacker, ABILITY_RECKLESS) && IsRecoilMove(move_id)) {
        dmult = dmult * 3 / 2;
    }
    if (AbilityIsActiveVeneer(attacker, ABILITY_IRON_FIST) && IsPunchMove(move_id)) {
        dmult = MultiplyByFixedPoint(dmult, 0x180);
    }
    if (AbilityIsActiveVeneer(attacker, ABILITY_NORMALIZE)) {
        attack_type = TYPE_NORMAL;
    }
    if (move_id == 0x1D3) {
        attack_type = amon->types[0];
    }
    not_physical = MoveIsNotPhysical(move_id);
    ResetDamageCalcDiagnostics();

    if (!amon->is_team_leader && CeilFixedPoint(amon->belly) == 0) {
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
    off_mod = 0;
    def_mod = 0;
    diag->move_category = not_physical;
    off_mult = amon->stat_modifiers.offensive_multipliers[not_physical];
    def_mult = dmon->stat_modifiers.defensive_multipliers[not_physical];

    if (AbilityIsActiveVeneer(attacker, ABILITY_DOWNLOAD)) {
        if (dmon->defensive_stats[0] >= dmon->defensive_stats[1]) {
            if (not_physical == 1) {
                off_mod++;
                diag->ability_offense_modifier++;
            }
        } else if (not_physical == 0) {
            off_mod++;
            diag->ability_offense_modifier++;
        }
    }

    off_stage = amon->stat_modifiers.offensive_stages[not_physical];
    if (a9) {
        if (attack_type == TYPE_FIRE) {
            s16 boost = amon->stat_modifiers.flash_fire_boost;
            diag->flash_fire_boost = boost;
            off_mod += boost;
        }
    }

    if (IqSkillIsEnabled(attacker, IQ_AGGRESSOR)) {
        off_mod++;
        diag->iq_skill_offense_modifier++;
    }
    if (IqSkillIsEnabled(attacker, IQ_DEFENDER)) {
        off_mod--;
        diag->iq_skill_offense_modifier--;
    }
    if (IqSkillIsEnabled(attacker, IQ_PRACTICE_SWINGER) && amon->practice_swinger_flag) {
        off_mod++;
        diag->iq_skill_offense_modifier++;
    }
    if (NearbyAllyIqSkillIsEnabled(attacker, IQ_CHEERLEADER)) {
        off_mod++;
    }

    if (not_physical == 0) {
        if (AbilityIsActiveVeneer(attacker, ABILITY_RIVALRY)) {
            if (GendersEqualNotGenderless(amon->apparent_id, dmon->apparent_id)) {
                off_mod++;
                diag->ability_offense_modifier++;
            } else if (GetMonsterGenderVeneer(amon->apparent_id) != 3
                       && GetMonsterGenderVeneer(dmon->apparent_id) != 3) {
                off_mod--;
                diag->ability_offense_modifier--;
            }
        }
        if (GetApparentWeather(attacker) == WEATHER_SUNNY
            && (AbilityIsActiveVeneer(attacker, ABILITY_FLOWER_GIFT)
                || OtherMonsterAbilityIsActive(attacker, ABILITY_FLOWER_GIFT))) {
            off_mod++;
            diag->ability_offense_modifier++;
        }
    } else {
        if (AbilityIsActiveVeneer(attacker, ABILITY_SOLAR_POWER)
            && GetApparentWeather(attacker) == WEATHER_SUNNY) {
            off_mod += 2;
            diag->ability_offense_modifier += 2;
        }
        if (GetApparentWeather(defender) == WEATHER_SUNNY
            && (AbilityIsActiveVeneer(defender, ABILITY_FLOWER_GIFT)
                || OtherMonsterAbilityIsActive(defender, ABILITY_FLOWER_GIFT))) {
            def_mod++;
            diag->ability_defense_modifier++;
        }
        if (GetApparentWeather(defender) == WEATHER_SANDSTORM
            && (dmon->types[0] == TYPE_ROCK || dmon->types[1] == TYPE_ROCK)) {
            def_mod += 2;
        }
    }

    if (amon->apparent_id == 0x1A3) {
        off_mod += 2;
    }
    if (amon->apparent_id == 0x1A4) {
        off_mod -= 2;
    }
    if (amon->apparent_id == 0x1A5) {
        off_mod -= 2;
    }
    if (amon->apparent_id == 0x211) {
        off_mod -= 2;
    } else if (amon->apparent_id == 0x218) {
        off_mod += 2;
    }

    off_stage += off_mod;
    if (amon->anger_point_flag && AbilityIsActiveVeneer(attacker, ABILITY_ANGER_POINT)) {
        off_stage = 20;
    }

    def_stage = dmon->stat_modifiers.defensive_stages[not_physical];
    if (not_physical == 0) {
        if (dmon->bide_class_status.bide == 6) {
            diag->skull_bash_defense_boost_activated = TRUE;
            def_mod++;
        }
        if (IqSkillIsEnabled(defender, IQ_COUNTER_BASHER)) {
            def_mod--;
            diag->iq_skill_defense_modifier--;
        }
    }
    if (IqSkillIsEnabled(defender, IQ_AGGRESSOR)) {
        def_mod--;
        diag->iq_skill_defense_modifier--;
    }
    if (IqSkillIsEnabled(defender, IQ_DEFENDER)) {
        def_mod++;
        diag->iq_skill_defense_modifier++;
    }
    if (dmon->apparent_id == 0x1A3) {
        def_mod -= 2;
    }
    if (dmon->apparent_id == 0x1A4) {
        def_mod += 2;
    }
    if (dmon->apparent_id == 0x1A5) {
        def_mod -= 2;
    }
#ifdef JAPAN
    if (amon->apparent_id == 0x211) {
        def_mod += 2;
    } else if (amon->apparent_id == 0x218) {
        def_mod -= 2;
    }
#else
    if (dmon->apparent_id == 0x211) {
        def_mod += 2;
    } else if (dmon->apparent_id == 0x218) {
        def_mod -= 2;
    }
#endif
    def_stage += def_mod;

    if (move_id == 0x1BD) {
        s16 sum = 0;

        if (dmon->stat_modifiers.offensive_stages[0] > 10) {
            sum += dmon->stat_modifiers.offensive_stages[0] - 10;
        }
        if (dmon->stat_modifiers.defensive_stages[0] > 10) {
            sum += dmon->stat_modifiers.defensive_stages[0] - 10;
        }
        if (dmon->stat_modifiers.offensive_stages[1] > 10) {
            sum += dmon->stat_modifiers.offensive_stages[1] - 10;
        }
        if (dmon->stat_modifiers.defensive_stages[1] > 10) {
            sum += dmon->stat_modifiers.defensive_stages[1] - 10;
        }
        off_stage += sum;
    }

    if (AbilityIsActiveVeneer(attacker, ABILITY_UNAWARE)) {
        def_stage = 10;
        def_mult = 0x100;
#ifdef JAPAN
    } else if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_UNAWARE)) {
#else
    } else if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_UNAWARE, TRUE)) {
#endif
        off_stage = 10;
        off_mult = 0x100;
    }

    if (off_stage < 0) {
        off_stage = 0;
    }
    if (off_stage > 20) {
        off_stage = 20;
    }
    diag->offensive_stat_stage = off_stage;
    diag->offensive_stat = amon->offensive_stats[not_physical];
    calc[0] = MultiplyByFixedPoint(
        MultiplyByFixedPoint(amon->offensive_stats[not_physical] << 8,
                             OFFENSIVE_STAT_STAGE_MULTIPLIERS[off_stage]),
        off_mult) >> 8;

    if (def_stage < 0) {
        def_stage = 0;
    }
    if (def_stage > 20) {
        def_stage = 20;
    }
    diag->defensive_stat_stage = def_stage;
    diag->defensive_stat = dmon->defensive_stats[not_physical];
    calc[1] = MultiplyByFixedPoint(
        MultiplyByFixedPoint(dmon->defensive_stats[not_physical] << 8,
                             DEFENSIVE_STAT_STAGE_MULTIPLIERS[def_stage]),
        def_mult) >> 8;

    if (!amon->is_not_team_member) {
        calc[0] += ExclusiveItemOffenseBoost(attacker, not_physical);
    }
    if (!dmon->is_not_team_member) {
        calc[1] += ExclusiveItemDefenseBoost(defender, not_physical);
    }

    if (not_physical == 0) {
        if (ItemIsActive__0230A9DC(attacker, ITEM_POWER_BAND)) {
            calc[0] += POWER_BAND_STAT_BOOST;
            diag->item_atk_modifier += POWER_BAND_STAT_BOOST;
        }
        if (ItemIsActive__0230A9DC(attacker, ITEM_MUNCH_BELT)) {
            calc[0] += MUNCH_BELT_STAT_BOOST;
            diag->item_atk_modifier += MUNCH_BELT_STAT_BOOST;
        }
        if (AuraBowIsActive(attacker)) {
            calc[0] += AURA_BOW_STAT_BOOST;
            diag->item_sp_atk_modifier += AURA_BOW_STAT_BOOST;
        }
        if (a9) {
            if (ItemIsActive__0230A9DC(defender, ITEM_DEF_SCARF)) {
                calc[1] += DEF_SCARF_STAT_BOOST;
                diag->item_def_modifier += DEF_SCARF_STAT_BOOST;
            }
            if (AuraBowIsActive(defender)) {
                calc[1] += AURA_BOW_STAT_BOOST;
                diag->item_def_modifier += AURA_BOW_STAT_BOOST;
            }
        }
    } else {
        if (a9) {
            if (ItemIsActive__0230A9DC(defender, ITEM_ZINC_BAND)) {
                calc[1] += ZINC_BAND_STAT_BOOST;
                diag->item_sp_def_modifier += ZINC_BAND_STAT_BOOST;
            }
            if (AuraBowIsActive(defender)) {
                calc[1] += AURA_BOW_STAT_BOOST;
                diag->item_def_modifier += AURA_BOW_STAT_BOOST;
            }
        }
        if (ItemIsActive__0230A9DC(attacker, ITEM_SPECIAL_BAND)) {
            calc[0] += SPECIAL_BAND_STAT_BOOST;
            diag->item_sp_atk_modifier += SPECIAL_BAND_STAT_BOOST;
        }
        if (ItemIsActive__0230A9DC(attacker, ITEM_MUNCH_BELT)) {
            calc[0] += MUNCH_BELT_STAT_BOOST;
            diag->item_sp_atk_modifier += MUNCH_BELT_STAT_BOOST;
        }
        if (AuraBowIsActive(defender)) {
            calc[0] += AURA_BOW_STAT_BOOST;
            diag->item_sp_atk_modifier += AURA_BOW_STAT_BOOST;
        }
    }

    po = &calc[0];
    po2 = &calc[0];
    FixedPoint32To64(&at_fp,
                     MultiplyByFixedPoint(MultiplyByFixedPoint(power << 8,
                                                               OFFENSIVE_STAT_STAGE_MULTIPLIERS[off_stage]),
                                          off_mult));
    ability_roll = DungeonRandInt(100);
    amon->prev_state_flags &= ~0x100;
    amon->state_flags &= ~0x100;
    off_ability_mult = 1;
    off_ability_div = 1;
    def_ability_mult = 1;
    def_ability_div = 1;

    not_physical2 = MoveIsNotPhysical(move_id);
    if (not_physical2 == 0 && AbilityIsActiveVeneer(attacker, ABILITY_GUTS)) {
        info = attacker->info;
        has_status = MonsterHasNegativeStatus(attacker, TRUE);
        boosted = UpdateStateFlags(info, 1, has_status);
        if (has_status) {
            off_ability_mult <<= 1;
        }
        if (boosted) {
            PlayEffectAnimation0x1A9__022E6130(attacker);
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C53);
        }
    }

    if (AbilityIsActiveVeneer(attacker, ABILITY_HUGE_POWER)
        || AbilityIsActiveVeneer(attacker, ABILITY_PURE_POWER)) {
        info = attacker->info;
        has_status2 = (ability_roll < 0x21 && not_physical2 == 0);
        boosted = UpdateStateFlags(info, 0x100, has_status2);
        if (has_status2) {
            off_ability_mult += off_ability_mult * 2;
            off_ability_div <<= 1;
        }
        if (boosted) {
            PlayEffectAnimation0x1A9__022E617C(attacker);
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C54);
        }
    }

    if (AbilityIsActiveVeneer(attacker, ABILITY_HUSTLE) && not_physical2 == 0) {
        off_ability_mult += off_ability_mult * 2;
        off_ability_div <<= 1;
    }

    is_team_member = !((struct monster *)attacker->info)->is_not_team_member;
    if (AbilityIsActiveVeneer(attacker, ABILITY_PLUS) && not_physical2 == 1
        && DUNGEON_PTR->minus_is_active[is_team_member]) {
        off_ability_mult = off_ability_mult * 16 - off_ability_mult;
        off_ability_div *= 10;
    }
    if (AbilityIsActiveVeneer(attacker, ABILITY_MINUS) && not_physical2 == 1
        && DUNGEON_PTR->plus_is_active[is_team_member]) {
        off_ability_mult = off_ability_mult * 16 - off_ability_mult;
        off_ability_div *= 10;
    }

#ifdef JAPAN
    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_INTIMIDATE)
        && not_physical2 == 0) {
#else
    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_INTIMIDATE, TRUE)
        && not_physical2 == 0) {
#endif
        off_ability_mult <<= 2;
        off_ability_div += off_ability_div * 4;
    }
#ifdef JAPAN
    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_MARVEL_SCALE)
        && not_physical2 == 0) {
#else
    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_MARVEL_SCALE, TRUE)
        && not_physical2 == 0) {
#endif
        info2 = defender->info;
        has_status3 = MonsterHasNegativeStatus(defender, TRUE);
        boosted = UpdateStateFlags(info2, 8, has_status3);
        if (has_status3) {
            def_ability_mult = def_ability_mult * 3;
            def_ability_div <<= 1;
        }
        if (boosted) {
            PlayEffectAnimation0x18E(defender);
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C55);
        }
    }

    pd = &calc[1];
    p = *po * off_ability_mult;
    dv = *pd;
    *pd = dv * def_ability_mult;
    *po2 = p;
    if (off_ability_div != 1) {
        *po2 = p / off_ability_div;
    }
    if (def_ability_div != 1) {
        pd = &calc[1];
        *pd = *pd / def_ability_div;
    }

    diag->offense_calc = calc[0];
    diag->defense_calc = calc[1];
    if (calc[0] < 0) {
        calc[0] = 0;
    }
    if (calc[0] >= 999) {
        calc[0] = 999;
    }
    diag->damage_calc_def = calc[1];
    IntToFixedPoint64(&def_fp, calc[1]);
    IntToFixedPoint64(&tmp2, calc[0] - calc[1]);
    FixedPoint32To64(&tmp, DAMAGE_FORMULA_FLV_DEFICIT_DIVISOR);
    DivideFixedPoint64(&tmp2, &tmp2, &tmp);
    IntToFixedPoint64(&tmp, amon->level);
    AddFixedPoint64(&flv_fp, &tmp, &tmp2);
    IntToFixedPoint64(&tmp, calc[0]);
    AddFixedPoint64(&at_fp, &at_fp, &tmp);
    diag->damage_calc_at = FixedPoint64ToInt(&at_fp);
    diag->attacker_level = amon->level;
    diag->damage_calc_flv = FixedPoint64ToInt(&flv_fp);
    Debug_Print0(ov29_02352984, FixedPoint64ToInt(&flv_fp));
    Debug_Print0(ov29_02352990, FixedPoint64ToInt(&at_fp));
    Debug_Print0(ov29_0235299C, FixedPoint64ToInt(&def_fp));

    FixedPoint32To64(&tmp3, DAMAGE_FORMULA_AT_PREFACTOR);
    MultiplyFixedPoint64(&tmp3, &at_fp, &tmp3);
    FixedPoint32To64(&mult_fp, DAMAGE_FORMULA_DEF_PREFACTOR);
    MultiplyFixedPoint64(&mult_fp, &def_fp, &mult_fp);
    FixedPoint32To64(&scratch, DAMAGE_FORMULA_FLV_SHIFT);
    AddFixedPoint64(&ln_fp, &flv_fp, &scratch);
    FixedPoint32To64(&scratch, DAMAGE_FORMULA_LN_ARG_PREFACTOR);
    MultiplyFixedPoint64(&ln_fp, &ln_fp, &scratch);
    ClampedLn(&ln_fp, FixedPoint64ToInt(&ln_fp));
    FixedPoint32To64(&scratch, DAMAGE_FORMULA_LN_PREFACTOR);
    MultiplyFixedPoint64(&ln_fp, &ln_fp, &scratch);
    AddFixedPoint64(&base, &mult_fp, &tmp3);
    AddFixedPoint64(&base, &base, &ln_fp);
    FixedPoint32To64(&scratch, DAMAGE_FORMULA_CONSTANT_SHIFT);
    AddFixedPoint64(&base, &base, &scratch);

    if (!FixedRoomIsSubstituteRoom() && amon->is_not_team_member) {
        FixedPoint32To64(&scratch, DAMAGE_FORMULA_NON_TEAM_MEMBER_MODIFIER);
        DivideFixedPoint64(&base, &base, &scratch);
    }

    if (FixedPoint64CmpLt(&DAMAGE_FORMULA_MAX_BASE, &base)) {
        base.lower = ((const struct fixed_point_64 *)&ov29_02352838[13])->lower;
        base.upper = ((const struct fixed_point_64 *)&ov29_02352838[13])->upper;
    }
    if (FixedPoint64CmpLt(&base, &DAMAGE_FORMULA_MIN_BASE)) {
        base.lower = ((const struct fixed_point_64 *)&ov29_02352838[17])->lower;
        base.upper = ((const struct fixed_point_64 *)&ov29_02352838[17])->upper;
    }

    type_boosted = CalcTypeBasedDamageEffects(&type_mult, attacker, defender, power, attack_type,
                                         damage_out, IsRegularAttackOrProjectile(move_id) != 0);

    if (attack_type == TYPE_FIRE) {
        flash = FlashFireShouldActivate(attacker, defender);
        if (flash && !dmon->apply_flash_fire_boost && a9) {
            dmon->apply_flash_fire_boost = TRUE;
            SubstitutePlaceholderStringTags(1, defender, 0);
            if (flash == 1) {
                LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C58);
            } else {
                LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C57);
            }
        }
    }

    if (a9 && !ExclusiveItemEffectIsActive__0230A9B8(attacker, EXCLUSIVE_EFF_BYPASS_REFLECT_LIGHT_SCREEN)) {
        if (not_physical == 0) {
            if ((move_id != 0x48 && dmon->reflect_class_status.reflect == 1)
                || ExclusiveItemEffectIsActive__0230A9B8(defender, EXCLUSIVE_EFF_HALVED_PHYSICAL_DAMAGE)) {
                PlayEffectAnimation0x171(defender);
                MultiplyFixedPoint64(&type_mult, &type_mult, &DAMAGE_MULTIPLIER_0_5);
                diag->half_physical_damage_activated = TRUE;
            }
        }
        if (not_physical == 1
            && (dmon->reflect_class_status.reflect == 3
                || ExclusiveItemEffectIsActive__0230A9B8(defender, EXCLUSIVE_EFF_HALVED_SPECIAL_DAMAGE))) {
            PlayEffectAnimation0x171Full(defender);
            MultiplyFixedPoint64(&type_mult, &type_mult, &DAMAGE_MULTIPLIER_0_5);
            diag->half_special_damage_activated = TRUE;
        }
    }

#ifdef JAPAN
    if (dmon->reflect_class_status.reflect != 0x11
        && !DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_BATTLE_ARMOR)
        && !DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_SHELL_ARMOR)
        && !IqSkillIsEnabled(defender, IQ_CRITICAL_DODGER)) {
#else
    if (dmon->reflect_class_status.reflect != 0x11
        && !DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_BATTLE_ARMOR, TRUE)
        && !DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_SHELL_ARMOR, TRUE)
        && !IqSkillIsEnabled(defender, IQ_CRITICAL_DODGER)) {
#endif
        if (GetMonsterGenderVeneer(amon->id) == 2) {
            rate = crit_chance;
        } else {
            rate = crit_chance + crit_chance / 2;
        }
        if (amon->sure_shot_class_status.sure_shot == 4) {
            rate = 999;
            diag->focus_energy_activated = TRUE;
        } else {
            if (ItemIsActive__0230A9DC(attacker, ITEM_SCOPE_LENS)
                || IqSkillIsEnabled(attacker, IQ_SHARPSHOOTER)) {
                diag->scope_lens_or_sharpshooter_activated = TRUE;
                rate += SCOPE_LENS_CRIT_RATE_BOOST;
            }
            if (AbilityIsActiveVeneer(attacker, ABILITY_SUPER_LUCK)) {
                diag->super_luck_activated = TRUE;
                rate += SUPER_LUCK_CRIT_RATE_BOOST;
            }
            if (ItemIsActive__0230A9DC(defender, ITEM_PATSY_BAND)) {
                diag->patsy_band_activated = TRUE;
                rate += SCOPE_LENS_CRIT_RATE_BOOST;
            }
            if (type_boosted && IqSkillIsEnabled(attacker, IQ_TYPE_ADVANTAGE_MASTER)) {
                diag->type_advantage_master_activated = TRUE;
                rate = TYPE_ADVANTAGE_MASTER_CRIT_RATE;
            }
        }
        if (DungeonRandInt(100) < rate
            && !ExclusiveItemEffectIsActiveWithLogging(attacker, defender, TRUE, MESSAGE_DC1, EXCLUSIVE_EFF_NO_CRITICAL_HITS)) {
            damage_out->field_0xe = TRUE;
            if (AbilityIsActiveVeneer(attacker, ABILITY_SNIPER)) {
                MultiplyFixedPoint64(&type_mult, &type_mult, &DAMAGE_MULTIPLIER_2);
                diag->sniper_activated = TRUE;
            } else {
                MultiplyFixedPoint64(&type_mult, &type_mult, &DAMAGE_MULTIPLIER_1_5);
            }
        }
    }

    diag->damage_calc_base = FixedPoint64ToInt(&base);
    MultiplyFixedPoint64(&base, &base, &type_mult);
    diag->static_damage_mult = dmult;
    FixedPoint32To64(&mult32_fp, dmult);
    MultiplyFixedPoint64(&base, &base, &mult32_fp);
    diag->damage_calc = FixedPoint64ToInt(&base);

    type_mult.lower = DungeonRandInt(0x4000);
    type_mult.upper = 0;
    type_mult.lower += 0xE000;
    MultiplyFixedPoint64(&base, &base, &type_mult);
    IntToFixedPoint64(&hundred_fp, 100);
    MultiplyFixedPoint64(&type_mult, &hundred_fp, &type_mult);
    diag->damage_calc_random_mult_pct = FixedPoint64ToInt(&type_mult);
    damage_out->field_0x0 = FixedPoint64ToInt(&base);

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
    dmon->anger_point_flag = damage_out->field_0xe;
}
