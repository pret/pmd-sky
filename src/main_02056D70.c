#include "main_02056D70.h"
#include "common.h"
#include "main_02055410.h"
#include "main_020564B0.h"
#include "main_02056294.h"

extern struct team_member_table *TEAM_MEMBER_TABLE_PTR;

int GetAdventureNpcIds(s16* buf)
{
    s16 scratch[4];
    int i;
    struct team_member *m;
    s16 idx;
    int count = 0;

    if (buf == NULL) {
        buf = scratch;
    }
    m = TEAM_MEMBER_TABLE_PTR->active_roster;
    for (i = 0; i < 4; i++, m++) {
        bool8 f = (*(u8 *)m & 2) != 0;
        if (f) {
            idx = m->member_index;
            if (IsMonsterIdInNormalRange(idx) && !sub_020564B0(idx)) {
                buf[count] = idx;
                count++;
            }
        }
    }
    return count;
}

int GetUnitNpcIds(s16* buf)
{
    s16 scratch[4];
    int i;
    struct team_member *m;
    s16 idx;
    int count = 0;

    if (buf == NULL) {
        buf = scratch;
    }
    m = TEAM_MEMBER_TABLE_PTR->active_roster;
    for (i = 0; i < 4; i++, m++) {
        bool8 f = (*(u8 *)m & 2) != 0;
        if (f) {
            idx = m->member_index;
            if (IsMonsterIdInNormalRange(idx) && !sub_02055410(idx) && !sub_02055474(idx) &&
                !sub_020554D8(idx)) {
                buf[count] = idx;
                count++;
            }
        }
    }
    return count;
}
