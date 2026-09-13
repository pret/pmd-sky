#include "type_effectiveness.h"
#include "dungeon_logic_3.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util_static.h"
#include "main_02001BB4.h"
#include "main_02001CD4.h"
#include "move_orb_effects.h"
#include "overlay_29_0230A994.h"
#include "overlay_29_0230AB58.h"
#include "overlay_29_02318A4C.h"
#include "overlay_29_0233836C.h"
#include "type_matchup_table.h"
#include "weather.h"
#include "overlay_29_0234B340.h"
#include "overlay_29_0234B104.h"

extern struct dungeon *DUNGEON_PTR;

extern bool8 UpdateStateFlags(struct monster *info, s32 flag, bool8 value);
extern void MultiplyFixedPoint64(struct fixed_point_64 *out, const struct fixed_point_64 *a, const struct fixed_point_64 *b);
extern bool8 GhostImmunityIsActive(struct entity *attacker, struct entity *defender, s16 target_type_idx);
extern bool8 IsTypeIneffectiveAgainstGhost(enum type_id type);
extern void PlayEffectAnimation0x1A9__022E61C8(struct entity *entity);
extern void PlayEffectAnimation0x1A9__022E6214(struct entity *entity);
extern void PlayEffectAnimation0x1A9__022E64C4(struct entity *entity);
extern void PlayEffectAnimation0x1A9__022E6510(struct entity *entity);

extern const s32 ov29_02352838[];
extern const struct fixed_point_64 DAMAGE_MULTIPLIER_0_5;
extern const struct fixed_point_64 DAMAGE_MULTIPLIER_1_5;
extern const struct fixed_point_64 DAMAGE_MULTIPLIER_2;
extern const struct fixed_point_64 CLOUDY_DAMAGE_MULTIPLIER;
extern const struct fixed_point_64 SOLID_ROCK_MULTIPLIER;
extern const s32 MATCHUP_IMMUNE_MULTIPLIER;
extern const s32 MATCHUP_NOT_VERY_EFFECTIVE_MULTIPLIER;
extern const s32 MATCHUP_NEUTRAL_MULTIPLIER;
extern const s32 MATCHUP_SUPER_EFFECTIVE_MULTIPLIER;
extern const s32 MATCHUP_IMMUNE_MULTIPLIER_ERRATIC_PLAYER;
extern const s32 MATCHUP_NOT_VERY_EFFECTIVE_MULTIPLIER_ERRATIC_PLAYER;
extern const s32 MATCHUP_NEUTRAL_MULTIPLIER_ERRATIC_PLAYER;
extern const s32 MATCHUP_SUPER_EFFECTIVE_MULTIPLIER_ERRATIC_PLAYER;
extern const s32 TINTED_LENS_MULTIPLIER;
extern const s32 BURN_DAMAGE_MULTIPLIER;
extern const s16 TECHNICIAN_MOVE_POWER_THRESHOLD;
extern const s32 TYPE_MATCHUP_COMBINATOR_TABLE[4][4];

#ifdef JAPAN
#define MESSAGE_C3E 0x97D
#define MESSAGE_C4F 0x98E
#define MESSAGE_C50 0x98F
#define MESSAGE_C51 0x990
#define MESSAGE_C52 0x991
#else
#define MESSAGE_C3E 0xC3E
#define MESSAGE_C4F 0xC4F
#define MESSAGE_C50 0xC50
#define MESSAGE_C51 0xC51
#define MESSAGE_C52 0xC52
#endif

s16 GetTypeMatchup(struct entity *attacker, struct entity *defender, s16 target_type_idx, enum type_id attack_type)
{
    struct monster *defender_monster = GetEntInfo(defender);
    if ((defender_monster->miracle_eye == 1 || ExclusiveItemEffectIsActive__0230A9B8(attacker, EXCLUSIVE_EFF_MIRACLE_EYE)) && attack_type == TYPE_PSYCHIC && defender_monster->types[target_type_idx] == TYPE_DARK)
        return MATCHUP_NEUTRAL;

    if (attack_type == TYPE_GROUND)
    {
        if (GravityIsActive())
        {
            if (defender_monster->types[target_type_idx] == TYPE_FLYING)
                return MATCHUP_NEUTRAL;
        }
        else if (IsFloating(defender))
            return MATCHUP_IMMUNE;
    }

    return TYPE_MATCHUP_TABLE.matchups[attack_type][defender_monster->types[target_type_idx]];
}

