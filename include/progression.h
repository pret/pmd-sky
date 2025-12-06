#ifndef PMDSKY_PROGRESSION_H
#define PMDSKY_PROGRESSION_H

#include "util.h"

bool8 HasPlayedOldGame();
bool8 GetResolvedPerformanceProgressFlag(u32 idx);
void SetResolvedPerformanceProgressFlag(u32 idx, s32 value);
// Returns the current SCENARIO_BALANCE value.
// The exact value returned depends on multiple factors:
// - If the first special episode is active, returns 1
// - If a different special episode is active, returns 3
// - If the SCENARIO_BALANCE_DEBUG variable is >= 0, returns its value
// - In all other cases, the value of the SCENARIO_BALANCE_FLAG variable is returned
u8 GetScenarioBalance();

#endif //PMDSKY_PROGRESSION_H
