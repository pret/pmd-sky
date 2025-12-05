#include "main_02058CD8.h"
#include "iq_skills.h"

bool8 CanLearnIqSkill(s32 iq_amount, enum iq_skill_id iq_id)
{
    if (iq_id == IQ_NONE)
        return 0;

    return IQ_SKILLS[iq_id] <= iq_amount;
}
