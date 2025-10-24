#include "main_0204CB94.h"
#include "scripting.h"

u8 GetScenarioBalance()
{
    s32 special_episode_type = LoadScriptVariableValue(0, VAR_EXECUTE_SPECIAL_EPISODE_TYPE);
    if (special_episode_type == EPISODE_NONE)
    {
        s32 scenario_balance = LoadScriptVariableValue(0, VAR_SCENARIO_BALANCE_DEBUG);
        if (scenario_balance < 0)
            scenario_balance = LoadScriptVariableValue(0, VAR_SCENARIO_BALANCE_FLAG);

        return scenario_balance;
    }

    if (special_episode_type == EPISODE_BIDOOFS_WISH)
        return 1;
    return 3;
}
