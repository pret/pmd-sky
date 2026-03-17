#include "main_0205A288.h"
#include "common.h"

extern struct ground_monster* GetTeamMember(s32 member_idx);
extern void sub_0205A340(s16 *ptr, struct ground_monster *data, s32 monster_id);
extern const u8* GetNameString(enum monster_id monster_id);
extern void StrncpyName(char *dest, const char *src, u32 n);
extern void SetPokemonJoined(enum monster_id monster_id);

bool8 HandleShedinjaEvolution(s16 *member_idx, enum monster_id monster_id)
{
    s16 temp_s16 = -1;

    struct ground_monster team_member = *GetTeamMember(*member_idx);
    sub_0205A340(member_idx, &team_member, monster_id);

    if (monster_id == MONSTER_NINJASK || monster_id == MONSTER_NINJASK_SECONDARY)
    {
        StrncpyName(team_member.name, GetNameString(MONSTER_SHEDINJA), 10);
        sub_0205A340(&temp_s16, &team_member, MONSTER_SHEDINJA);

        if (temp_s16 != -1)
        {
            SetPokemonJoined(MONSTER_SHEDINJA);
        }
    }

    return TRUE;
}
