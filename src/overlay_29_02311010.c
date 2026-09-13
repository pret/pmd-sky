#include "overlay_29_02311010.h"
#include "dungeon_items.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "exclusive_item.h"
#include "dg_random.h"
#include "dungeon_capabilities.h"
#include "dungeon_capabilities_1.h"
#include "dungeon_capabilities_3.h"
#include "dungeon_logic.h"
#include "dungeon_logic_3.h"
#include "dungeon_map_access_1.h"
#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_util_1.h"
#include "move_orb_effects.h"
#include "moves_1.h"
#include "number_util.h"
#include "overlay_29_022EAC7C.h"
#include "overlay_29_02318A4C.h"
#include "overlay_29_0233836C.h"
#include "overlay_29_0234B024.h"
#include "weather.h"
#include "dungeon_util_2.h"
#include "overlay_29_022EC7E8.h"
#include "overlay_29_023061A8.h"
#include "overlay_29_022E99F0.h"
#include "overlay_29_02305C04.h"
#include "overlay_29_022E4338.h"
#include "overlay_29_0231B194.h"
#include "overlay_29_0234B104.h"
#include "overlay_29_023350D8.h"

extern s16 ov10_022C4BE4[20];
extern void ov29_0230FB30(struct entity *entity);

#ifdef JAPAN
#define MESSAGE_DE6 0xB26
#define MESSAGE_DE7 0xB27
#define MESSAGE_DE8 0xB28
#define MESSAGE_DE9 0xB29
#define MESSAGE_DEA 0xB2A
#define MESSAGE_DBD 0xAFD
#define MESSAGE_DEB 0xB2B
#define MESSAGE_DEC 0xB2C
#define MESSAGE_CBA 0x9FA
#else
#define MESSAGE_DE6 0xDE6
#define MESSAGE_DE7 0xDE7
#define MESSAGE_DE8 0xDE8
#define MESSAGE_DE9 0xDE9
#define MESSAGE_DEA 0xDEA
#define MESSAGE_DBD 0xDBD
#define MESSAGE_DEB 0xDEB
#define MESSAGE_DEC 0xDEC
#define MESSAGE_CBA 0xCBA
#endif


#ifdef EUROPE

extern bool8 ov29_022E34A8_EU(struct entity *entity);
#endif

extern void ApplyDamageAndEffectsWrapper(struct entity *entity, s32 damage, s32 a, s32 b);
extern bool8 TryEndPetrifiedOrSleepStatus(struct entity *user, struct entity *target);
extern bool8 ExclusiveItemEffectIsActiveWithLogging(struct entity *user, struct entity *target, bool8 should_log, s32 message_id, enum exclusive_item_effect_id effect_id);
extern void TryIncreaseHp(struct entity *user, struct entity *target, s32 hp, s32 a, bool8 b);
extern void TryWarp(struct entity *user, struct entity *target, s32 a, s32 b);
extern void MultiplyFixedPoint64(struct fixed_point_64 *out, const struct fixed_point_64 *a, const struct fixed_point_64 *b);
extern void ov29_022EA370(s32 a, s32 b);
extern s32 ov29_022F2FE4();

extern void EnsureCanStandCurrentTile(struct entity *entity);
extern void ov29_022E543C(struct entity *entity);
extern void ov29_022E53F0(struct entity *entity);
extern void ov29_022F42F8(struct entity *entity);
extern void EndMagnetRiseStatus(struct entity *user, struct entity *target);
extern void ov29_022EC62C(struct entity *entity);
extern void ov29_022FB718(struct entity *entity);
extern s32 EndNegativeStatusCondition(struct entity *user, struct entity *target, bool8 a, bool8 b, bool8 c);
extern s32 DisplayActions(s32 a);
extern s32 ov29_02322374(struct entity *entity, s32 a, s32 b, s32 c, s32 d, struct move *move);

