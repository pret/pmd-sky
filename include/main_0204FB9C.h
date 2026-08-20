#ifndef PMDSKY_MAIN_0204FB9C_H
#define PMDSKY_MAIN_0204FB9C_H

#include "adventure_log.h"
#include "util.h"

void SetAdventureLogCompleted(s32 id);
s32 IsAdventureLogNotEmpty(void);
bool8 GetAdventureLogCompleted(s32 id);
void IncrementNbDungeonsCleared(void);
u32 GetNbDungeonsCleared(void);
void IncrementNbFriendRescues(void);
u32 GetNbFriendRescues(void);
void IncrementNbEvolutions(void);
u32 GetNbEvolutions(void);
void IncrementNbSteals(void);

#endif
