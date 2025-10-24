#ifndef PMDSKY_MAIN_0204CB94_H
#define PMDSKY_MAIN_0204CB94_H

// Returns the current SCENARIO_BALANCE value.
// The exact value returned depends on multiple factors:
// - If the first special episode is active, returns 1
// - If a different special episode is active, returns 3
// - If the SCENARIO_BALANCE_DEBUG variable is >= 0, returns its value
// - In all other cases, the value of the SCENARIO_BALANCE_FLAG variable is returned
u8 GetScenarioBalance();

#endif //PMDSKY_MAIN_0204CB94_H