extern struct dungeon *DUNGEON_PTR;
extern const s16 ov10_022C4BBC[20];
extern struct fixed_point_64 ov10_022C4FC4[];
extern s32 ov10_022C4A5C[];
extern const s16 BAD_WEATHER_DAMAGE;
extern const s16 SHED_SKIN_ACTIVATION_CHANCE;
extern const s16 SPEED_BOOST_TURNS;
extern const s16 BURN_DAMAGE_COOLDOWN;
extern const s16 BURN_DAMAGE;
extern const s16 ov10_022C4664;
extern const s16 ov10_022C464C;
extern const s16 POISON_DAMAGE_COOLDOWN;
extern const s16 POISON_DAMAGE;
extern const s16 BAD_POISON_DAMAGE_COOLDOWN;
extern const s16 BAD_POISON_DAMAGE_TABLE[30];
extern const s16 ov10_022C4454;
extern const s16 CONSTRICTION_DAMAGE;
extern const s16 WRAP_DAMAGE_COOLDOWN;
extern const s16 WRAP_DAMAGE;
extern const s16 INGRAIN_BONUS_REGEN_COOLDOWN;
extern const s16 INGRAIN_BONUS_REGEN;
extern const s16 CURSE_DAMAGE_COOLDOWN;
extern const s16 LEECH_SEED_DAMAGE_COOLDOWN;
extern const s16 LEECH_SEED_HP_DRAIN;

void TickNoSlipCap(struct entity *entity)
{
    struct monster *monster;
    bool8 has_no_slip_cap;

    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        has_no_slip_cap = FALSE;
    else
        has_no_slip_cap = HasHeldItem(entity, ITEM_NO_SLIP_CAP);

    if (!has_no_slip_cap)
        return;

    monster = entity->info;
    if (monster->is_not_team_member)
        return;

    monster->no_slip_cap_counter++;
    if (monster->no_slip_cap_counter >= 20)
        monster->no_slip_cap_counter = 19;

    if (DungeonRandInt(100) < ov10_022C4BE4[monster->no_slip_cap_counter]) {
        ov29_0230FB30(entity);
        monster->no_slip_cap_counter = 0;
    }
}

