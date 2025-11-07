#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "overlay_29_023118B4.h"
#include "move_orb_effects_1.h"
#include "overlay_29_02311BF8.h"
#include "overlay_29_023018AC.h"
#include "math.h"
#include "dungeon_util.h"
#include "exclusive_item.h"

extern u8* AllocateTemp1024ByteBufferFromPool(void);
extern void CopyStringFromId(u8* buf, u32 string_id);
extern void SetMessageLogPreprocessorArgsString(u32 a, u8 *buf);
extern bool8 IsProtectedFromStatDrops(struct entity *user, struct entity *target, bool8 logMsg);
extern void SubstitutePlaceholderStringTags(int a, struct entity *entity, u32 param_3);
extern void PlayOffensiveStatUpEffect(struct entity *user, struct StatIndex);
extern void PlayDefensiveStatDownEffect(struct entity *user, struct StatIndex);
extern void PlayDefensiveStatUpEffect(struct entity *user, struct StatIndex);
extern void PlayOffensiveStatDownEffect(struct entity *user, struct StatIndex);
extern void PlayOffensiveStatMultiplierDownEffect(struct entity *user, struct StatIndex);
extern void PlayOffensiveStatMultiplierUpEffect(struct entity *user, struct StatIndex);
extern void PlayDefensiveStatMultiplierDownEffect(struct entity *user, struct StatIndex);
extern void PlayDefensiveStatMultiplierUpEffect(struct entity *user, struct StatIndex);
extern void PlayHitChanceUpEffect(struct entity *user, struct StatIndex);
extern void PlayHitChanceDownEffect(struct entity *user, struct StatIndex);
extern void LogMessageByIdWithPopupCheckUserTarget(struct entity *user, struct entity *target, u32 message_id);
extern void UpdateStatusIconFlags(struct entity *);
extern void ov29_022E4338(struct entity *);
extern void PlayCringeExclamationPointEffect(struct entity *);
extern void PlayParalysisEffect(struct entity *);
extern void PlaySpeedUpEffect(struct entity *);
extern void PlaySpeedDownEffect(struct entity *);
extern fx32_8 MultiplyByFixedPoint(fx32_8 a, fx32_8 b);
extern bool8 IsProtectedFromNegativeStatus(struct entity *user ,struct entity *target, bool8 displayMessage);
extern bool8 SafeguardIsActive(struct entity *user ,struct entity *target, bool8 displayMessage);
extern void TryActivateSteadfast(struct entity *user ,struct entity *target);
extern void TryActivateQuickFeet(struct entity *user ,struct entity *target);
extern s32 CalcStatusDuration(struct entity *target, const s16 *turnRange, bool8 factorCurerSkills);
extern struct tile* GetTile(int x, int y);
extern bool8 GetExclusiveItemWithEffectFromBag(struct entity *, enum exclusive_item_effect_id effect_id, struct item *);
extern struct preprocessor_args* GetMessageLogPreprocessorArgs(void);
extern void SetPreprocessorArgsStringToName(struct preprocessor_args* preprocessor_args, u8 pos,struct monster* monster, u8 param_4, u8 name_type);
extern void PrepareItemForPrinting__02345728(u8, struct item*);
extern int CalcSpeedStageWrapper(struct entity* entity);
extern int CalcSpeedStage(struct entity *, int);

extern const s16 gCringeTurnRange[];
extern const s16 gParalysisTurnRange[];
extern const s16 gSpeedLowerTurnRange[];
extern const s16 SPEED_BOOST_TURN_RANGE[];
extern const u16 ov29_02353318[];

#ifdef JAPAN
#define JPN_MSG_OFFSET -0x2C0
#else
#define JPN_MSG_OFFSET 0
#endif // JAPAN

