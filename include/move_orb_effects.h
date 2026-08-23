#ifndef PMDSKY_MOVE_ORB_EFFECTS_H
#define PMDSKY_MOVE_ORB_EFFECTS_H

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

void LowerOffensiveStat(struct entity *user, struct entity *target, struct StatIndex stat, s32 n_stages, bool8 check_is_protected_from_stat_drops, bool8 log_message_if_protected_from_stat_drops);
void LowerDefensiveStat(struct entity *user, struct entity *target, struct StatIndex stat, s32 increment, bool8 check_is_protected_from_stat_drops, bool8 log_message_if_protected_from_stat_drops);
void BoostOffensiveStat(struct entity *user, struct entity *target, struct StatIndex stat, s32 n_stages);
void BoostDefensiveStat(struct entity *user, struct entity *target, struct StatIndex stat, s32 n_stages);
// Checks whether Flash Fire should activate, assuming the defender is being hit by a Fire-type move.
// This checks that the defender is valid and Flash Fire is active, and that Normalize isn't active on the attacker.
enum flash_fire_status FlashFireShouldActivate(struct entity *attacker, struct entity *defender);
void ActivateFlashFire(struct entity *attacker, struct entity *defender);
void ApplyOffensiveStatMultiplier(struct entity *user, struct entity *target, struct StatIndex stat_idx, fx32_8 multiplier, bool8 display_message);
void ApplyDefensiveStatMultiplier(struct entity *user, struct entity *target, struct StatIndex stat_idx, fx32_8 multiplier, bool8 display_message);
void BoostHitChanceStat(struct entity *user, struct entity *target, struct StatIndex stat_idx);
void LowerHitChanceStat(struct entity *user, struct entity *target, struct StatIndex stat_idx, bool8 display_message);
bool8 TryInflictCringeStatus(struct entity *user ,struct entity *target, bool8 log_failure, bool8 check_only);
bool8 TryInflictParalysisStatus(struct entity *user, struct entity *target, bool8 log_failure, bool8 check_only);
// Checks if a monster is a team member under the effects of a certain exclusive item effect.
bool8 ExclusiveItemEffectIsActive__023147EC(struct entity *entity, enum exclusive_item_effect_id effect_id);
void BoostSpeed(struct entity *user, struct entity *target, s32 n_stages, s32 turns, bool8 log_failure);
void BoostSpeedOneStage(struct entity *user, struct entity *target, s32 turns, bool8 log_failure);
void LowerSpeed(struct entity *user, struct entity *target, s32 n_stages, bool8 log_failure);

#endif //PMDSKY_MOVE_ORB_EFFECTS_H
