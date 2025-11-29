
#include "debug.h"
#include "enums.h"
#include "script_variable.h"
#include "story_progress.h"

extern const u8 SCENARIO_CALC_DEBUG_MSG;

void SetScenarioScriptVar(enum script_var_id script_var_id, s32 chapter, s32 subsection)
{
    s32 old_progress = LoadScriptVariableValueAtIndex(0, script_var_id, 0);
    s32 old_sub_prog = LoadScriptVariableValueAtIndex(0, script_var_id, 1);
    Debug_Print(9, &SCENARIO_CALC_DEBUG_MSG, script_var_id, old_progress, old_sub_prog,
                chapter, subsection);

    // VAR_SCENARIO_MAIN stores maingame story progression
    if (script_var_id == VAR_SCENARIO_MAIN) {
        if ((chapter!= old_progress) || (subsection != old_sub_prog)) {
            // Reset Job Requests cleared in a single day when the maingame story progresses.
            SaveScriptVariableValue(0, VAR_REQUEST_CLEAR_COUNT, 0);
        }
    }

    SaveScriptVariableValueAtIndex(0, script_var_id, 0, chapter);
    SaveScriptVariableValueAtIndex(0, script_var_id, 1, subsection);
}

bool8 IsStoryBeforePoint(enum script_var_id script_var_id, s32 chapter, s32 subsection)
{
    s32 cur_chapter = LoadScriptVariableValueAtIndex(0, script_var_id, 0);
    s32 cur_subsec = LoadScriptVariableValueAtIndex(0, script_var_id, 1);

    if (cur_chapter == 0x35) {
        return FALSE;
    }
    if (cur_chapter < chapter) {
        return TRUE;
    }
    if ((cur_chapter == chapter) && (subsection >= 0) && (cur_subsec < subsection)) {
        return TRUE;
    }
    return FALSE;
}

bool8 IsStoryBeforeOrAtPoint(enum script_var_id script_var_id, s32 chapter, s32 subsection)
{
    s32 cur_chapter = LoadScriptVariableValueAtIndex(0, script_var_id, 0);
    s32 cur_subsec = LoadScriptVariableValueAtIndex(0, script_var_id, 1);

    if (cur_chapter == 0x35) {
        return FALSE;
    }

    if (cur_chapter < chapter) {
        return TRUE;
    }

    if (cur_chapter == chapter) {
        if (subsection >= 0) {
            if (cur_subsec <= subsection) {
                return TRUE;
            }
        } else {
            return TRUE;
        }
    }
    return FALSE;
}

bool8 IsStoryAtPoint(enum script_var_id script_var_id, s32 chapter, s32 subsection)
{
    s32 cur_chapter = LoadScriptVariableValueAtIndex(0, script_var_id, 0);
    s32 cur_subsec = LoadScriptVariableValueAtIndex(0, script_var_id, 1);

    if (cur_chapter == chapter) {
        if (subsection < 0) {
            return TRUE;
        }
        if (cur_subsec == subsection) {
            return TRUE;
        }
    }

    return FALSE;
}

bool8 IsStoryAtOrAfterPoint(enum script_var_id script_var_id, s32 chapter, s32 subsection)
{
    s32 cur_subsec;
    s32 cur_chapter;

    cur_chapter = LoadScriptVariableValueAtIndex(0, script_var_id, 0);
    cur_subsec = LoadScriptVariableValueAtIndex(0, script_var_id, 1);

    if (cur_chapter == 0x35) {
        return FALSE;
    }
    if (cur_chapter > chapter) {
        return TRUE;
    }
    if (cur_chapter == chapter) {
        if (subsection >= 0) {
            if (cur_subsec >= subsection) {
                return TRUE;
            }

        } else {
            return TRUE;
        }
    }
    return FALSE;
}

bool8 IsStoryAfterPoint(enum script_var_id script_var_id, s32 chapter, s32 subsection)
{
    s32 cur_chapter = LoadScriptVariableValueAtIndex(0, script_var_id, 0);
    s32 cur_subsec = LoadScriptVariableValueAtIndex(0, script_var_id, 1);

    if (cur_chapter == 0x35) {
        return FALSE;
    }
    if (cur_chapter > chapter) {
        return TRUE;
    }
    if ((cur_chapter == chapter) && (subsection >= 0) && (cur_subsec > subsection)) {
        return TRUE;
    }
    return FALSE;
}