void LowerOffensiveStat(struct entity *user, struct entity *target, struct StatIndex stat, s32 nStagesRaw, bool8 checkProtected, bool8 logMsgProtected)
{
    struct monster *entityInfo;
    u8 *buffer1 = AllocateTemp1024ByteBufferFromPool();
    u8 *buffer2 = AllocateTemp1024ByteBufferFromPool();
    s16 nStages = nStagesRaw;
    s32 newStage;

    if (!EntityIsValid__023118B4(target))
        return;

    if (stat.id != STAT_INDEX_PHYSICAL) {
        CopyStringFromId(buffer1, 0xdcb + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }
    else {
        CopyStringFromId(buffer1, 0xdca + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }

    if (checkProtected) {
        if (IsProtectedFromStatDrops(user, target, logMsgProtected))
            return;

        if (ItemIsActive__02311BF8(target, ITEM_TWIST_BAND)) {
            SubstitutePlaceholderStringTags(0,target,0);
            LogMessageByIdWithPopupCheckUserTarget(user,target,0xdb2 + JPN_MSG_OFFSET);
            return;
        }

        #ifdef JAPAN
        if (DefenderAbilityIsActive__02311B94(user, target, ABILITY_HYPER_CUTTER) && stat.id == STAT_INDEX_PHYSICAL) {
        #else
        if (DefenderAbilityIsActive__02311B94(user, target, ABILITY_HYPER_CUTTER, TRUE) && stat.id == STAT_INDEX_PHYSICAL) {
        #endif
            SubstitutePlaceholderStringTags(0,target,0);
            LogMessageByIdWithPopupCheckUserTarget(user,target,0xd9e + JPN_MSG_OFFSET);
            return;
        }
    }

    entityInfo = GetEntInfo(target);
    SubstitutePlaceholderStringTags(0,target,0);
    PlayOffensiveStatDownEffect(target,stat);

    if (AbilityIsActiveVeneer(target, ABILITY_SIMPLE))
        nStages *= 2;

    if (nStages == 1) {
        CopyStringFromId(buffer2, 0xdcd + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(2, buffer2);
    }
    else {
        CopyStringFromId(buffer2, 0xdcc + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(2, buffer2);
    }

    newStage = entityInfo->stat_modifiers.offensive_stages[stat.id];
    newStage -= nStages;
    if (newStage < 0) {
        newStage = 0;
    }

    if (entityInfo->stat_modifiers.offensive_stages[stat.id] != newStage) {
        entityInfo->stat_modifiers.offensive_stages[stat.id] = newStage;
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xd91 + JPN_MSG_OFFSET);
    }
    else {
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xdd9 + JPN_MSG_OFFSET);
    }
    UpdateStatusIconFlags(target);
}

void LowerDefensiveStat(struct entity *user, struct entity *target, struct StatIndex stat, s32 nStagesRaw, bool8 checkProtected, bool8 logMsgProtected)
{
    struct monster *entityInfo;
    u8 *buffer1 = AllocateTemp1024ByteBufferFromPool();
    u8 *buffer2 = AllocateTemp1024ByteBufferFromPool();
    s16 nStages = nStagesRaw;
    s32 newStage;

    if (!EntityIsValid__023118B4(target))
        return;

    if (stat.id != STAT_INDEX_PHYSICAL) {
        CopyStringFromId(buffer1, 0xdc9 + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }
    else {
        CopyStringFromId(buffer1, 0xdc8 + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }

    if (checkProtected) {
        if (IsProtectedFromStatDrops(user, target, logMsgProtected))
            return;
    }

    entityInfo = GetEntInfo(target);
    SubstitutePlaceholderStringTags(0,target,0);
    PlayDefensiveStatDownEffect(target,stat);

    if (AbilityIsActiveVeneer(target, ABILITY_SIMPLE))
        nStages *= 2;

    if (nStages == 1) {
        CopyStringFromId(buffer2, 0xdcd + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(2, buffer2);
    }
    else {
        CopyStringFromId(buffer2, 0xdcc + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(2, buffer2);
    }

    newStage = entityInfo->stat_modifiers.defensive_stages[stat.id];
    newStage -= nStages;
    if (newStage < 0) {
        newStage = 0;
    }

    if (entityInfo->stat_modifiers.defensive_stages[stat.id] != newStage) {
        entityInfo->stat_modifiers.defensive_stages[stat.id] = newStage;
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xd90 + JPN_MSG_OFFSET);
    }
    else {
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xdd7 + JPN_MSG_OFFSET);
    }
    UpdateStatusIconFlags(target);
}

void BoostOffensiveStat(struct entity *user, struct entity *target, struct StatIndex stat, s32 nStagesRaw)
{
    struct monster *entityInfo;
    u8 *buffer1 = AllocateTemp1024ByteBufferFromPool();
    u8 *buffer2 = AllocateTemp1024ByteBufferFromPool();
    s16 nStages = nStagesRaw;
    s32 newStage;

    if (!EntityIsValid__023118B4(target))
        return;

    entityInfo = GetEntInfo(target);
    SubstitutePlaceholderStringTags(0,target,0);
    PlayOffensiveStatUpEffect(target,stat);
    if (stat.id != STAT_INDEX_PHYSICAL) {
        CopyStringFromId(buffer1, 0xdcb + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }
    else {
        CopyStringFromId(buffer1, 0xdca + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }

    if (AbilityIsActiveVeneer(target, ABILITY_SIMPLE))
        nStages *= 2;

    if (nStages == 1) {
        CopyStringFromId(buffer2, 0xdcd + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(2, buffer2);
    }
    else {
        CopyStringFromId(buffer2, 0xdcc + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(2, buffer2);
    }

    newStage = entityInfo->stat_modifiers.offensive_stages[stat.id];
    newStage += nStages;
    if (newStage >= MAX_STAT_STAGE) {
        newStage = MAX_STAT_STAGE;
    }

    if (entityInfo->stat_modifiers.offensive_stages[stat.id] != newStage) {
        entityInfo->stat_modifiers.offensive_stages[stat.id] = newStage;
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xd8f + JPN_MSG_OFFSET);
    }
    else {
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xdd8 + JPN_MSG_OFFSET);
    }
    UpdateStatusIconFlags(target);
}

void BoostDefensiveStat(struct entity *user, struct entity *target, struct StatIndex stat, s32 nStagesRaw)
{
    struct monster *entityInfo;
    u8 *buffer1 = AllocateTemp1024ByteBufferFromPool();
    u8 *buffer2 = AllocateTemp1024ByteBufferFromPool();
    s16 nStages = nStagesRaw;
    s32 newStage;

    if (!EntityIsValid__023118B4(target))
        return;

    entityInfo = GetEntInfo(target);
    SubstitutePlaceholderStringTags(0,target,0);
    PlayDefensiveStatUpEffect(target,stat);
    if (stat.id != STAT_INDEX_PHYSICAL) {
        CopyStringFromId(buffer1, 0xdc9 + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }
    else {
        CopyStringFromId(buffer1, 0xdc8 + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }

    if (AbilityIsActiveVeneer(target, ABILITY_SIMPLE))
        nStages *= 2;

    if (nStages == 1) {
        CopyStringFromId(buffer2, 0xdcd + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(2, buffer2);
    }
    else {
        CopyStringFromId(buffer2, 0xdcc + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(2, buffer2);
    }

    newStage = entityInfo->stat_modifiers.defensive_stages[stat.id];
    newStage += nStages;
    if (newStage >= MAX_STAT_STAGE) {
        newStage = MAX_STAT_STAGE;
    }

    if (entityInfo->stat_modifiers.defensive_stages[stat.id] != newStage) {
        entityInfo->stat_modifiers.defensive_stages[stat.id] = newStage;
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xd8e + JPN_MSG_OFFSET);
    }
    else {
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xdd6 + JPN_MSG_OFFSET);
    }
    UpdateStatusIconFlags(target);
}

enum flash_fire_status GetFlashFireStatus(struct entity *attacker, struct entity *defender)
{
    if (!EntityIsValid__023118B4(defender))
        return FLASH_FIRE_STATUS_NONE;

    if (AbilityIsActiveVeneer(attacker, ABILITY_NORMALIZE))
        return FLASH_FIRE_STATUS_NONE;

#ifdef JAPAN
    if (!DefenderAbilityIsActive__02311B94(attacker, defender, ABILITY_FLASH_FIRE))
#else
    if (!DefenderAbilityIsActive__02311B94(attacker, defender, ABILITY_FLASH_FIRE, TRUE))
#endif
        return FLASH_FIRE_STATUS_NONE;

    if (GetEntInfo(defender)->stat_modifiers.flash_fire_boost >= 2)
        return FLASH_FIRE_STATUS_MAXED;

    return FLASH_FIRE_STATUS_NOT_MAXED;
}

void ActivateFlashFire(struct entity *pokemon, struct entity *target)
{
    s32 flashFireBoost;

    if (EntityIsValid__023118B4(target)) {
        struct monster * entityInfo = GetEntInfo(target);
        SubstitutePlaceholderStringTags(0,target,0);
        flashFireBoost = entityInfo->stat_modifiers.flash_fire_boost;
        if (++flashFireBoost >= 2) {
            flashFireBoost = 2;
        }
        if (entityInfo->stat_modifiers.flash_fire_boost != flashFireBoost) {
            entityInfo->stat_modifiers.flash_fire_boost = flashFireBoost;
            ov29_022E4338(target);
        }
        UpdateStatusIconFlags(target);
    }
}

void ApplyOffensiveStatMultiplier(struct entity *user, struct entity *target, struct StatIndex stat, fx32_8 multiplier, bool8 displayMessage)
{
    struct monster *entityInfo;
    fx32_8 oldMulti;
    u8 *buffer1 = AllocateTemp1024ByteBufferFromPool();

    if (!EntityIsValid__023118B4(target))
        return;

    if (stat.id != STAT_INDEX_PHYSICAL) {
        CopyStringFromId(buffer1, 0xdcb + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }
    else {
        CopyStringFromId(buffer1, 0xdca + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }

    if (F248LessThanInt(multiplier, 1) && IsProtectedFromStatDrops(user,target,displayMessage))
        return;

    if (ItemIsActive__02311BF8(target,ITEM_TWIST_BAND) && F248LessThanInt(multiplier, 1)) {
        SubstitutePlaceholderStringTags(0,target,0);
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xdb2 + JPN_MSG_OFFSET);
        return;
    }

    #ifdef JAPAN
    if (DefenderAbilityIsActive__02311B94(user, target, ABILITY_HYPER_CUTTER)
    #else
    if (DefenderAbilityIsActive__02311B94(user, target, ABILITY_HYPER_CUTTER, TRUE)
    #endif // JAPAN
        && stat.id == STAT_INDEX_PHYSICAL
        && F248LessThanInt(multiplier, 1))
    {
        if (displayMessage) {
            SubstitutePlaceholderStringTags(0,target,0);
            LogMessageByIdWithPopupCheckUserTarget(user,target,0xd9e + JPN_MSG_OFFSET);
        }
        return;
    }

    entityInfo = GetEntInfo(target);
    SubstitutePlaceholderStringTags(0,target,0);
    oldMulti = entityInfo->stat_modifiers.offensive_multipliers[stat.id];

    if (F248LessThanInt(multiplier, 1)) {
        PlayOffensiveStatMultiplierDownEffect(target,stat);
    }
    else {
        PlayOffensiveStatMultiplierUpEffect(target,stat);
    }

    entityInfo->stat_modifiers.offensive_multipliers[stat.id] = MultiplyByFixedPoint(entityInfo->stat_modifiers.offensive_multipliers[stat.id],multiplier);

    if (F248LessThanFloat(entityInfo->stat_modifiers.offensive_multipliers[stat.id], 0.01)) {
        entityInfo->stat_modifiers.offensive_multipliers[stat.id] = IntToF248(0.01);
    }
    if (FloatLessThanF248(99.99, entityInfo->stat_modifiers.offensive_multipliers[stat.id])) {
        entityInfo->stat_modifiers.offensive_multipliers[stat.id] = IntToF248(99.99);
    }

    if (F248GreaterThan(oldMulti, entityInfo->stat_modifiers.offensive_multipliers[stat.id])) {
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xdd1 + JPN_MSG_OFFSET);
    }
    else if (F248LessThan(oldMulti, entityInfo->stat_modifiers.offensive_multipliers[stat.id])) {
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xdd0 + JPN_MSG_OFFSET);
    }
    else {
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xdd3 + JPN_MSG_OFFSET);
    }
    UpdateStatusIconFlags(target);
}

void ApplyDefensiveStatMultiplier(struct entity *user, struct entity *target, struct StatIndex stat, fx32_8 multiplier, bool8 displayMessage)
{
    struct monster *entityInfo;
    fx32_8 oldMulti;
    u8 *buffer1 = AllocateTemp1024ByteBufferFromPool();

    if (!EntityIsValid__023118B4(target))
        return;

    if (stat.id != STAT_INDEX_PHYSICAL) {
        CopyStringFromId(buffer1, 0xdc9 + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }
    else {
        CopyStringFromId(buffer1, 0xdc8 + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }

    if (F248LessThanInt(multiplier, 1) && IsProtectedFromStatDrops(user,target,displayMessage))
        return;

    entityInfo = GetEntInfo(target);
    SubstitutePlaceholderStringTags(0,target,0);
    oldMulti = entityInfo->stat_modifiers.defensive_multipliers[stat.id];

    if (F248LessThanInt(multiplier, 1)) {
        PlayDefensiveStatMultiplierDownEffect(target,stat);
    }
    else {
        PlayDefensiveStatMultiplierUpEffect(target,stat);
    }

    entityInfo->stat_modifiers.defensive_multipliers[stat.id] = MultiplyByFixedPoint(entityInfo->stat_modifiers.defensive_multipliers[stat.id],multiplier);

    if (F248LessThanFloat(entityInfo->stat_modifiers.defensive_multipliers[stat.id], 0.01)) {
        entityInfo->stat_modifiers.defensive_multipliers[stat.id] = IntToF248(0.01);
    }
    if (FloatLessThanF248(99.99, entityInfo->stat_modifiers.defensive_multipliers[stat.id])) {
        entityInfo->stat_modifiers.defensive_multipliers[stat.id] = IntToF248(99.99);
    }

    if (F248GreaterThan(oldMulti, entityInfo->stat_modifiers.defensive_multipliers[stat.id])) {
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xdcf + JPN_MSG_OFFSET);
    }
    else if (F248LessThan(oldMulti, entityInfo->stat_modifiers.defensive_multipliers[stat.id])) {
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xdce + JPN_MSG_OFFSET);
    }
    else {
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xdd2 + JPN_MSG_OFFSET);
    }
    UpdateStatusIconFlags(target);
}

void BoostHitChanceStat(struct entity *user, struct entity *target, struct StatIndex stat)
{
    struct monster *entityInfo;
    u8 *buffer1 = AllocateTemp1024ByteBufferFromPool();
    s16 nStages = 1;

    if (!EntityIsValid__023118B4(target))
        return;

    entityInfo = GetEntInfo(target);
    SubstitutePlaceholderStringTags(0,target,0);
    PlayHitChanceUpEffect(target,stat);
    if (stat.id != STAT_INDEX_ACCURACY) {
        CopyStringFromId(buffer1, 0xdc7 + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }
    else {
        CopyStringFromId(buffer1, 0xdc6 + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }

    if (AbilityIsActiveVeneer(target, ABILITY_SIMPLE))
        nStages *= 2;

    if (entityInfo->stat_modifiers.hit_chance_stages[stat.id] < MAX_STAT_STAGE) {
        entityInfo->stat_modifiers.hit_chance_stages[stat.id] += nStages;
        if (entityInfo->stat_modifiers.hit_chance_stages[stat.id] > MAX_STAT_STAGE) {
            entityInfo->stat_modifiers.hit_chance_stages[stat.id] = MAX_STAT_STAGE;
        }

        if (nStages >= 2) {
            LogMessageByIdWithPopupCheckUserTarget(user,target,0xd95 + JPN_MSG_OFFSET);
        }
        else {
            LogMessageByIdWithPopupCheckUserTarget(user,target,0xd93 + JPN_MSG_OFFSET);
        }
    }
    else {
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xdd5 + JPN_MSG_OFFSET);
    }

    UpdateStatusIconFlags(target);
}

void LowerHitChanceStat(struct entity *user, struct entity *target, struct StatIndex stat, bool8 displayMessage)
{
    struct monster *entityInfo;
    u8 *buffer1 = AllocateTemp1024ByteBufferFromPool();
    s16 nStages = 1;

    if (!EntityIsValid__023118B4(target))
        return;

    if (stat.id != STAT_INDEX_ACCURACY) {
        CopyStringFromId(buffer1, 0xdc7 + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }
    else {
        CopyStringFromId(buffer1, 0xdc6 + JPN_MSG_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }

    if (IsProtectedFromStatDrops(user,target,displayMessage))
        return;

    #ifdef JAPAN
    if (DefenderAbilityIsActive__02311B94(user, target, ABILITY_KEEN_EYE) && stat.id == STAT_INDEX_ACCURACY) {
    #else
    if (DefenderAbilityIsActive__02311B94(user, target, ABILITY_KEEN_EYE, TRUE) && stat.id == STAT_INDEX_ACCURACY) {
    #endif // JAPAN
        if (displayMessage) {
            SubstitutePlaceholderStringTags(0,target,0);
            LogMessageByIdWithPopupCheckUserTarget(user,target,0xd9f + JPN_MSG_OFFSET);
        }
        return;
    }

    if (AbilityIsActiveVeneer(target, ABILITY_SIMPLE))
        nStages *= 2;

    entityInfo = GetEntInfo(target);
    SubstitutePlaceholderStringTags(0,target,0);
    PlayHitChanceDownEffect(target,stat);

    if (entityInfo->stat_modifiers.hit_chance_stages[stat.id] > 0) {
        entityInfo->stat_modifiers.hit_chance_stages[stat.id] -= nStages;
        if (entityInfo->stat_modifiers.hit_chance_stages[stat.id] < 0) {
            entityInfo->stat_modifiers.hit_chance_stages[stat.id] = 0;
        }

        if (nStages >= 2) {
            LogMessageByIdWithPopupCheckUserTarget(user,target,0xd94 + JPN_MSG_OFFSET);
        }
        else {
            LogMessageByIdWithPopupCheckUserTarget(user,target,0xd92 + JPN_MSG_OFFSET);
        }
    }
    else {
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xdd4 + JPN_MSG_OFFSET);
    }

    UpdateStatusIconFlags(target);
}

bool8 TryInflictCringeStatus(struct entity *user ,struct entity *target, bool8 displayMessage, bool8 onlyCheck)
{
    struct monster *entityInfo;
    u8 *buffer1 = AllocateTemp1024ByteBufferFromPool();

    if (!EntityIsValid__023118B4(target))
        return FALSE;

    if (SafeguardIsActive(user, target, displayMessage))
        return FALSE;

    if (IsProtectedFromNegativeStatus(user, target, displayMessage))
        return FALSE;

    #ifdef JAPAN
    if (DefenderAbilityIsActive__02311B94(user, target, ABILITY_INNER_FOCUS)) {
    #else
    if (DefenderAbilityIsActive__02311B94(user, target, ABILITY_INNER_FOCUS, TRUE)) {
    #endif
        SubstitutePlaceholderStringTags(0,target,0);
        if (displayMessage)
            LogMessageByIdWithPopupCheckUserTarget(user,target,0xda2 + JPN_MSG_OFFSET);
        return FALSE;
    }

    if (onlyCheck)
        return TRUE;

    entityInfo = GetEntInfo(target);
    SubstitutePlaceholderStringTags(0,target,0);
    if (entityInfo->cringe_class_status.cringe != STATUS_CRINGE_CRINGE) {
        entityInfo->cringe_class_status.cringe = STATUS_CRINGE_CRINGE;
        entityInfo->cringe_class_status.cringe_turns = CalcStatusDuration(target, gCringeTurnRange, TRUE) + 1;
        PlayCringeExclamationPointEffect(target);
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xd02 + JPN_MSG_OFFSET);
        TryActivateSteadfast(user, target);
        TryActivateQuickFeet(user, target);
    }
    else {
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xd03 + JPN_MSG_OFFSET);
    }
    UpdateStatusIconFlags(target);
    return TRUE;
}

bool8 TryInflictParalysisStatus(struct entity *user, struct entity *target, bool8 displayMessage, bool8 onlyCheck)
{
    struct monster *entityInfo;
    bool8 alreadyParalyzed;

    if (!EntityIsValid__023118B4(target))
        return FALSE;

    if (SafeguardIsActive(user, target, displayMessage))
        return FALSE;

    if (IsProtectedFromNegativeStatus(user, target, displayMessage))
        return FALSE;

    #ifdef JAPAN
    if (DefenderAbilityIsActive__02311B94(user, target, ABILITY_LIMBER)) {
    #else
    if (DefenderAbilityIsActive__02311B94(user, target, ABILITY_LIMBER, TRUE)) {
    #endif
        SubstitutePlaceholderStringTags(0,target,0);
        if (displayMessage)
            LogMessageByIdWithPopupCheckUserTarget(user,target,0xda0 + JPN_MSG_OFFSET);
        return FALSE;
    }

    if (ExclusiveItemEffectIsActive__023147EC(target, EXCLUSIVE_EFF_NO_PARALYSIS)) {
        if (displayMessage) {
            struct item item;

            SubstitutePlaceholderStringTags(0,target,0);
            GetExclusiveItemWithEffectFromBag(target, EXCLUSIVE_EFF_NO_PARALYSIS, &item);
            PrepareItemForPrinting__02345728(1, &item);
            LogMessageByIdWithPopupCheckUserTarget(user,target,0xda1 + JPN_MSG_OFFSET);
        }
        return FALSE;
    }

    if (onlyCheck)
        return TRUE;

    alreadyParalyzed = TRUE;
    entityInfo = GetEntInfo(target);
    SubstitutePlaceholderStringTags(0,target,0);
    if (entityInfo->burn_class_status.burn != STATUS_BURN_PARALYSIS) {
        entityInfo->burn_class_status.burn = STATUS_BURN_PARALYSIS;
        entityInfo->burn_class_status.burn_turns = CalcStatusDuration(target,gParalysisTurnRange,TRUE) + 1;
        entityInfo->burn_class_status.burn_damage_countdown = 0;
        entityInfo->burn_class_status.badly_poisoned_damage_count = 0;
        alreadyParalyzed = FALSE;
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xd00 + JPN_MSG_OFFSET);
        PlayParalysisEffect(target);
        CalcSpeedStageWrapper(target);
        TryActivateQuickFeet(user, target);
    }
    else {
        LogMessageByIdWithPopupCheckUserTarget(user,target,0xd01 + JPN_MSG_OFFSET);
    }

    if (AbilityIsActiveVeneer(target, ABILITY_SYNCHRONIZE) && !alreadyParalyzed) {
        s32 i;
        bool8 synchronizePrinted = FALSE;

        for (i = 0; i < NUM_DIRECTIONS; i++) {
            const struct tile *mapTile = GetTile(target->pos.x + DIRECTIONS_XY[i].x,target->pos.y + DIRECTIONS_XY[i].y);
            struct entity *mapMonster = mapTile->monster;
            if (EntityIsValid__023118B4(mapMonster) && GetEntityType(mapMonster) == ENTITY_MONSTER) {
                if (!synchronizePrinted) {
                    synchronizePrinted = TRUE;
                    SetPreprocessorArgsStringToName(GetMessageLogPreprocessorArgs(),0,entityInfo,0,0);
                    LogMessageByIdWithPopupCheckUserTarget(user,target,0xdc5 + JPN_MSG_OFFSET);
                }
                if (GetTreatmentBetweenMonstersIgnoreStatus(target,mapMonster) == TREATMENT_TREAT_AS_ENEMY) {
                    TryInflictParalysisStatus(user, mapMonster, displayMessage, FALSE);
                }
            }
        }
    }

    UpdateStatusIconFlags(target);
    return TRUE;
}

bool8 ExclusiveItemEffectIsActive__023147EC(struct entity *entity, enum exclusive_item_effect_id effect_id)
{
    struct monster *monster = GetEntInfo(entity);
    if (!monster->is_not_team_member)
        return ExclusiveItemEffectFlagTest(monster->exclusive_item_effect_flags, effect_id);

    return FALSE;
}

void BoostSpeed(struct entity *user, struct entity *target, s32 nStages, s32 turns, bool8 displayMessage)
{
    s32 speedBefore;
    s32 i;
    s32 speedAfter;
    struct monster *entityInfo;

    if (!EntityIsValid__023118B4(target))
        return;

    if (turns == 0) {
        turns = CalcStatusDuration(target,SPEED_BOOST_TURN_RANGE,FALSE) + 1;
    }

    entityInfo = GetEntInfo(target);
    SubstitutePlaceholderStringTags(0,target,0);
    speedBefore = CalcSpeedStage(target, nStages);
    if (speedBefore == MAX_SPEED_STAGE) {
        if (displayMessage)
            LogMessageByIdWithPopupCheckUserTarget(user,target,0xddb + JPN_MSG_OFFSET);
    }
    else {
        for (i = 0; i < NUM_SPEED_COUNTERS; i++) {
            if (entityInfo->speed_up_counters[i] == 0) {
                entityInfo->speed_up_counters[i] = turns;
                break;
            }
        }

        speedAfter = CalcSpeedStage(target, nStages);
        if (speedBefore == speedAfter) {
            LogMessageByIdWithPopupCheckUserTarget(user,target,0xdda + JPN_MSG_OFFSET);
        }
        else {
            PlaySpeedUpEffect(target);
            LogMessageByIdWithPopupCheckUserTarget(user,target,ov29_02353318[speedAfter]);
            entityInfo->unk_sped_up_tracker = TRUE;
            entityInfo->already_acted = FALSE;
        }
    }

    UpdateStatusIconFlags(target);
}

void BoostSpeedOneStage(struct entity *user, struct entity *target, s32 turns, bool8 displayMessage)
{
    BoostSpeed(user, target, 1, turns, displayMessage);
}

void LowerSpeed(struct entity *user, struct entity *target, s32 nStages, bool8 displayMessage)
{
    s32 speedBefore;
    s32 speedAfter;
    struct monster *entityInfo;

    if (!EntityIsValid__023118B4(target))
        return;

    if (SafeguardIsActive(user,target,displayMessage))
        return;

    if (IsProtectedFromNegativeStatus(user, target, displayMessage))
        return;

    entityInfo = GetEntInfo(target);
    SubstitutePlaceholderStringTags(0,target,0);
    speedBefore = CalcSpeedStageWrapper(target);
    if (speedBefore == 0) {
        if (displayMessage)
            LogMessageByIdWithPopupCheckUserTarget(user,target,0xddc + JPN_MSG_OFFSET);
    }
    else {
        s32 counter, i;
        for (counter = 0; counter < nStages; counter++) {
            for (i = 0; i < NUM_SPEED_COUNTERS; i++) {
                if (entityInfo->speed_down_counters[i] == 0) {
                    entityInfo->speed_down_counters[i] = CalcStatusDuration(target,gSpeedLowerTurnRange,TRUE) + 1;
                    break;
                }
            }
        }
        speedAfter = CalcSpeedStageWrapper(target);
        if (speedBefore == speedAfter) {
            if (displayMessage)
                LogMessageByIdWithPopupCheckUserTarget(user,target,0xdda + JPN_MSG_OFFSET);
        }
        else {
            PlaySpeedDownEffect(target);
            LogMessageByIdWithPopupCheckUserTarget(user,target,ov29_02353318[speedAfter]);
            if (speedAfter == 0) {
                TryActivateQuickFeet(user, target);
            }
        }
    }

    UpdateStatusIconFlags(target);
}

// If Red's file boundaries are anything to go by, this file should end just before TryInflictConfusedStatus.
