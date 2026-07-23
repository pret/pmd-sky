#include "main_020568A4.h"
#include "common.h"

extern struct team_member_table *TEAM_MEMBER_TABLE_PTR;

u32 GetAppointedLeaderMemberIdx(void)
{
    struct team_member_table *t = TEAM_MEMBER_TABLE_PTR;
    s16 count = (&t->number_active_team_members_main)[t->active_team];
    if (count == -1) {
        return -1;
    }
    return t->active_roster_member_idxs[count];
}
