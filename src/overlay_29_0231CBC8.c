#include "overlay_29_0231CBC8.h"
#include "dungeon_util_static.h"
#include "dungeon_capabilities_1.h"
#include "dungeon_pokemon_attributes_1.h"
#include "exclusive_item.h"
#include "item_util.h"
#include "main_0200EDC0.h"
#include "move_orb_effects.h"
#include "moves_1.h"
#include "overlay_29_022EAC7C.h"
#include "overlay_29_02344AF8.h"
#include "overlay_29_0234BA54.h"
#include "dungeon_util_2.h"
#include "overlay_29_02345A3C.h"

#ifdef JAPAN
#define MESSAGE_BE6 0x925
#define MESSAGE_BE7 0x926
#define MESSAGE_BE8 0x927
#define MESSAGE_BE9 0x928
#define MESSAGE_C67 0x9A6
#define MESSAGE_C75 0x9B4
#define MESSAGE_C76 0x9B5
#else
#define MESSAGE_BE6 0xBE6
#define MESSAGE_BE7 0xBE7
#define MESSAGE_BE8 0xBE8
#define MESSAGE_BE9 0xBE9
#define MESSAGE_C67 0xC67
#define MESSAGE_C75 0xC75
#define MESSAGE_C76 0xC76
#endif


#ifdef EUROPE
extern void ov29_022FB920(bool8 a);
#endif

extern void LogMessageByIdWithPopupCheckUserTarget(struct entity *user, struct entity *target, u32 message_id);
extern void TryIncreaseHp(struct entity *user, struct entity *target, s32 hp, s32 a, bool8 b);
extern void EndNegativeStatusConditionWrapper(struct entity *user, struct entity *target, bool8 displayMessage, bool8 fromMove);
extern void TryWarp(struct entity *user, struct entity *target, s32 a, s32 b);
extern void BoostIQ(struct entity *entity, s16 iq, bool8 a);
extern void UpdateShopkeeperModeAfterAttack(struct entity *attacker, struct entity *defender);
extern void TryInflictConfusedStatus(struct entity *user, struct entity *target, bool8 a, bool8 b);
extern void TryInflictInvisibleStatus(struct entity *user, struct entity *target);
extern void TryInflictPetrifiedStatus(struct entity *user, struct entity *target);
extern void TryInflictSleeplessStatus(struct entity *user, struct entity *target);
extern s32 CalcStatusDuration(struct entity *entity, const s16 *turn_range, bool8 iq_skill_effects);

