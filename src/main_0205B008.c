#include "main_0205B008.h"
#include "common.h"

extern s32 sub_02055894(u32 b);
extern s32 GetActiveRosterIndex(s32 member_idx);
extern void sub_02053224(struct team_member *team_member, s32 member_idx, s32 arg2);
extern bool8 sub_020564B0(s32 member_idx);
extern struct team_member* GetActiveTeamMember(s32 roster_idx);
extern void CreateMonsterSummaryFromTeamMember(struct monster_summary *monster_summary, struct team_member *team_member, bool8 is_leader);

void sub_0205B008(struct monster_summary *monster_summary, u32 b)
{
    sub_0205B028(monster_summary, sub_02055894(b));
}

void sub_0205B028(struct monster_summary *monster_summary, s32 member_idx)
{
    struct team_member team_member;
    s32 active_roster_index = GetActiveRosterIndex(member_idx);

    if (active_roster_index == -1)
    {
        sub_02053224(&team_member, member_idx, 0);
        CreateMonsterSummaryFromTeamMember(monster_summary, &team_member, sub_020564B0(member_idx));
    }
    else
    {
        struct team_member *active_team_member = GetActiveTeamMember(active_roster_index);
        CreateMonsterSummaryFromTeamMember(monster_summary, active_team_member, sub_020564B0(member_idx));
    }
}
