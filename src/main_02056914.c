#include "main_02056914.h"
#include "common.h"

extern struct team_member_table *TEAM_MEMBER_TABLE_PTR;

struct ground_monster* sub_02056914(void)
{
    struct team_member_table *t = TEAM_MEMBER_TABLE_PTR;
    s16 count = (&t->number_active_team_members_main)[t->active_team];
    s16 idx;
    if (count == -1 || (idx = t->active_roster_member_idxs[count]) == -1) {
        return NULL;
    }
    return &t->members[idx];
}