extern void CalcDamageFixedNoCategory(struct entity *attacker, struct entity *defender, s16 fixed_damage, s32 a, bool8 *flag, s32 b, s32 damage_source, s32 c, s32 d, s32 e);
extern void DealDamageProjectile(struct entity *attacker, struct entity *defender, struct move *move, s16 power, s32 a, s32 b);
extern void ApplyGummiBoostsDungeonMode(struct entity *user, struct entity *target, s32 type, s16 boost);
extern void TryIncreaseBelly(struct entity *user, struct entity *target, s32 a, s32 b, s32 c);
extern void LevelUpItemEffect(struct entity *user, struct entity *target, s32 a, s32 b, s32 c);
extern void RestoreAllMovePP(struct entity *user, struct entity *target, s32 a, s32 b);
extern void TryInflictSleepStatus(struct entity *user, struct entity *target, s32 turns, bool8 a);
extern void TryInflictBlinkerStatus(struct entity *user, struct entity *target, bool8 a, bool8 b);
extern void TryInflictCrossEyedStatus(struct entity *user, struct entity *target, bool8 a);
extern void TryDecreaseLevel(struct entity *user, struct entity *target, s32 a);
extern void ApplyProteinEffect(struct entity *user, struct entity *target, s16 boost);
extern void ApplyCalciumEffect(struct entity *user, struct entity *target, s16 boost);
extern void ApplyIronEffect(struct entity *user, struct entity *target, s16 boost);
extern void ApplyZincEffect(struct entity *user, struct entity *target, s16 boost);
extern void ApplyBlastSeedEffect(struct entity *user, struct entity *target, char a);
extern void ApplyCheriBerryEffect(struct entity *user, struct entity *target);
extern void ApplyPechaBerryEffect(struct entity *user, struct entity *target);
extern void ApplyRawstBerryEffect(struct entity *user, struct entity *target);
extern void ApplyHungerSeedEffect(struct entity *user, struct entity *target);
extern void ApplyGinsengEffect(struct entity *user, struct entity *target);
extern void ApplyVileSeedEffect(struct entity *user, struct entity *target);
extern void ApplyViolentSeedEffect(struct entity *user, struct entity *target);
extern void ApplyGrimyFoodEffect(struct entity *user, struct entity *target);
extern void ApplyMixElixirEffect(struct entity *user, struct entity *target);
extern void ApplyDoughSeedEffect(struct entity *user, struct entity *target);
extern void ApplyViaSeedEffect(struct entity *user, struct entity *target);
extern void ApplyGravelyrockEffect(struct entity *user, struct entity *target);
extern void ApplyGonePebbleEffect(struct entity *user, struct entity *target);
extern void ApplyGracideaEffect(struct entity *user, struct entity *target);
extern void TryInflictDropeyeStatus(struct entity *user, struct entity *target);
extern void TryInflictEyedropStatus(struct entity *user, struct entity *target);
extern bool8 TryInflictSlipStatus(struct entity *user, struct entity *target);
extern void ov29_022E5A00(struct entity *entity, struct item *item);
extern void ov29_022E5AE4(struct entity *entity, struct item *item);
extern void ov29_0230F9A4(struct entity *entity, struct item *item);
extern bool8 ov29_022FB9BC(struct entity *entity);
extern void ov29_022F9EA0(struct entity *entity);
extern void EnemyEvolution(struct entity *entity);
extern bool8 AddHeldItemToBag(struct monster *monster);
extern void ApplyKeyEffect(struct entity *entity);

extern const s16 STICK_POWER;
extern const s16 IRON_THORN_POWER;
extern const s16 SILVER_SPIKE_POWER;
extern const s16 GOLD_FANG_POWER;
extern const s16 CACNEA_SPIKE_POWER;
extern const s16 CORSOLA_TWIG_POWER;
extern const s16 GOLD_THORN_POWER;
extern const s16 GEO_PEBBLE_DAMAGE;
extern const s16 GRAVELEROCK_DAMAGE;
extern const s16 RARE_FOSSIL_DAMAGE;
extern const s16 OREN_BERRY_DAMAGE;
extern const s16 ORAN_BERRY_HP_RESTORATION;
extern const s16 ORAN_BERRY_FULL_HP_BOOST;
extern const s16 SITRUS_BERRY_HP_RESTORATION;
extern const s16 SITRUS_BERRY_FULL_HP_BOOST;
extern const s16 LIFE_SEED_HP_BOOST;
extern const s16 PROTEIN_STAT_BOOST;
extern const s16 CALCIUM_STAT_BOOST;
extern const s16 IRON_STAT_BOOST;
extern const s16 ZINC_STAT_BOOST;
extern const s16 GUMMI_STAT_BOOST;
extern const s16 WONDER_GUMMI_STAT_BOOST;
extern const s16 ov10_022C44EC;
extern const s16 ov10_022C4558;
extern const s16 ov10_022C4574;
extern const s32 ov10_022C4864;
extern const s16 SLEEP_TURN_RANGE[];
extern const s16 APPLES_AND_BERRIES_ITEM_IDS[];

