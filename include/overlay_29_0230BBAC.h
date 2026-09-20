#ifndef PMDSKY_OVERLAY_29_0230BBAC_H
#define PMDSKY_OVERLAY_29_0230BBAC_H

#include "dungeon_mode.h"
#include "enums.h"
#include "item.h"
#include "overlay_29_02308FBC.h"

void CalcDamage(struct entity *attacker, struct entity *defender, enum type_id attack_type,
                s32 power, s32 crit_chance, struct unk_02308FE0 *damage_out,
                s32 damage_mult, enum move_id move_id, s32 a9);

void ov29_0230D088(struct entity *attacker, struct entity *defender, enum type_id attack_type, u8 category, s32 power, struct unk_02308FE0 *damage_out);
void ApplyDamageAndEffectsWrapper(struct entity *entity, s32 damage, s32 a3, s16 damage_source);
void CalcRecoilDamageFixed(struct entity *entity, s32 fixed_damage, s32 a3, bool8 *out_flag, s32 a5, enum type_id attack_type, s16 damage_source, s32 a8, s32 a9, s32 a10);
void CalcDamageFixed(struct entity *attacker, struct entity *defender, s32 fixed_damage, s32 a4, bool8 *out_flag, enum type_id attack_type, u8 category, s16 damage_source, s32 a9, s32 a10, s32 a11);
void CalcDamageFixedNoCategory(struct entity *attacker, struct entity *defender, s32 fixed_damage, s32 a4, bool8 *out_flag, enum type_id attack_type, s16 damage_source, s32 a8, s32 a9, s32 a10);
void CalcDamageFixedWrapper(struct entity *attacker, struct entity *defender, s32 fixed_damage, s32 a4, bool8 *out_flag, enum type_id attack_type, u8 category, s16 damage_source, s32 a9, s32 a10, s32 a11);
void UpdateShopkeeperModeAfterAttack(struct entity *attacker, struct entity *defender);
void UpdateShopkeeperModeAfterTrap(struct entity *entity, bool8 is_enemy);
bool8 ov29_0230D4A4(struct entity *attacker, struct entity *defender, enum type_id attack_type);
void ResetDamageCalcDiagnostics(void);
s32 ov29_0230D618(s32 idx);
void ov29_0230D628(struct entity *entity);
bool8 IsEitherMonsterInvalid(struct entity *a, struct entity *b);
void ov29_0230D688(struct item *item);
bool8 ov29_0230D704(struct entity *attacker, struct entity *defender, s32 a3);
bool8 ov29_0230D70C(struct entity *attacker, struct entity *defender, s32 a3);
bool8 ov29_0230D738(struct entity *attacker, struct entity *defender, s32 a3);
bool8 ov29_0230D76C(struct entity *attacker, struct entity *defender, s32 a3);
void ov29_0230D7D4(struct entity *entity);
void SwapDefensiveStages(struct entity *user, struct entity *target, s32 log_message);
void SwapDefensiveMultipliers(struct entity *user, struct entity *target, s32 log_message);
void SwapOffensiveStages(struct entity *user, struct entity *target, s32 log_message);
void SwapOffensiveMultipliers(struct entity *user, struct entity *target, s32 log_message);
void SwapHitChanceStages(struct entity *user, struct entity *target, s32 log_message);
void SwapUserAtkAndDefModifiers(struct entity *user, struct entity *target, s32 log_message);

#endif
