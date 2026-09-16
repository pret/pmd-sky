#include "main_0205A288.h"
#include "common.h"
#include "main_0204FDFC.h"
#include "main_020251AC.h"
#include "main_020526EC.h"
#include "main_02055410.h"
#include "main_02056294.h"

struct unk_0205379C {
    s32 field_0x0;
    s32 field_0x4;
    s32 field_0x8;
};

extern void GetLvlUpEntry(struct unk_0205379C *entry, s32 monster_id, s32 level);
extern void StrcpyName(const unsigned char *dest, const unsigned char *src);
extern void sub_02025304_JP(const unsigned char *dest, const unsigned char *src);
extern void StrncpyName(char *dest, const char *src, u32 n);

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

s16 sub_0205A340(s16 *member_idx, struct ground_monster *src, enum monster_id monster_id)
{
    struct ground_monster mon;
    struct unk_0205379C entry;
    u8 name_buf[64];
    s16 old_id;

    mon = *src;
    old_id = mon.id;
    GetLvlUpEntry(&entry, monster_id, mon.level);
    mon.id = monster_id;
    mon.exp = entry.field_0x0;
    if (mon.level_at_first_evo == 0) {
        mon.level_at_first_evo = mon.level;
    } else if (mon.level_at_second_evo == 0) {
        mon.level_at_second_evo = mon.level;
    }
#ifdef JAPAN
    sub_02025304_JP(name_buf, GetNameString((enum monster_id)old_id));
#else
    StrcpyName(name_buf, GetNameString((enum monster_id)old_id));
#endif
    if (StrncmpSimple(name_buf, (const unsigned char *)mon.name, 10) == 0) {
        StrncpyName(mon.name, (const char *)GetNameString(monster_id), 10);
    }
    if (*member_idx != -1) {
        sub_02055D7C(*member_idx, &mon);
    } else {
        *member_idx = sub_02055CCC(&mon);
    }
    return *member_idx;
}