void ApplyItemEffect(char param_1, u8 param_2, u8 param_3,
                     struct entity *attacker, struct entity *defender,
                     struct item *item)
{
    if (param_1 != 0 && param_2 == 0) {
        struct monster *monster = GetEntInfo(defender);
        bool8 flag = FALSE;

        if (ov29_022FB9BC(defender)) {
            SpawnDroppedItemWrapper(attacker, &defender->pos, item, 0);
            return;
        }
        if (monster->is_not_team_member) {
            if (GetItemCategoryVeneer(item->id) != CATEGORY_THROWN_LINE &&
                GetItemCategoryVeneer(item->id) != CATEGORY_BERRIES_SEEDS_VITAMINS &&
                GetItemCategoryVeneer(item->id) != CATEGORY_THROWN_ARC) {
                flag = TRUE;
            }
            if (GetItemCategoryVeneer(item->id) == CATEGORY_HELD_ITEMS &&
                item->id >= ITEM_A_STONE && item->id <= ITEM_QUESTION_STONE) {
                flag = FALSE;
            }
        } else if (GetItemCategoryVeneer(item->id) != CATEGORY_BERRIES_SEEDS_VITAMINS) {
            flag = IqSkillIsEnabled(defender, IQ_ITEM_CATCHER);
        }
        if (CheckVariousConditions__0230156C(defender)) {
            flag = FALSE;
        }
        if (flag) {
            if (!ItemExists(monster->held_item.flags)) {
                if (monster->is_not_team_member || !IsBagFull()) {
                    if (monster->shopkeeper == SHOPKEEPER_MODE_SHOPKEEPER) {
                        SpawnDroppedItemWrapper(attacker, &defender->pos, item, 0);
                        return;
                    }
                    PlaySeByIdIfNotSilence(0x1317);
                    PrepareItemForPrinting__02345728(0, item);
                    SubstitutePlaceholderStringTags(0, defender, 0);
                    LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_BE6);
                    monster->held_item = *item;
                    if (!monster->is_not_team_member) {
                        AddHeldItemToBag(monster);
                    }
                    ov29_022F9EA0(defender);
                    return;
                }
            }
        }
    }
    if (param_1) {
        ov29_022E5A00(defender, item);
        UpdateShopkeeperModeAfterAttack(attacker, defender);
    }
    if (ItemSticky(item->flags)) {
        PrepareItemForPrinting__02345728(0, item);
        LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_BE7);
        if (param_1) {
            bool8 b;
            CalcDamageFixedNoCategory(attacker, defender, ov10_022C4574, 1, &b, 0,
                                      DAMAGE_SOURCE_THROWN_ITEM, 0, 0, 0);
            EnemyEvolution(attacker);
            return;
        }
    }
    if (!param_1) {
        ov29_022E5AE4(defender, item);
    }
    ov29_0230F9A4(attacker, item);
    if (GetItemCategoryVeneer(item->id) == CATEGORY_BERRIES_SEEDS_VITAMINS) {
        TryIncreaseBelly(attacker, defender, 5, 0, 0);
    }
    if (GetItemCategoryVeneer(item->id) == CATEGORY_TMS_HMS ||
        GetItemCategoryVeneer(item->id) == CATEGORY_LINK_BOX) {
        if (param_1) {
            bool8 b;
            CalcDamageFixedNoCategory(attacker, defender, ov10_022C4558, 1, &b, 0,
                                      DAMAGE_SOURCE_THROWN_ITEM, 0, 0, 0);
        } else {
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_BE8);
        }
    } else {
        switch (item->id) {
        case ITEM_STICK: {
            struct move move;

            InitMove(&move, MOVE_PROJECTILE);
            DealDamageProjectile(attacker, defender, &move, STICK_POWER, 0x100, ITEM_STICK);
            break;
        }
        case ITEM_IRON_THORN: {
            struct move move;

            InitMove(&move, MOVE_PROJECTILE);
            DealDamageProjectile(attacker, defender, &move, IRON_THORN_POWER, 0x100, ITEM_IRON_THORN);
            break;
        }
        case ITEM_SILVER_SPIKE: {
            struct move move;

            InitMove(&move, MOVE_PROJECTILE);
            DealDamageProjectile(attacker, defender, &move, SILVER_SPIKE_POWER, 0x100, ITEM_SILVER_SPIKE);
            break;
        }
        case ITEM_GOLD_FANG: {
            struct move move;

            InitMove(&move, MOVE_PROJECTILE);
            DealDamageProjectile(attacker, defender, &move, GOLD_FANG_POWER, 0x100, ITEM_GOLD_FANG);
            break;
        }
        case ITEM_CACNEA_SPIKE: {
            struct move move;

            InitMove(&move, MOVE_PROJECTILE);
            DealDamageProjectile(attacker, defender, &move, CACNEA_SPIKE_POWER, 0x100, ITEM_CACNEA_SPIKE);
            break;
        }
        case ITEM_CORSOLA_TWIG: {
            struct move move;

            InitMove(&move, MOVE_PROJECTILE);
            DealDamageProjectile(attacker, defender, &move, CORSOLA_TWIG_POWER, 0x100, ITEM_CORSOLA_TWIG);
            break;
        }
        case ITEM_GEO_PEBBLE:
            CalcDamageFixedNoCategory(attacker, defender, GEO_PEBBLE_DAMAGE, 1, NULL, 0, DAMAGE_SOURCE_THROWN_ROCK, 0, 0, 0);
            break;
        case ITEM_GRAVELEROCK:
            CalcDamageFixedNoCategory(attacker, defender, GRAVELEROCK_DAMAGE, 1, NULL, 0, DAMAGE_SOURCE_THROWN_ROCK, 0, 0, 0);
            break;
        case ITEM_GOLD_THORN: {
            struct move move;

            InitMove(&move, MOVE_PROJECTILE);
            DealDamageProjectile(attacker, defender, &move, GOLD_THORN_POWER, 0x100, ITEM_GOLD_THORN);
            break;
        }
        case ITEM_RARE_FOSSIL:
            CalcDamageFixedNoCategory(attacker, defender, RARE_FOSSIL_DAMAGE, 1, NULL, 0, DAMAGE_SOURCE_THROWN_ROCK, 0, 0, 0);
            break;
        case ITEM_HEAL_SEED:
            EndNegativeStatusConditionWrapper(attacker, defender, TRUE, param_3);
            break;
        case ITEM_ORAN_BERRY:
            TryIncreaseHp(attacker, defender, ORAN_BERRY_HP_RESTORATION, ORAN_BERRY_FULL_HP_BOOST, TRUE);
            break;
        case ITEM_SITRUS_BERRY:
            TryIncreaseHp(attacker, defender, SITRUS_BERRY_HP_RESTORATION, SITRUS_BERRY_FULL_HP_BOOST, TRUE);
            break;
        case ITEM_LIFE_SEED:
            TryIncreaseHp(attacker, defender, 0, LIFE_SEED_HP_BOOST, TRUE);
            break;
        case ITEM_BLINKER_SEED:
            TryInflictBlinkerStatus(attacker, defender, FALSE, FALSE);
            break;
        case ITEM_X_EYE_SEED:
            TryInflictCrossEyedStatus(attacker, defender, FALSE);
            break;
        case ITEM_QUICK_SEED:
            BoostSpeedOneStage(attacker, defender, 0, TRUE);
            break;
        case ITEM_EYEDROP_SEED:
            TryInflictEyedropStatus(attacker, defender);
            break;
        case ITEM_TOTTER_SEED:
            TryInflictConfusedStatus(attacker, defender, TRUE, FALSE);
            break;
        case ITEM_CHERI_BERRY:
            ApplyCheriBerryEffect(attacker, defender);
            break;
        case ITEM_PECHA_BERRY:
            ApplyPechaBerryEffect(attacker, defender);
            break;
        case ITEM_WARP_SEED:
            TryWarp(attacker, defender, 0, 0);
            break;
        case ITEM_SLEEP_SEED:
            TryInflictSleepStatus(attacker, defender, CalcStatusDuration(defender, SLEEP_TURN_RANGE, TRUE), TRUE);
            break;
        case ITEM_CHESTO_BERRY:
            TryInflictSleeplessStatus(attacker, defender);
            break;
        case ITEM_JOY_SEED:
            LevelUpItemEffect(attacker, defender, 1, 1, 1);
            break;
        case ITEM_DOOM_SEED:
            TryDecreaseLevel(attacker, defender, 1);
            break;
        case ITEM_STUN_SEED:
            TryInflictPetrifiedStatus(attacker, defender);
            break;
        case ITEM_PLAIN_SEED:
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_BE9);
            break;
        case ITEM_RAWST_BERRY:
            ApplyRawstBerryEffect(attacker, defender);
            break;
        case ITEM_HUNGER_SEED:
            ApplyHungerSeedEffect(attacker, defender);
            break;
        case ITEM_GINSENG:
            ApplyGinsengEffect(attacker, defender);
            break;
        case ITEM_BLAST_SEED:
            ApplyBlastSeedEffect(attacker, defender, param_1);
            break;
    case ITEM_MAX_ELIXIR:
        RestoreAllMovePP(attacker, defender, 999, 0);
        break;
    case ITEM_PROTEIN:
        ApplyProteinEffect(attacker, defender, PROTEIN_STAT_BOOST);
        break;
    case ITEM_CALCIUM:
        ApplyCalciumEffect(attacker, defender, CALCIUM_STAT_BOOST);
        break;
    case ITEM_IRON:
        ApplyIronEffect(attacker, defender, IRON_STAT_BOOST);
        break;
    case ITEM_ZINC:
        ApplyZincEffect(attacker, defender, ZINC_STAT_BOOST);
        break;
    case ITEM_GABITE_SCALE:
        EndNegativeStatusConditionWrapper(attacker, defender, TRUE, FALSE);
        break;
    case ITEM_GOLDEN_SEED:
        LevelUpItemEffect(attacker, defender, 5, 1, 1);
        break;
    case ITEM_VILE_SEED:
        ApplyVileSeedEffect(attacker, defender);
        break;
    case ITEM_PURE_SEED:
        TryWarp(attacker, defender, 4, 0);
        break;
    case ITEM_VIOLENT_SEED:
        ApplyViolentSeedEffect(attacker, defender);
        break;
    case ITEM_VANISH_SEED:
        TryInflictInvisibleStatus(attacker, defender);
        break;
    case ITEM_NECTAR:
        BoostIQ(defender, 10, FALSE);
        break;
    case ITEM_APPLE:
        TryIncreaseBelly(attacker, defender, 50, 5, 1);
        break;
    case ITEM_BIG_APPLE:
        TryIncreaseBelly(attacker, defender, 100, 10, 1);
        break;
    case ITEM_HUGE_APPLE:
        TryIncreaseBelly(attacker, defender, 999, 10, 1);
        break;
    case ITEM_GRIMY_FOOD:
        ApplyGrimyFoodEffect(attacker, defender);
        break;
    case ITEM_WHITE_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, TYPE_NORMAL, GUMMI_STAT_BOOST);
        break;
    case ITEM_RED_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, TYPE_FIRE, GUMMI_STAT_BOOST);
        break;
    case ITEM_BLUE_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, TYPE_WATER, GUMMI_STAT_BOOST);
        break;
    case ITEM_GRASS_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, TYPE_GRASS, GUMMI_STAT_BOOST);
        break;
    case ITEM_YELLOW_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, TYPE_ELECTRIC, GUMMI_STAT_BOOST);
        break;
    case ITEM_CLEAR_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, TYPE_ICE, GUMMI_STAT_BOOST);
        break;
    case ITEM_ORANGE_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, TYPE_FIGHTING, GUMMI_STAT_BOOST);
        break;
    case ITEM_PINK_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, TYPE_POISON, GUMMI_STAT_BOOST);
        break;
    case ITEM_BROWN_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, TYPE_GROUND, GUMMI_STAT_BOOST);
        break;
    case ITEM_SKY_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, TYPE_FLYING, GUMMI_STAT_BOOST);
        break;
    case ITEM_GOLD_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, TYPE_PSYCHIC, GUMMI_STAT_BOOST);
        break;
    case ITEM_GREEN_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, TYPE_BUG, GUMMI_STAT_BOOST);
        break;
    case ITEM_GRAY_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, TYPE_ROCK, GUMMI_STAT_BOOST);
        break;
    case ITEM_PURPLE_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, TYPE_GHOST, GUMMI_STAT_BOOST);
        break;
    case ITEM_ROYAL_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, TYPE_DRAGON, GUMMI_STAT_BOOST);
        break;
    case ITEM_BLACK_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, TYPE_DARK, GUMMI_STAT_BOOST);
        break;
    case ITEM_SILVER_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, TYPE_STEEL, GUMMI_STAT_BOOST);
        break;
    case ITEM_WONDER_GUMMI:
        ApplyGummiBoostsDungeonMode(attacker, defender, 0xFF, WONDER_GUMMI_STAT_BOOST);
        break;
    case ITEM_UNNAMED_0x71:
        TryIncreaseBelly(attacker, defender, 50, 5, 1);
        break;
    case ITEM_UNNAMED_0x72:
        TryIncreaseBelly(attacker, defender, 10, 0, 1);
        break;
    case ITEM_GOLDEN_APPLE:
        TryIncreaseBelly(attacker, defender, 999, 50, 1);
        break;
    case ITEM_KEY:
        if (param_1) {
            bool8 flag;
            CalcDamageFixedNoCategory(attacker, defender, ov10_022C4558, 1, &flag, 0,
                                      DAMAGE_SOURCE_THROWN_ITEM, 0, 0, 0);
        }
        else {
            ApplyKeyEffect(attacker);
        }
        break;
    case ITEM_DROPEYE_SEED:
        TryInflictDropeyeStatus(attacker, defender);
        break;
