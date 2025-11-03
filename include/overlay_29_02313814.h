#ifndef PMDSKY_OVERLAY_29_02313814_H
#define PMDSKY_OVERLAY_29_02313814_H

#include "util.h"
#include "dungeon_mode.h"

enum flash_fire_status {
    FLASH_FIRE_STATUS_NONE = 0,
    FLASH_FIRE_STATUS_MAXED = 1,
    FLASH_FIRE_STATUS_NOT_MAXED = 2
};

#define STAT_INDEX_PHYSICAL 0 // Atk, Def
#define STAT_INDEX_SPECIAL 1 // Sp Atk, Sp Def
#define STAT_INDEX_ACCURACY STAT_INDEX_PHYSICAL
#define STAT_INDEX_EVASION STAT_INDEX_SPECIAL

struct StatIndex
{
    int id;
};

void LowerOffensiveStat(struct entity *user, struct entity *target, struct StatIndex stat, s32 nStagesRaw, bool8 checkProtected, bool8 logMsgProtected);
void LowerDefensiveStat(struct entity *user, struct entity *target, struct StatIndex stat, s32 increment, bool8 checkProtected, bool8 logMsgProtected);
void BoostOffensiveStat(struct entity *user, struct entity *target, struct StatIndex stat, s32 nStagesRaw);
void BoostDefensiveStat(struct entity *user, struct entity *target, struct StatIndex stat, s32 nStagesRaw);
// Checks whether Flash Fire should activate, assuming the defender is being hit by a Fire-type move.
// This checks that the defender is valid and Flash Fire is active, and that Normalize isn't active on the attacker.
enum flash_fire_status GetFlashFireStatus(struct entity *attacker, struct entity *defender);
void ActivateFlashFire(struct entity *pokemon, struct entity *target);
void ApplyOffensiveStatMultiplier(struct entity *user, struct entity *target, struct StatIndex stat, fx32_8 multiplier, bool8 displayMessage);

#endif //PMDSKY_OVERLAY_29_02313814_H
