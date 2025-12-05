#include "main_02058E68.h"
#include "iq_skills.h"
#include "main_02052B28.h"

enum iq_skill_id GetSpeciesIqSkill(s16 monster_id, u8 index)
{
    return IQ_GROUP_SKILLS[GetIqGroup(monster_id)][index];
}