case ITEM_SLIP_SEED:
    if (!TryInflictSlipStatus(attacker, defender)) {
        SubstitutePlaceholderStringTags(0, defender, 0);
        LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C75);
    }
    break;
case ITEM_VIA_SEED:
    ApplyViaSeedEffect(attacker, defender);
    break;
case ITEM_MIX_ELIXIR:
    ApplyMixElixirEffect(attacker, defender);
    break;
case ITEM_OREN_BERRY:
    CalcDamageFixedNoCategory(attacker, defender, OREN_BERRY_DAMAGE, 1, NULL, 0,
                              DAMAGE_SOURCE_OREN_BERRY, 0, 0, 0);
    break;
case ITEM_DOUGH_SEED:
    ApplyDoughSeedEffect(attacker, defender);
    break;
case ITEM_GRAVELYROCK:
    ApplyGravelyrockEffect(attacker, defender);
    break;
case ITEM_GONE_PEBBLE:
    ApplyGonePebbleEffect(attacker, defender);
    break;
case ITEM_WANDER_GUMMI:
    TryInflictBlinkerStatus(attacker, defender, 0, 0);
    break;
case ITEM_PRIZE_TICKET:
    if (param_1) {
        bool8 flag;
        CalcDamageFixedNoCategory(attacker, defender, ov10_022C4558, 1, &flag, 0,
                                  DAMAGE_SOURCE_THROWN_ITEM, 0, 0, 0);
    } else {
        SubstitutePlaceholderStringTags(0, defender, 0);
        LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C67);
    }
    break;
