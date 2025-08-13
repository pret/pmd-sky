#ifndef PMDSKY_MAIN_02052874_H
#define PMDSKY_MAIN_02052874_H

#include "enums.h"
#include "util.h"

enum mobility_type GetMobilityType(s16 monster_id);
u8 GetRegenSpeed(s16 monster_id);
bool8 GetCanMoveFlag(s16 monster_id);
u8 GetChanceAsleep(s16 monster_id);
u16 GetWeightMultiplier(s16 monster_id);
u16 GetSize(s16 monster_id);
u16 GetBaseHp(s16 monster_id);
bool8 CanThrowItems(s16 monster_id);

#endif //PMDSKY_MAIN_02052874_H
