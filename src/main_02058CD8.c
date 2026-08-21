#include "main_02058CD8.h"
#include "main_02052B28.h"
#include "progression.h"
#include "iq_skills.h"

bool8 CanLearnIqSkill(s32 iq_amount, enum iq_skill_id iq_id)
{
    if (iq_id == IQ_NONE)
        return 0;

    return IQ_SKILLS[iq_id] <= iq_amount;
}

s32 GetLearnableIqSkills(u8 *out, s16 monster_id, s32 iq)
{
    s32 i;
    s32 n;
    u8 skill;
    bool8 ok;

    n = 0;

    for (i = 0; i < 25; i++) {
        skill = IQ_GROUP_SKILLS[GetIqGroup(monster_id)][i & 0xFF];

        if (skill == 0xFF) {
            break;
        }

        if (skill == 0x18) {
            ok = GetResolvedPerformanceProgressFlag(3);
        } else {
            ok = CanLearnIqSkill(iq, (enum iq_skill_id) skill);
        }

        if (ok) {
            out[n] = skill;
            n++;
        }
    }

    for (i = n; i < 0x45; i++) {
        out[i] = 0;
    }

    return n;
}
