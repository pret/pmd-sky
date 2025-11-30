#ifndef PMDSKY_STORY_PROGRESS_H
#define PMDSKY_STORY_PROGRESS_H

void SetScenarioProgressScriptVar(enum script_var_id script_var_id, s32 chapter, s32 subsection);
bool8 IsStoryBeforePoint(enum script_var_id script_var_id, s32 chapter, s32 subsection);
bool8 IsStoryBeforeOrAtPoint(enum script_var_id script_var_id, s32 chapter, s32 subsection);
bool8 IsStoryAtPoint(enum script_var_id script_var_id, s32 chapter, s32 subsection);
bool8 IsStoryAtOrAfterPoint(enum script_var_id script_var_id, s32 chapter, s32 subsection);
bool8 IsStoryAfterPoint(enum script_var_id script_var_id, s32 chapter, s32 subsection);

#endif //PMDSKY_STORY_PROGRESS_H
