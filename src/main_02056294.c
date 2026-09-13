#include "main_02056294.h"
#include "common.h"

extern struct team_member_table *TEAM_MEMBER_TABLE_PTR;

bool8 IsMonsterIdInNormalRange(s16 id)
{
    if (id >= 0 && id < 0x22B) {
        return TRUE;
    }
    return FALSE;
}

bool8 sub_020562B8(int a)
{
    return a < 0;
}

void SetActiveTeam(enum team_id team)
{
    TEAM_MEMBER_TABLE_PTR->active_team = team;
    TEAM_MEMBER_TABLE_PTR->active_roster = TEAM_MEMBER_TABLE_PTR->active_team_rosters[team];
    TEAM_MEMBER_TABLE_PTR->active_roster_member_idxs =
        TEAM_MEMBER_TABLE_PTR->active_team_roster_member_idxs[team];
}

void sub_02056318(u8 a)
{
    struct team_member_table *t = TEAM_MEMBER_TABLE_PTR;
    (&t->field_0x9874)[t->active_team] = a;
}

u8 sub_0205633C(void)
{
    struct team_member_table *t = TEAM_MEMBER_TABLE_PTR;
    return (&t->field_0x9874)[t->active_team];
}

bool32 sub_02056360(void)
{
    struct team_member_table *t = TEAM_MEMBER_TABLE_PTR;
    return t->field_0x9874 != 0 || t->field_0x9875 != 0;
}

struct team_member* GetActiveTeamMember(s32 roster_idx)
{
    if (roster_idx == -1) {
        return NULL;
    }
    return &TEAM_MEMBER_TABLE_PTR->active_roster[(s16)roster_idx];
}
