#include "overlay_11_022E8024.h"
#include "overlay_11_022E7F28.h"

extern struct unk_02320904 ov11_02320904[];

extern s16 RECRUITMENT_TABLE_SPECIES[];

extern s16 ov11_02324F98;

void ov11_022E8024(void)
{
    ov11_02324F98 = -1;
}

void ov11_022E8038(void)
{

}

s16 GetSpecialRecruitmentSpecies(s32 idx)
{
    return RECRUITMENT_TABLE_SPECIES[idx];
}

s16 ov11_022E8050(s16 id)
{
    struct unk_02320904 *p;

    p = ov11_02320904;

    while (p->field_0x2 != 0) {
        if (id == p->field_0x2) {
            return p->field_0x0;
        }

        p++;
    }

    return 0;
}

void PrepareMenuAcceptTeamMember(s16 id)
{
    ov11_02324F98 = id;
}
