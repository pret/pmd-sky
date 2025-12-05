#include "main_02058E68.h"
#include "iq_skills.h"

extern s32 GetIqGroup(s16 monster_id);

enum iq_skill_id GetSpeciesIqSkill(s16 monster_id, u8 index)
{
    return IQ_GROUP_SKILLS[GetIqGroup(monster_id)][index];
}
