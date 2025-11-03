#include "dungeon_pokemon_attributes.h"
#include "dungeon_util_static.h"
#include "overlay_29_023118B4.h"
#include "overlay_29_02313814.h"
#include "overlay_29_02311BF8.h"

extern u8* AllocateTemp1024ByteBufferFromPool(void);
extern void CopyStringFromId(u8* buf, u32 string_id);
extern void SetMessageLogPreprocessorArgsString(u32 a, u8 *buf);
extern bool8 IsProtectedFromStatDrops(struct entity *user, struct entity *target, bool8 logMsg);
extern void SubstitutePlaceholderStringTags(int a, struct entity *entity, u32 param_3);
extern void ov29_022E4E74(struct entity *user, struct StatIndex);
extern void ov29_022E4DCC(struct entity *user, struct StatIndex);
extern void ov29_022E4F1C(struct entity *user, struct StatIndex);
extern void ov29_022E4D28(struct entity *user, struct StatIndex);
extern void LogMessageByIdWithPopupCheckUserTarget(struct entity *user, struct entity *target, u32 message_id);
extern void UpdateStatusIconFlags(struct entity *);

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
    ov29_022E4D28(target,stat);

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
    ov29_022E4DCC(target,stat);

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
    ov29_022E4E74(target,stat);
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
    ov29_022E4F1C(target,stat);
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

enum flash_fire_status FlashFireShouldActivate(struct entity *attacker, struct entity *defender)
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