case ITEM_SILVER_TICKET:
    if (param_1) {
        bool8 flag;
        CalcDamageFixedNoCategory(attacker, defender, ov10_022C4558, 1, &flag, 0,
                                  DAMAGE_SOURCE_THROWN_ITEM, 0, 0, 0);
    } else {
        SubstitutePlaceholderStringTags(0, defender, 0);
        LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C67);
    }
    break;
case ITEM_GOLD_TICKET:
    if (param_1) {
        bool8 flag;
        CalcDamageFixedNoCategory(attacker, defender, ov10_022C4558, 1, &flag, 0,
                                  DAMAGE_SOURCE_THROWN_ITEM, 0, 0, 0);
    } else {
        SubstitutePlaceholderStringTags(0, defender, 0);
        LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C67);
    }
    break;
case ITEM_PRISM_TICKET:
    if (param_1) {
        bool8 flag;
        CalcDamageFixedNoCategory(attacker, defender, ov10_022C4558, 1, &flag, 0,
                                  DAMAGE_SOURCE_THROWN_ITEM, 0, 0, 0);
    } else {
        SubstitutePlaceholderStringTags(0, defender, 0);
        LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C67);
    }
    break;
case ITEM_SKY_GIFT:
    if (param_1) {
        bool8 flag;
        CalcDamageFixedNoCategory(attacker, defender, ov10_022C4558, 1, &flag, 0,
                                  DAMAGE_SOURCE_THROWN_ITEM, 0, 0, 0);
    } else {
        LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_C76);
    }
    break;
