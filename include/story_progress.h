#ifndef PMDSKY_STORY_PROGRESS_H
#define PMDSKY_STORY_PROGRESS_H

void SetScenarioProgressScriptVar(s16 script_var_id, s32 chapter, s32 subsection);
bool8 IsStoryBeforePoint(s16 script_var_id, s32 chapter, s32 subsection);
bool8 IsStoryBeforeOrAtPoint(s16 script_var_id, s32 chapter, s32 subsection);
bool8 IsStoryAtPoint(s16 script_var_id, s32 chapter, s32 subsection);
bool8 IsStoryAtOrAfterPoint(s16 script_var_id, s32 chapter, s32 subsection);
bool8 IsStoryAfterPoint(s16 script_var_id, s32 chapter, s32 subsection);

#endif //PMDSKY_STORY_PROGRESS_H
