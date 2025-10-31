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
extern void ov29_022E4DCC(struct entity *pokemon, struct StatIndex);
extern void ov29_022E4D28(struct entity *pokemon, struct StatIndex);
extern void LogMessageByIdWithPopupCheckUserTarget(struct entity *user, struct entity *target, u32 message_id);
extern void UpdateStatusIconFlags(struct entity *);

void LowerOffensiveStat(struct entity *pokemon, struct entity *target, struct StatIndex stat, s32 nStagesRaw, bool8 checkProtected, bool8 logMsgProtected)
{
    struct monster *entityInfo;
    u8 *buffer1 = AllocateTemp1024ByteBufferFromPool();
    u8 *buffer2 = AllocateTemp1024ByteBufferFromPool();
    s16 nStages = nStagesRaw;
    s32 newStage;

    if (!EntityIsValid__023118B4(target))
        return;

    if (stat.id != 0) {
        CopyStringFromId(buffer1, 0xdcb);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }
    else {
        CopyStringFromId(buffer1, 0xdca);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }

    if (checkProtected) {
        if (IsProtectedFromStatDrops(pokemon, target, logMsgProtected))
            return;

        if (ItemIsActive__02311BF8(target, ITEM_TWIST_BAND)) {
            SubstitutePlaceholderStringTags(0,target,0);
            LogMessageByIdWithPopupCheckUserTarget(pokemon,target,0xdb2);
            return;
        }

        if (DefenderAbilityIsActive__02311B94(pokemon, target, ABILITY_HYPER_CUTTER, TRUE) && stat.id == STAT_INDEX_PHYSICAL) {
            SubstitutePlaceholderStringTags(0,target,0);
            LogMessageByIdWithPopupCheckUserTarget(pokemon,target,0xd9e);
            return;
        }
    }

    entityInfo = GetEntInfo(target);
    SubstitutePlaceholderStringTags(0,target,0);
    ov29_022E4D28(target,stat);

    if (AbilityIsActiveVeneer(target, ABILITY_SIMPLE))
        nStages *= 2;

    if (nStages == 1) {
        CopyStringFromId(buffer2, 0xdcd);
        SetMessageLogPreprocessorArgsString(2, buffer2);
    }
    else {
        CopyStringFromId(buffer2, 0xdcc);
        SetMessageLogPreprocessorArgsString(2, buffer2);
    }

    newStage = entityInfo->stat_modifiers.offensive_stages[stat.id];
    newStage -= nStages;
    if (newStage < 0) {
        newStage = 0;
    }

    if (entityInfo->stat_modifiers.offensive_stages[stat.id] != newStage) {
        entityInfo->stat_modifiers.offensive_stages[stat.id] = newStage;
        LogMessageByIdWithPopupCheckUserTarget(pokemon,target,0xd91);
    }
    else {
        LogMessageByIdWithPopupCheckUserTarget(pokemon,target,0xdd9);
    }
    UpdateStatusIconFlags(target);
}

#ifdef JAPAN
#define LOWER_DEFENSIVE_STAT_OFFSET -0x2C0
#else
#define LOWER_DEFENSIVE_STAT_OFFSET 0
#endif // JAPAN

void LowerDefensiveStat(struct entity *pokemon, struct entity *target, struct StatIndex stat, s32 nStagesRaw, bool8 checkProtected, bool8 logMsgProtected)
{
    struct monster *entityInfo;
    u8 *buffer1 = AllocateTemp1024ByteBufferFromPool();
    u8 *buffer2 = AllocateTemp1024ByteBufferFromPool();
    s16 nStages = nStagesRaw;
    s32 newStage;

    if (!EntityIsValid__023118B4(target))
        return;

    if (stat.id != 0) {
        CopyStringFromId(buffer1, 0xdc9 + LOWER_DEFENSIVE_STAT_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }
    else {
        CopyStringFromId(buffer1, 0xdc8 + LOWER_DEFENSIVE_STAT_OFFSET);
        SetMessageLogPreprocessorArgsString(1, buffer1);
    }

    if (checkProtected) {
        if (IsProtectedFromStatDrops(pokemon, target, logMsgProtected))
            return;
    }

    entityInfo = GetEntInfo(target);
    SubstitutePlaceholderStringTags(0,target,0);
    ov29_022E4DCC(target,stat);

    if (AbilityIsActiveVeneer(target, ABILITY_SIMPLE))
        nStages *= 2;

    if (nStages == 1) {
        CopyStringFromId(buffer2, 0xdcd + LOWER_DEFENSIVE_STAT_OFFSET);
        SetMessageLogPreprocessorArgsString(2, buffer2);
    }
    else {
        CopyStringFromId(buffer2, 0xdcc + LOWER_DEFENSIVE_STAT_OFFSET);
        SetMessageLogPreprocessorArgsString(2, buffer2);
    }

    newStage = entityInfo->stat_modifiers.defensive_stages[stat.id];
    newStage -= nStages;
    if (newStage < 0) {
        newStage = 0;
    }

    if (entityInfo->stat_modifiers.defensive_stages[stat.id] != newStage) {
        entityInfo->stat_modifiers.defensive_stages[stat.id] = newStage;
        LogMessageByIdWithPopupCheckUserTarget(pokemon,target,0xd90 + LOWER_DEFENSIVE_STAT_OFFSET);
    }
    else {
        LogMessageByIdWithPopupCheckUserTarget(pokemon,target,0xdd7 + LOWER_DEFENSIVE_STAT_OFFSET);
    }
    UpdateStatusIconFlags(target);
}