int CalcTypeBasedDamageEffects(struct fixed_point_64 *out, struct entity *attacker,
                               struct entity *defender, s32 power,
                               enum type_id attack_type,
                               struct unk_02308FE0 *damage_data, bool8 is_projectile)
{
    struct fixed_point_64 fparr[4];
    struct fixed_point_64 fp1;
    s32 arr[2];
    struct monster *mon1;
    enum weather_id weather;
    s16 v1;
    bool8 f1;
    bool8 f2;
    s32 result;
    s32 i;
    s32 v2;
    s32 v3;
    bool8 f3;
    bool8 f4;

    mon1 = GetEntInfo(attacker);
    arr[0] = ov29_02352838[7];
    arr[1] = ov29_02352838[8];
    IntToFixedPoint64(out, 1);
    v1 = FALSE;
    damage_data->field_0xe = FALSE;
    damage_data->field_0xf = FALSE;
    if (!EntityIsValid__02308FBC(defender)) {
        return TRUE;
    }

    f1 = IsTypeIneffectiveAgainstGhost(attack_type);
#ifdef JAPAN
    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_WONDER_GUARD)
        && attack_type != TYPE_NONE) {
#else
    if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_WONDER_GUARD, TRUE)
        && attack_type != TYPE_NONE) {
#endif
        v1 = TRUE;
    }
    damage_data->field_0x8 = MATCHUP_NEUTRAL;
    f2 = ScrappyShouldActivate(attacker, defender, attack_type);

    for (i = 0; i < 2; i++) {
        if (!is_projectile
            && (IqSkillIsEnabled(attacker, IQ_ERRATIC_PLAYER)
                || IqSkillIsEnabled(defender, IQ_ERRATIC_PLAYER))) {
            FixedPoint32To64(&fparr[0], MATCHUP_IMMUNE_MULTIPLIER_ERRATIC_PLAYER);
            FixedPoint32To64(&fparr[1], MATCHUP_NOT_VERY_EFFECTIVE_MULTIPLIER_ERRATIC_PLAYER);
            FixedPoint32To64(&fparr[2], MATCHUP_NEUTRAL_MULTIPLIER_ERRATIC_PLAYER);
            FixedPoint32To64(&fparr[3], MATCHUP_SUPER_EFFECTIVE_MULTIPLIER_ERRATIC_PLAYER);
        } else {
            FixedPoint32To64(&fparr[0], MATCHUP_IMMUNE_MULTIPLIER);
            FixedPoint32To64(&fparr[1], MATCHUP_NOT_VERY_EFFECTIVE_MULTIPLIER);
            FixedPoint32To64(&fparr[2], MATCHUP_NEUTRAL_MULTIPLIER);
            FixedPoint32To64(&fparr[3], MATCHUP_SUPER_EFFECTIVE_MULTIPLIER);
        }
        if (FixedPoint64IsZero(out)) {
            break;
        }
        if (!f2 && f1
            && GhostImmunityIsActive(attacker, defender, i)) {
            DUNGEON_PTR->last_damage_calc.ghost_immunity_activated = TRUE;
            v2 = MATCHUP_IMMUNE;
        } else {
            v2 = GetTypeMatchup(attacker, defender, i, attack_type);
        }
        if (IqSkillIsEnabled(attacker, IQ_ERRATIC_PLAYER)) {
            MultiplyFixedPoint64(out, out, &fparr[v2]);
        } else if (v2 != MATCHUP_NEUTRAL) {
            MultiplyFixedPoint64(out, out, &fparr[v2]);
        }
        arr[i] = v2;
    }

    DUNGEON_PTR->last_damage_calc.move_indiv_type_matchups[0] = (enum type_matchup)arr[0];
    DUNGEON_PTR->last_damage_calc.move_indiv_type_matchups[1] = (enum type_matchup)arr[1];
    v2 = TYPE_MATCHUP_COMBINATOR_TABLE[arr[0]][arr[1]];
    damage_data->field_0x8 = v2;
    if (v2 == MATCHUP_SUPER_EFFECTIVE) {
        result = TRUE;
    } else {
        result = FALSE;
        if (v1) {
            *out = *(const struct fixed_point_64 *)&ov29_02352838[15];
        }
    }

    if (AbilityIsActiveVeneer(attacker, ABILITY_TINTED_LENS)
        && damage_data->field_0x8 == MATCHUP_NOT_VERY_EFFECTIVE) {
        FixedPoint32To64(&fp1, TINTED_LENS_MULTIPLIER);
        MultiplyFixedPoint64(out, out, &fp1);
    }

