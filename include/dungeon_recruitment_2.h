#ifndef PMDSKY_MAIN_02051398_H
#define PMDSKY_MAIN_02051398_H

#include "enums.h"
#include "util.h"

bool8 DungeonGoesUp(enum dungeon_id dungeon_id);
s32 GetTurnLimit(enum dungeon_id dungeon_id);
bool8 DoesNotSaveWhenEntering(enum dungeon_id dungeon_id);
bool8 TreasureBoxDropsEnabled(enum dungeon_id dungeon_id);
bool8 IsLevelResetDungeon(enum dungeon_id dungeon_id);
s32 GetMaxItemsAllowed(enum dungeon_id dungeon_id);
bool8 IsMoneyAllowed(enum dungeon_id dungeon_id);
s8 GetMaxRescueAttempts(enum dungeon_id dungeon_id);
bool8 IsRecruitingAllowed(enum dungeon_id dungeon_id);
bool8 GetLeaderChangeFlag(enum dungeon_id dungeon_id);
s32 GetRandomMovementChance(enum dungeon_id dungeon_id);
bool8 CanEnemyEvolve(enum dungeon_id dungeon_id);
s32 GetMaxMembersAllowed(enum dungeon_id dungeon_id);
bool8 IsIqEnabled(enum dungeon_id dungeon_id);
bool8 IsTrapInvisibleWhenAttacking(enum dungeon_id dungeon_id);
bool8 JoinedAtRangeCheck(enum dungeon_id dungeon_id);

#endif //PMDSKY_MAIN_02051398_H