void ActivateEndOfTurnEffects(struct entity *entity)
{
    s32 v1;
    s32 v2;
    s32 v3;
    s32 v4;
    s32 v5;
    s32 v6;
    s32 v7;
    s32 v8;
    s32 v9;
    struct fixed_point_64 f2;
    struct fixed_point_64 f1;
    struct fixed_point f3;
    struct entity *e1;
    s16 i;
    struct monster *monster;
    bool8 b1;
    bool8 b2;
    struct monster *mon1;
    struct move mv;

    if (entity == NULL)
        return;
    if (!EntityIsValid__02311010(entity))
        return;
    if (IsFloorOver())
        return;
    monster = entity->info;
    monster->famished = FALSE;
    ov29_022FB718(entity);
    WaitUntilAlertBoxTextIsLoadedWrapper();
    TryWeatherFormChange(entity);
    if (ItemIsActive__02311034(entity, ITEM_WARP_SCARF)) {
        monster->field_0x17c++;
        if (monster->field_0x17c >= 20)
            monster->field_0x17c = 19;
        if (DungeonRandInt(100) < ov10_022C4BBC[monster->field_0x17c]) {
            monster->field_0x17c = 0;
            ov29_022EC62C(entity);
            DisplayActions(0);
            if (!EntityIsValid__02311010(entity))
                return;
            if (IsFloorOver())
                return;
            TryWarp(entity, entity, 0, 0);
            ov29_022F42F8(entity);
        }
    }
    if (monster->is_team_leader) {
        v1 = 10;
        v1 -= ItemIsActive__02311034(entity, ITEM_TIGHT_BELT) ? 10 : 0;
        v1 -= ItemIsActive__02311034(entity, ITEM_STAMINA_BAND) != 0;
        if (IqSkillIsEnabled(entity, IQ_ENERGY_SAVER))
            v1--;
        v1 += ItemIsActive__02311034(entity, ITEM_DIET_RIBBON) != 0;
        v1 += ItemIsActive__02311034(entity, ITEM_HEAL_RIBBON) != 0;
        v1 += ItemIsActive__02311034(entity, ITEM_MUNCH_BELT) != 0;
        v1 += AbilityIsActiveVeneer(entity, ABILITY_GLUTTONY) != 0;
        if (v1 < 0)
            v1 = 0;
        if (v1 > 19)
            v1 = 19;
        f1.upper = 0;
        f1.lower = 0x199A;
        MultiplyFixedPoint64(&f2, &f1, &ov10_022C4FC4[v1]);
        if (monster->rollout_hit_counter > 1)
            f2.lower += ov10_022C4A5C[monster->rollout_hit_counter] << 16;
        monster->rollout_hit_counter = 0;
        f3 = monster->belly;
        monster->belly = SubFixedPoint(monster->belly, BinToDecFixedPoint(&f2));
        v2 = 0;
        v3 = 1;
        if (CeilFixedPoint(f3) >= 20 && CeilFixedPoint(monster->belly) < 20)
            v2 = MESSAGE_DE6;
        if (CeilFixedPoint(f3) >= 10 && CeilFixedPoint(monster->belly) < 10)
            v2 = MESSAGE_DE7;
        if (CeilFixedPoint(monster->belly) == 0)
            monster->belly = sub_02050FF8(0);
        if (CeilFixedPoint(monster->belly) < 0)
            monster->belly = sub_02050FF8(0);
        if (CeilFixedPoint(monster->belly) == 0) {
            ov29_022F2FE4();
            ov29_022EC62C(entity);
            DisplayActions(0);
            if (!EntityIsValid__02311010(entity))
                return;
            if (IsFloorOver())
                return;
            if (DUNGEON_PTR->leader_hunger_message_tracker < 10)
                DUNGEON_PTR->leader_hunger_message_tracker++;
            if (DUNGEON_PTR->leader_hunger_message_tracker == 1)
                v2 = MESSAGE_DE8;
            if (DUNGEON_PTR->leader_hunger_message_tracker == 2) {
                v2 = MESSAGE_DE9;
                v3 = 0;
            }
            if (DUNGEON_PTR->leader_hunger_message_tracker == 3) {
                v2 = MESSAGE_DEA;
                v3 = 0;
            }
            TryEndPetrifiedOrSleepStatus(entity, entity);
            ApplyDamageAndEffectsWrapper(entity, 1, 0xE, DAMAGE_SOURCE_HUNGER);
            monster->famished = TRUE;
            if (CeilFixedPoint(monster->belly) != 0)
                v2 = 0;
        } else {
            DUNGEON_PTR->leader_hunger_message_tracker = 0;
        }
        if (v2 != 0) {
#if defined(EUROPE)
            if (v3 != 0 && ov29_022E34A8_EU(entity))
#elif defined(JAPAN)
            if (v3 != 0 && EntityIsValid__02311010(entity))
#else
            if (v3 != 0 && !DUNGEON_PTR->end_floor_no_death_check_flag &&
                EntityIsValid__02311010(entity))
#endif
            {
                PlaySeByIdIfNotSilence(0x1303);
            }
            LogMessageByIdWithPopupCheckUser(entity, v2);
            ov29_022EA370(0x1E, 0x32);
        }
    }

    if (!EntityIsValid__02311010(entity))
        return;
    if (IsFloorOver())
        return;
    if (DUNGEON_PTR->weather.weather_damage_counter == 0) {
        if (GetApparentWeather(entity) == WEATHER_HAIL) {
            if (!AbilityIsActiveVeneer(entity, ABILITY_SNOW_CLOAK) &&
                !AbilityIsActiveVeneer(entity, ABILITY_ICE_BODY) &&
                !MonsterIsType(entity, TYPE_ICE) &&
                !ExclusiveItemEffectIsActiveWithLogging(entity, entity, TRUE, MESSAGE_DBD,
                                                        EXCLUSIVE_EFF_NO_WEATHER_DAMAGE)) {
                ApplyDamageAndEffectsWrapper(entity, BAD_WEATHER_DAMAGE, 0x12, DAMAGE_SOURCE_WEATHER);
            }
        } else if (GetApparentWeather(entity) == WEATHER_SANDSTORM) {
            if (!AbilityIsActiveVeneer(entity, ABILITY_SAND_VEIL) &&
                !MonsterIsType(entity, TYPE_GROUND) &&
                !MonsterIsType(entity, TYPE_ROCK) &&
                !MonsterIsType(entity, TYPE_STEEL) &&
                !ExclusiveItemEffectIsActiveWithLogging(entity, entity, TRUE, MESSAGE_DBD,
                                                        EXCLUSIVE_EFF_NO_WEATHER_DAMAGE)) {
                ApplyDamageAndEffectsWrapper(entity, BAD_WEATHER_DAMAGE, 0x12, DAMAGE_SOURCE_WEATHER);
            }
        } else if (GetApparentWeather(entity) == WEATHER_SUNNY) {
            if (AbilityIsActiveVeneer(entity, ABILITY_SOLAR_POWER)) {
                if (!ExclusiveItemEffectIsActiveWithLogging(entity, entity, TRUE, MESSAGE_DBD,
                                                            EXCLUSIVE_EFF_NO_WEATHER_DAMAGE)) {
                    SetPreprocessorArgsIdVal(2, ABILITY_SOLAR_POWER);
                    ApplyDamageAndEffectsWrapper(entity, BAD_WEATHER_DAMAGE, 0x19,
                                                 DAMAGE_SOURCE_WEATHER);
                }
            } else if (AbilityIsActiveVeneer(entity, ABILITY_DRY_SKIN)) {
                if (!ExclusiveItemEffectIsActiveWithLogging(entity, entity, TRUE, MESSAGE_DBD,
                                                            EXCLUSIVE_EFF_NO_WEATHER_DAMAGE)) {
                    SetPreprocessorArgsIdVal(2, ABILITY_DRY_SKIN);
                    ApplyDamageAndEffectsWrapper(entity, BAD_WEATHER_DAMAGE, 0x1A,
                                                 DAMAGE_SOURCE_WEATHER);
                }
            }
        }
        if (!EntityIsValid__02311010(entity))
            return;
        if (IsFloorOver())
            return;
    }
    v4 = DungeonRandInt(100);
    if (AbilityIsActiveVeneer(entity, ABILITY_SHED_SKIN) &&
        v4 < SHED_SKIN_ACTIVATION_CHANCE &&
        MonsterHasNegativeStatus(entity, FALSE)) {
        DisplayActions(0);
        if (!EntityIsValid__02311010(entity))
            return;
        if (IsFloorOver())
            return;
        EndNegativeStatusConditionWrapper(entity, entity, TRUE, FALSE);
    }
    if (AbilityIsActiveVeneer(entity, ABILITY_HYDRATION) &&
        GetApparentWeather(entity) == WEATHER_RAIN &&
        MonsterHasNegativeStatus(entity, FALSE) &&
        monster->frozen_class_status.freeze != STATUS_FROZEN_WRAP) {
        DisplayActions(0);
        if (!EntityIsValid__02311010(entity))
            return;
        if (IsFloorOver())
            return;
        EndNegativeStatusCondition(entity, entity, TRUE, FALSE, FALSE);
    }

    if (AbilityIsActiveVeneer(entity, ABILITY_SPEED_BOOST)) {
        monster->field_0x11f++;
        if (monster->field_0x11f >= SPEED_BOOST_TURNS) {
            monster->field_0x11f = 0;
            BoostSpeedOneStage(entity, entity, 0x7f, FALSE);
        }
    }

    if (monster->sleep_class_status.sleep == STATUS_SLEEP_YAWNING) {
        DisplayActions(0);
        if (!EntityIsValid__02311010(entity))
            return;
        if (IsFloorOver())
            return;
        ov29_022E53F0(entity);
    }

    if (monster->burn_class_status.burn == STATUS_BURN_BURN) {
        if (monster->burn_class_status.burn_damage_countdown != 0)
            monster->burn_class_status.burn_damage_countdown--;
        if (monster->burn_class_status.burn_damage_countdown == 0) {
            DisplayActions(0);
            if (!EntityIsValid__02311010(entity))
                return;
            if (IsFloorOver())
                return;
            monster->burn_class_status.burn_damage_countdown = BURN_DAMAGE_COOLDOWN;
            TryEndPetrifiedOrSleepStatus(entity, entity);
            ApplyDamageAndEffectsWrapper(entity, BURN_DAMAGE, 1, DAMAGE_SOURCE_BURN);
        }
        if (!EntityIsValid__02311010(entity))
            return;
        if (IsFloorOver())
            return;
    }

    if (GravityIsActive()) {
        if (IsFloating(entity)) {
            EndMagnetRiseStatus(entity, entity);
            EnsureCanStandCurrentTile(entity);
        }
        if (!EntityIsValid__02311010(entity))
            return;
        if (IsFloorOver())
            return;
    }

    if (AbilityIsActiveVeneer(entity, ABILITY_BAD_DREAMS)) {
        TryActivateBadDreams(entity);
        if (!EntityIsValid__02311010(entity))
            return;
        if (IsFloorOver())
            return;
    }

    if (!IsTileGround(GetTileAtEntity(entity))) {
        v5 = monster->max_hp_stat + monster->max_hp_boost;
        if (v5 > MAX_HP_LIMIT)
            v5 = MAX_HP_LIMIT;
        if (monster->hp < v5 &&
            ExclusiveItemEffectIsActive__02311064(entity, EXCLUSIVE_EFF_RECOVER_HP_FROM_WATERY_TERRAIN)) {
            TryIncreaseHp(entity, entity, ov10_022C4664, 0, FALSE);
        }
        if (ExclusiveItemEffectIsActive__02311064(entity, EXCLUSIVE_EFF_HEAL_STATUS_FROM_WATERY_TERRAIN))
            EndNegativeStatusConditionWrapper(entity, entity, TRUE, TRUE);
    }

    if (ExclusiveItemEffectIsActive__02311064(entity, EXCLUSIVE_EFF_ABSORB_TEAMMATE_POISON)) {
        b1 = FALSE;
        for (i = 0; i < 4; i++) {
            e1 = DUNGEON_PTR->monster_slot_ptrs[i];
            if (EntityIsValid__02311010(e1)) {
                mon1 = e1->info;
                if (mon1->burn_class_status.burn == STATUS_BURN_POISONED
                    || mon1->burn_class_status.burn == STATUS_BURN_BADLY_POISONED) {
                    ov29_022E543C(e1);
                    EndBurnClassStatus(e1, e1);
                    b1 = TRUE;
                }
            }
        }

        if (b1)
            TryIncreaseHp(entity, entity, ov10_022C464C, 0, TRUE);
    }

    if (monster->burn_class_status.burn == STATUS_BURN_POISONED) {
        if (monster->burn_class_status.burn_damage_countdown != 0)
            monster->burn_class_status.burn_damage_countdown--;

        if (monster->burn_class_status.burn_damage_countdown == 0) {
            DisplayActions(0);

            if (!EntityIsValid__02311010(entity))
                return;
            if (IsFloorOver() || monster->burn_class_status.burn != STATUS_BURN_POISONED)
                return;

            monster->burn_class_status.burn_damage_countdown = POISON_DAMAGE_COOLDOWN;
            TryEndPetrifiedOrSleepStatus(entity, entity);

            if (AbilityIsActiveVeneer(entity, ABILITY_POISON_HEAL))
                TryIncreaseHp(entity, entity, POISON_DAMAGE, 0, TRUE);
            else
                ApplyDamageAndEffectsWrapper(entity, POISON_DAMAGE, 3, DAMAGE_SOURCE_POISON);
        }

        if (!EntityIsValid__02311010(entity))
            return;
        if (IsFloorOver())
            return;
    } else if (monster->burn_class_status.burn == STATUS_BURN_BADLY_POISONED) {
        if (monster->burn_class_status.burn_damage_countdown != 0)
            monster->burn_class_status.burn_damage_countdown--;

        if (monster->burn_class_status.burn_damage_countdown == 0) {
            v6 = monster->burn_class_status.badly_poisoned_damage_count;

            if (monster->burn_class_status.badly_poisoned_damage_count < 0x1d)
                monster->burn_class_status.badly_poisoned_damage_count++;

            monster->burn_class_status.burn_damage_countdown = BAD_POISON_DAMAGE_COOLDOWN;

            if (v6 >= 0x1d)
                v6 = 0x1d;
            if (v6 < 0)
                v6 = 0;

            DisplayActions(0);

            if (!EntityIsValid__02311010(entity))
                return;
            if (IsFloorOver() || monster->burn_class_status.burn != STATUS_BURN_BADLY_POISONED)
                return;

            TryEndPetrifiedOrSleepStatus(entity, entity);

            if (AbilityIsActiveVeneer(entity, ABILITY_POISON_HEAL))
                TryIncreaseHp(entity, entity, BAD_POISON_DAMAGE_TABLE[v6], 0, TRUE);
            else
                ApplyDamageAndEffectsWrapper(entity, BAD_POISON_DAMAGE_TABLE[v6], 3,
                                             DAMAGE_SOURCE_POISON);
        }

        if (!EntityIsValid__02311010(entity))
            return;
        if (IsFloorOver())
            return;
    }

    if (monster->frozen_class_status.freeze == STATUS_FROZEN_CONSTRICTION) {
        if (monster->frozen_class_status.freeze_damage_countdown != 0)
            monster->frozen_class_status.freeze_damage_countdown--;
        if (monster->frozen_class_status.freeze_damage_countdown == 0) {
            DisplayActions(0);
            if (!EntityIsValid__02311010(entity))
                return;
            if (IsFloorOver())
                return;
            monster->frozen_class_status.freeze_damage_countdown = ov10_022C4454;
            TryEndPetrifiedOrSleepStatus(entity, entity);
            PlayEffectAnimationEntityStandard(entity, monster->frozen_class_status.constriction_animation);
            ApplyDamageAndEffectsWrapper(entity, CONSTRICTION_DAMAGE, 2, DAMAGE_SOURCE_CONSTRICTION);
        }
        if (!EntityIsValid__02311010(entity))
            return;
        if (IsFloorOver())
            return;
    } else if (monster->frozen_class_status.freeze == STATUS_FROZEN_WRAPPED) {
        if (monster->frozen_class_status.freeze_damage_countdown != 0)
            monster->frozen_class_status.freeze_damage_countdown--;
        if (monster->frozen_class_status.freeze_damage_countdown == 0) {
            DisplayActions(0);
            if (!EntityIsValid__02311010(entity))
                return;
            if (IsFloorOver())
                return;
            monster->frozen_class_status.freeze_damage_countdown = WRAP_DAMAGE_COOLDOWN;
            TryEndPetrifiedOrSleepStatus(entity, entity);
            ApplyDamageAndEffectsWrapper(entity, WRAP_DAMAGE, 5, DAMAGE_SOURCE_WRAP);
        }
        if (!EntityIsValid__02311010(entity))
            return;
        if (IsFloorOver())
            return;
    } else if (monster->frozen_class_status.freeze == STATUS_FROZEN_INGRAIN) {
        if (monster->frozen_class_status.freeze_damage_countdown != 0)
            monster->frozen_class_status.freeze_damage_countdown--;
        if (monster->frozen_class_status.freeze_damage_countdown == 0) {
            DisplayActions(0);
            if (!EntityIsValid__02311010(entity))
                return;
            if (IsFloorOver())
                return;
            monster->frozen_class_status.freeze_damage_countdown = INGRAIN_BONUS_REGEN_COOLDOWN;
            TryIncreaseHp(entity, entity, INGRAIN_BONUS_REGEN, 0, TRUE);
        }
    }

    if (monster->curse_class_status.curse == STATUS_CURSE_CURSED) {
        if (monster->curse_class_status.curse_damage_countdown != 0)
            monster->curse_class_status.curse_damage_countdown--;

        if (monster->curse_class_status.curse_damage_countdown == 0) {
            v7 = monster->max_hp_stat + monster->max_hp_boost;
            if (v7 > MAX_HP_LIMIT)
                v7 = MAX_HP_LIMIT;
            v8 = v7 / 4;
            if (v8 == 0)
                v8++;

            monster->curse_class_status.curse_damage_countdown = CURSE_DAMAGE_COOLDOWN;
            DisplayActions(0);
            if (!EntityIsValid__02311010(entity))
                return;
            if (IsFloorOver())
                return;

            TryEndPetrifiedOrSleepStatus(entity, entity);
            ApplyDamageAndEffectsWrapper(entity, v8, 7, DAMAGE_SOURCE_CURSE);
        }

        if (!EntityIsValid__02311010(entity))
            return;
        if (IsFloorOver())
            return;
    }

    if (monster->leech_seed_class_status.leech_seed == STATUS_LEECH_SEED_LEECH_SEED) {
        if (monster->leech_seed_class_status.leech_seed_damage_countdown != 0)
            monster->leech_seed_class_status.leech_seed_damage_countdown--;

        if (monster->leech_seed_class_status.leech_seed_damage_countdown == 0) {
            e1 = DUNGEON_PTR->active_monster_ptrs[monster->leech_seed_class_status.leech_seed_source_monster_index];
            v9 = LEECH_SEED_HP_DRAIN;

            monster->leech_seed_class_status.leech_seed_damage_countdown = LEECH_SEED_DAMAGE_COOLDOWN;
            if (e1 == NULL) {
                monster->leech_seed_class_status.leech_seed = STATUS_LEECH_SEED_NONE;
            } else if (monster->leech_seed_class_status.statuses_applier_id != GetEntInfo(e1)->unique_id) {
                monster->leech_seed_class_status.leech_seed = STATUS_LEECH_SEED_NONE;
            } else {
                if (e1 != entity &&
                    (e1 == NULL ? FALSE : (bool8)(GetEntityType(e1) == ENTITY_MONSTER)) &&
                    AbilityIsActiveVeneer(e1, ABILITY_MOLD_BREAKER))
                    b2 = FALSE;
                else
                    b2 = AbilityIsActiveVeneer(entity, ABILITY_LIQUID_OOZE);

                ov29_022EC62C(entity);
                DisplayActions(0);
                if (!EntityIsValid__02311010(entity))
                    return;
                if (!EntityIsValid__02311010(e1))
                    return;
                if (IsFloorOver())
                    return;

                if (monster->frozen_class_status.freeze != STATUS_FROZEN_FROZEN) {
                    TryEndPetrifiedOrSleepStatus(entity, entity);
                    ApplyDamageAndEffectsWrapper(entity, v9, 9, DAMAGE_SOURCE_LEECH_SEED);
                    if (b2) {
                        TryEndPetrifiedOrSleepStatus(e1, e1);
                        ApplyDamageAndEffectsWrapper(e1, v9, 0xD, DAMAGE_SOURCE_SLUDGE);
                    } else if (!AbilityIsActiveVeneer(entity, ABILITY_MAGIC_GUARD)) {
                        TryIncreaseHp(e1, e1, v9, 0, TRUE);
                    }
                }
            }
        }

        if (!EntityIsValid__02311010(entity))
            return;
        if (IsFloorOver())
            return;
    }

    if (monster->perish_song_turns != 0) {
        TickStatusTurnCounter(&monster->perish_song_turns);
        if (monster->perish_song_turns == 0) {
            DisplayActions(0);
            if (!EntityIsValid__02311010(entity))
                return;
            if (IsFloorOver())
                return;
            SubstitutePlaceholderStringTags(1, entity, 0);
            LogMessageByIdWithPopupCheckUser(entity, MESSAGE_DEB);
            TryEndPetrifiedOrSleepStatus(entity, entity);
            if (monster->reflect_class_status.reflect == STATUS_REFLECT_PROTECT) {
                LogMessageByIdWithPopupCheckUser(entity, MESSAGE_DEC);
            } else {
                ApplyDamageAndEffectsWrapper(entity, 9999, 0xB, DAMAGE_SOURCE_PERISH_SONG);
            }
            if (!EntityIsValid__02311010(entity))
                return;
            if (IsFloorOver())
                return;
        }
    }
    if (monster->bide_class_status.bide == STATUS_TWO_TURN_BIDE) {
        TickStatusTurnCounter(&monster->bide_class_status.bide_turns);
        if (monster->bide_class_status.bide_turns == 0) {
            monster->bide_class_status.bide = STATUS_TWO_TURN_NONE;
            if (!CheckVariousStatuses2__02301244(entity, FALSE) &&
                !MonsterCannotAttack(entity, FALSE) &&
                !CheckVariousStatuses__023016DC(entity)) {
                DisplayActions(0);
                if (monster->bide_move_id == MOVE_NOTHING)
                    monster->bide_move_id = MOVE_BIDE_UNLEASH;
                InitMove(&mv, monster->bide_move_id);
                mv.flags0 |= MOVE_FLAG_LAST_USED;
                ov29_02322374(entity, 0, 0, 0, 0, &mv);
                monster->bide_move_id = MOVE_NOTHING;
                if (!EntityIsValid__02311010(entity))
                    return;
                if (IsFloorOver())
                    return;
                monster->bide_damage_tally = 0;
            }
        }
    }
    if (!EntityIsValid__02311010(entity))
        return;
    if (IsFloorOver())
        return;
    if (monster->bide_class_status.bide == STATUS_TWO_TURN_ENRAGED) {
        TickStatusTurnCounter(&monster->bide_class_status.bide_turns);
        if (monster->bide_class_status.bide_turns == 0) {
            monster->bide_class_status.bide = STATUS_TWO_TURN_NONE;
            monster->using_charged_move = FALSE;
            SubstitutePlaceholderStringTags(0, entity, 0);
            LogMessageByIdWithPopupCheckUser(entity, MESSAGE_CBA);
        }
    }
    if (!EntityIsValid__02311010(entity))
        return;
    if (IsFloorOver())
        return;
    TickNoSlipCap(entity);
}

bool8 EntityIsValid__02311010(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

bool8 ItemIsActive__02311034(struct entity *entity, enum item_id item_id)
{
    if (AbilityIsActiveVeneer(entity, ABILITY_KLUTZ))
        return FALSE;

    return HasHeldItem(entity, item_id);
}

bool8 ExclusiveItemEffectIsActive__02311064(struct entity *entity, enum exclusive_item_effect_id effect_id)
{
    struct monster *monster = GetEntInfo(entity);
    if (!monster->is_not_team_member)
        return ExclusiveItemEffectFlagTest(monster->exclusive_item_effect_flags, effect_id);

    return FALSE;
}