#ifdef JAPAN
    if ((DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_SOLID_ROCK)
         || DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_FILTER))
        && damage_data->field_0x8 == MATCHUP_SUPER_EFFECTIVE) {
#else
    if ((DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_SOLID_ROCK, TRUE)
         || DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_FILTER, TRUE))
        && damage_data->field_0x8 == MATCHUP_SUPER_EFFECTIVE) {
#endif
        MultiplyFixedPoint64(out, out, &SOLID_ROCK_MULTIPLIER);
    }

    if (ExclusiveItemEffectIsActive__0230A9B8(defender, EXCLUSIVE_EFF_HALVED_DAMAGE)) {
        MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_0_5);
    }

    if (!is_projectile && AbilityIsActiveVeneer(attacker, ABILITY_TECHNICIAN)
        && power <= TECHNICIAN_MOVE_POWER_THRESHOLD) {
        MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_1_5);
        LogMessageByIdWithPopupCheckParticipants(attacker, defender, MESSAGE_C3E, 2, ABILITY_TECHNICIAN);
    }

#ifdef JAPAN
    if ((attack_type == TYPE_FIRE || attack_type == TYPE_ICE)
        && DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_THICK_FAT)) {
#else
    if ((attack_type == TYPE_FIRE || attack_type == TYPE_ICE)
        && DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_THICK_FAT, TRUE)) {
#endif
        DUNGEON_PTR->last_damage_calc.fire_move_ability_drop_activated = TRUE;
        MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_0_5);
    }

    if (attack_type == TYPE_FIRE && FlashFireShouldActivate(attacker, defender) != FLASH_FIRE_STATUS_NONE) {
        DUNGEON_PTR->last_damage_calc.flash_fire_activated = TRUE;
        IntToFixedPoint64(out, 0);
        result = FALSE;
        damage_data->field_0x8 = MATCHUP_IMMUNE;
        damage_data->field_0xe = FALSE;
        damage_data->field_0xf = TRUE;
    }

#ifdef JAPAN
    if (attack_type == TYPE_FIRE
        && DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_HEATPROOF)) {
#else
    if (attack_type == TYPE_FIRE
        && DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_HEATPROOF, TRUE)) {
#endif
        DUNGEON_PTR->last_damage_calc.fire_move_ability_drop_activated = TRUE;
        MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_0_5);
    }

    if (attack_type == TYPE_GROUND
        && ((!AbilityIsActiveVeneer(attacker, ABILITY_MOLD_BREAKER) && LevitateIsActive(defender))
            || IsFloating(defender))) {
        DUNGEON_PTR->last_damage_calc.levitate_activated = TRUE;
        IntToFixedPoint64(out, 0);
        result = FALSE;
        damage_data->field_0x8 = MATCHUP_IMMUNE;
        damage_data->field_0xe = FALSE;
        damage_data->field_0xf = TRUE;
    }

    if (attack_type == TYPE_WATER && AbilityIsActiveVeneer(attacker, ABILITY_TORRENT)) {
        v3 = MIN(mon1->max_hp_stat + mon1->max_hp_boost, MAX_HP_LIMIT);
        f3 = v3 / 4 >= mon1->hp;
        f4 = UpdateStateFlags(mon1, 0x80, f3);
        if (f3) {
            DUNGEON_PTR->last_damage_calc.torrent_boost_activated = TRUE;
            MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_2);
        }
        if (f4) {
            PlayEffectAnimation0x1A9__022E6214(attacker);
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C4F);
        }
    }

    if (attack_type == TYPE_GRASS && AbilityIsActiveVeneer(attacker, ABILITY_OVERGROW)) {
        v3 = MIN(mon1->max_hp_stat + mon1->max_hp_boost, MAX_HP_LIMIT);
        f3 = v3 / 4 >= mon1->hp;
        f4 = UpdateStateFlags(mon1, 2, f3);
        if (f3) {
            DUNGEON_PTR->last_damage_calc.overgrow_boost_activated = TRUE;
            MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_2);
        }
        if (f4) {
            PlayEffectAnimation0x1A9__022E61C8(attacker);
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C50);
        }
    }

    if (attack_type == TYPE_BUG && AbilityIsActiveVeneer(attacker, ABILITY_SWARM)) {
        v3 = MIN(mon1->max_hp_stat + mon1->max_hp_boost, MAX_HP_LIMIT);
        f3 = v3 / 4 >= mon1->hp;
        f4 = UpdateStateFlags(mon1, 0x10, f3);
        if (f3) {
            DUNGEON_PTR->last_damage_calc.swarm_boost_activated = TRUE;
            MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_2);
        }
        if (f4) {
            PlayEffectAnimation0x1A9__022E64C4(attacker);
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C51);
        }
    }

    if (attack_type == TYPE_FIRE) {
        if (AbilityIsActiveVeneer(attacker, ABILITY_BLAZE)) {
            v3 = MIN(mon1->max_hp_stat + mon1->max_hp_boost, MAX_HP_LIMIT);
            f3 = v3 / 4 >= mon1->hp;
            f4 = UpdateStateFlags(mon1, 0x20, f3);
            if (f3) {
                DUNGEON_PTR->last_damage_calc.fire_move_ability_boost_activated = TRUE;
                MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_2);
            }
            if (f4) {
                PlayEffectAnimation0x1A9__022E6510(attacker);
                LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C52);
            }
        }
