#ifndef PMDSKY_MAIN_0205283C_H
#define PMDSKY_MAIN_0205283C_H

#include "enums.h"
#include "util.h"

u8 GetShadowSize(s16 monster_id);
s16 GetSpeedStatus(s16 monster_id);
enum mobility_type GetMobilityType(s16 monster_id);
u8 GetRegenSpeed(s16 monster_id);
bool8 GetCanMoveFlag(s16 monster_id);
u8 GetChanceAsleep(s16 monster_id);
u16 GetWeightMultiplier(s16 monster_id);
u16 GetSize(s16 monster_id);
u16 GetBaseHp(s16 monster_id);
bool8 CanThrowItems(s16 monster_id);
bool8 CanEvolve(s16 monster_id);
s16 GetMonsterPreEvolution(s16 monster_id);
u8 GetBaseOffensiveStat(s16 monster_id, u8 stat_idx);
u8 GetBaseDefensiveStat(s16 monster_id, u8 stat_idx);
u8 GetType(s16 monster_id, u8 type_idx);
u8 GetAbility(s16 monster_id, u8 ability_idx);
s16 GetRecruitRate2(s16 monster_id);
s16 GetRecruitRate1(s16 monster_id);

#endif //PMDSKY_MAIN_0205283C_H
