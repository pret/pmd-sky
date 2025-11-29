#ifndef PMDSKY_STORY_PROGRESS_H
#define PMDSKY_STORY_PROGRESS_H

void UpdateProgress(enum script_var_id script_var_id, s32 chapter, s32 sub_section);
bool8 IsStoryBeforePoint(enum script_var_id script_var_id, s32 chapter, s32 sub_section);
bool8 IsStoryBeforeOrAtPoint(enum script_var_id script_var_id, s32 chapter, s32 sub_section);
s32 IsStoryAtPoint(enum script_var_id script_var_id, s32 chapter, s32 sub_section);
s32 IsStoryAtOrAfterPoint(enum script_var_id script_var_id, s32 chapter, s32 sub_section);
s32 IsStoryAtOrAfterPointStrict(enum script_var_id script_var_id, s32 chapter, s32 sub_section);

#endif //PMDSKY_STORY_PROGRESS_H