#ifdef JAPAN
        if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_DRY_SKIN)) {
#else
        if (DefenderAbilityIsActive__0230A940(attacker, defender, ABILITY_DRY_SKIN, TRUE)) {
#endif
            DUNGEON_PTR->last_damage_calc.fire_move_ability_boost_activated = TRUE;
            MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_1_5);
        }
    }

    if (mon1->burn_class_status.burn == STATUS_BURN_BURN) {
        FixedPoint32To64(&fp1, BURN_DAMAGE_MULTIPLIER);
        MultiplyFixedPoint64(out, out, &fp1);
    }

    if (!FixedPoint64IsZero(out) && MonsterIsType(attacker, attack_type)) {
        DUNGEON_PTR->last_damage_calc.stab_boost_activated = TRUE;
        if (AbilityIsActiveVeneer(attacker, ABILITY_ADAPTABILITY)) {
            MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_2);
        } else {
            MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_1_5);
        }
    }

    weather = GetApparentWeather(attacker);
    if (weather == WEATHER_SUNNY) {
        if (attack_type == TYPE_FIRE) {
            DUNGEON_PTR->last_damage_calc.sunny_multiplier_activated = TRUE;
            MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_1_5);
        } else if (attack_type == TYPE_WATER) {
            DUNGEON_PTR->last_damage_calc.sunny_multiplier_activated = TRUE;
            MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_0_5);
        }
    }

    if (weather == WEATHER_RAIN) {
        if (attack_type == TYPE_FIRE) {
            DUNGEON_PTR->last_damage_calc.rain_multiplier_activated = TRUE;
            MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_0_5);
        } else if (attack_type == TYPE_WATER) {
            DUNGEON_PTR->last_damage_calc.rain_multiplier_activated = TRUE;
            MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_1_5);
        }
    }

    if (weather == WEATHER_CLOUDY && attack_type != TYPE_NORMAL) {
        MultiplyFixedPoint64(out, out, &CLOUDY_DAMAGE_MULTIPLIER);
        DUNGEON_PTR->last_damage_calc.cloudy_drop_activated = TRUE;
    }

    if ((DUNGEON_PTR->weather.mud_sport_turns != 0 || weather == WEATHER_FOG)
        && attack_type == TYPE_ELECTRIC) {
        DUNGEON_PTR->last_damage_calc.electric_move_dampened = TRUE;
        MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_0_5);
    }

    if (DUNGEON_PTR->weather.water_sport_turns != 0 && attack_type == TYPE_FIRE) {
        DUNGEON_PTR->last_damage_calc.water_sport_drop_activated = TRUE;
        MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_0_5);
    }

    if (attack_type == TYPE_ELECTRIC
        && mon1->bide_class_status.bide == STATUS_TWO_TURN_CHARGING) {
        DUNGEON_PTR->last_damage_calc.charge_boost_activated = TRUE;
        MultiplyFixedPoint64(out, out, &DAMAGE_MULTIPLIER_2);
    }

    return result;
}
