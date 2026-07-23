#include "main_020564B0.h"
#include "common.h"

extern struct team_member_table *TEAM_MEMBER_TABLE_PTR;

bool8 sub_020564B0(int idx)
{
    struct team_member_table *t;
    s16 n;

    if (idx != -1) {
        t = TEAM_MEMBER_TABLE_PTR;
        n = (&t->number_active_team_members_main)[t->active_team];
        if (n != -1) {
            if (idx == t->active_roster_member_idxs[n]) {
                return 1;
            }
        }
    }
    return 0;
}