case ITEM_GRACIDEA:
    ApplyGracideaEffect(attacker, defender);
    break;
    case ITEM_UNNAMED_0x16B:
        break;
    case ITEM_A_STONE:
    case ITEM_B_STONE:
    case ITEM_C_STONE:
    case ITEM_D_STONE:
    case ITEM_E_STONE:
    case ITEM_F_STONE:
    case ITEM_G_STONE:
    case ITEM_H_STONE:
    case ITEM_I_STONE:
    case ITEM_J_STONE:
    case ITEM_K_STONE:
    case ITEM_L_STONE:
    case ITEM_M_STONE:
    case ITEM_N_STONE:
    case ITEM_O_STONE:
    case ITEM_P_STONE:
    case ITEM_Q_STONE:
    case ITEM_R_STONE:
    case ITEM_S_STONE:
    case ITEM_T_STONE:
    case ITEM_U_STONE:
    case ITEM_V_STONE:
    case ITEM_W_STONE:
    case ITEM_X_STONE:
    case ITEM_Y_STONE:
    case ITEM_Z_STONE:
    case ITEM_EXCLAMATION_STONE:
    case ITEM_QUESTION_STONE:
    if (param_1) {
        bool8 flag;
        CalcDamageFixedNoCategory(attacker, defender, ov10_022C44EC, 1, &flag, 0,
                                  DAMAGE_SOURCE_THROWN_ITEM, 0, 0, 0);
    } else {
        LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_BE8);
    }
    break;
    case ITEM_NOTHING:
    default:
        if (param_1) {
            bool8 flag;
            CalcDamageFixedNoCategory(attacker, defender, ov10_022C4558, 1, &flag, 0, DAMAGE_SOURCE_THROWN_ITEM, 0, 0, 0);
        }
        else {
            LogMessageByIdWithPopupCheckUserTarget(attacker, defender, MESSAGE_BE8);
        }
        break;
    }
    }

    if (EntityIsValid__0231CBC8(defender)) {
        struct monster *info = GetEntInfo(defender);
        s16 id = item->id;
        bool8 active;

        if (!info->is_not_team_member)
            active = ExclusiveItemEffectFlagTest(info->exclusive_item_effect_flags, EXCLUSIVE_EFF_RECOVER_HP_FROM_APPLES_AND_BERRIES);
        else
            active = FALSE;

        if (active) {
            const s16 *p;

            for (p = APPLES_AND_BERRIES_ITEM_IDS; *p != 0; p++) {
                if (id == *p) {
                    WaitUntilAlertBoxPauseIsOver(10);
                    TryIncreaseHp(attacker, defender, ov10_022C4864, 0, TRUE);
                    break;
                }
            }
        }
    }

#ifdef EUROPE
    ov29_022FB920(TRUE);
#endif
    EnemyEvolution(attacker);
}

bool8 EntityIsValid__0231CBC8(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}
