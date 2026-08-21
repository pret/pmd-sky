#ifndef PMDSKY_MAIN_02058E68_H
#define PMDSKY_MAIN_02058E68_H

#include "enums.h"

// Disables an IQ skill.
void DisableIqSkill(u32 *iq_skills_flags, s32 iq_id);
// Enables an IQ skill and disables any other skills that are incompatible with it.
void EnableIqSkill(u32 *iq_skills_flags, u32 iq_id);
// Gets the <index>th skill on the list of IQ skills that a given monster species can learn.
enum iq_skill_id GetSpeciesIqSkill(s16 monster_id, u8 index);
void DisableAllIqSkills(u32 *flags);
void EnableAllLearnableIqSkills(u32 *flags, s16 monster_id, s32 iq);

#endif //PMDSKY_MAIN_02058E68_H
