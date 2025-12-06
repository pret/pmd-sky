#include "main_02058E68.h"
#include "iq_skills.h"
#include "main_02052B28.h"
#include "monster_parameters.h"
#include "pokemon.h"

void DisableIqSkill(u32 *iq_skills_flags, s32 iq_id)
{
    if (IqSkillFlagTest(iq_skills_flags, iq_id))
    {
        s32 flags_group_index = iq_id / 32;
        iq_skills_flags[flags_group_index] &= ~(1 << iq_id - (flags_group_index << 5));
    }
    else
        EnableIqSkill(iq_skills_flags, iq_id);
}

void EnableIqSkill(u32 *iq_skills_flags, u32 iq_id)
{
    for (s32 id = 0; id < NUM_IQ_SKILLS; id++)
    {
        if (IQ_SKILL_RESTRICTIONS[iq_id] == IQ_SKILL_RESTRICTIONS[id])
        {
            s32 flags_group_index = id / 32;
            iq_skills_flags[flags_group_index] &= ~(1 << id - (flags_group_index * 32));
        }
    }

    u32 flags_group_index = iq_id / 32;
    iq_skills_flags[flags_group_index] |= 1 << iq_id - (flags_group_index * 32);
}

enum iq_skill_id GetSpeciesIqSkill(s16 monster_id, u8 index)
{
    return IQ_GROUP_SKILLS[GetIqGroup(monster_id)][index];
}
