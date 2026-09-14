#include "main_02056294.h"
#include "common.h"
#include "main_02055770.h"

extern struct team_member_table *TEAM_MEMBER_TABLE_PTR;
#include "debug.h"
#include "enums.h"
#include "item_util.h"
#include "main_020251AC.h"
#include "main_0204FDFC.h"
#include "main_0205283C.h"
#include "main_02055410.h"
#include "main_020564B0.h"
#include "main_02058E68.h"

extern s32 _022B5788;
extern u8 _020A3350[];

extern void sub_02052CF4(struct ground_monster *mon, s16 monster_id, const char *name,
                         u8 *joined, u16 *moves, u8 flag);
extern void sub_02053F10(struct ground_move *moves, s16 monster_id, s32 flag);
extern bool8 sub_02053D1C(u16 move_id, s16 monster_id);
extern bool8 IsValidTeamMember(s16 member_idx);
extern s16 TryAddMonsterToActiveTeam(s16 member_idx);
extern s16 sub_02056554(s16 member_idx);
extern void StrncpyName(char *dest, const char *src, u32 n);
extern void GetNameRaw(u8 *dest, s32 monster_id);
extern bool8 StrcmpMonsterName(const char *name, s16 monster_id);
extern void RecolorNameString(char *dst, const char *src, s32 mode);
extern void RecolorTeamMemberNameString(char *dst, const char *src, bool8 is_leader);
extern void sub_020559D8(s16 *idxs);

bool8 sub_02055B20(s16 idx)
{
    struct ground_monster *m = &TEAM_MEMBER_TABLE_PTR->members[idx];
    bool8 valid;
    if (idx < 5) {
        return FALSE;
    }
    valid = (m->is_valid & 1) != 0;
    if (!valid) {
        return FALSE;
    }
    if (sub_020564B0(idx)) {
        return FALSE;
    }
    m->is_valid = FALSE;
    return TRUE;
}

void sub_02055B78(s16 idx, s16 monster_id, u8 joined_at, const char *name)
{
    u8 name_buf[20];
    struct ground_monster mon;
    struct ground_monster *dst = &TEAM_MEMBER_TABLE_PTR->members[idx];
    mon.is_valid = TRUE;
    mon.joined_at = joined_at;
    mon.joined_at_floor = 0;
    mon.level = 1;
    mon.max_hp = GetBaseHp(monster_id);
    mon.offensive_stats[0] = GetBaseOffensiveStat(monster_id, 0);
    mon.offensive_stats[1] = GetBaseOffensiveStat(monster_id, 1);
    mon.defensive_stats[0] = GetBaseDefensiveStat(monster_id, 0);
    mon.defensive_stats[1] = GetBaseDefensiveStat(monster_id, 1);
    mon.level_at_first_evo = 0;
    mon.level_at_second_evo = 0;
    mon.iq = 1;
    EnableAllLearnableIqSkills(mon.iq_skill_flags, monster_id, 1);
    mon.id = monster_id;
    mon.exp = 0;
    mon.tactic = 0;
    sub_02053F10(mon.moves, monster_id, 0);
    if (name != NULL) {
        StrncpySimple((u8 *)mon.name, (const u8 *)name, 10);
    } else {
        GetNameRaw(name_buf, monster_id);
        StrncpyName(mon.name, (const char *)name_buf, 10);
    }
    *dst = mon;
    if (idx == 0 || idx == 2) {
        TryAddMonsterToActiveTeam(idx);
    } else {
        sub_02056554(idx);
    }
    Debug_Print0(_020A3350, idx);
}

s16 sub_02055CCC(struct ground_monster *mon)
{
    s16 idx = GetFirstEmptyMemberIdx(mon->id);
    if (idx != -1) {
        TEAM_MEMBER_TABLE_PTR->members[idx] = *mon;
        SetPokemonJoined(mon->id);
        if (mon->id == 0x214) {
            _022B5788 = MAX_GROUND_TEAM_MEMBERS;
        }
    }
    return idx;
}

struct ground_monster* sub_02055D4C(struct ground_monster *mon)
{
    s16 idx = sub_02055CCC(mon);
    if (idx == -1) {
        return NULL;
    }
    return &TEAM_MEMBER_TABLE_PTR->members[idx];
}

void sub_02055D7C(s16 idx, struct ground_monster *mon)
{
    if (idx == -1) {
        return;
    }
    TEAM_MEMBER_TABLE_PTR->members[idx] = *mon;
    SetPokemonJoined(mon->id);
}

struct ground_monster* sub_02055DD0(s16 monster_id, const char *name, u8 *joined, u16 *moves, u8 flag)
{
    struct ground_monster mon;
    sub_02052CF4(&mon, monster_id, name, joined, moves, flag);
    return sub_02055D4C(&mon);
}

void sub_02055E14(struct unk_02055E14 *dst, struct ground_monster *mon)
{
    s32 i;
    dst->field_0x0 = mon->is_valid & 1;
    dst->field_0x4 = mon->level;
    dst->field_0x5 = mon->joined_at;
    dst->field_0x6 = mon->joined_at_floor;
    dst->field_0x8 = mon->id;
    dst->field_0xa = mon->level_at_first_evo;
    dst->field_0xb = mon->level_at_second_evo;
    dst->field_0xc = mon->iq;
    dst->field_0xe = mon->max_hp;
    dst->field_0x10[0] = mon->offensive_stats[0];
    dst->field_0x10[1] = mon->offensive_stats[1];
    dst->field_0x12[0] = mon->defensive_stats[0];
    dst->field_0x12[1] = mon->defensive_stats[1];
    dst->field_0x18 = *(struct unk_02055E14_18 *)mon->iq_skill_flags;
    dst->field_0x14 = mon->exp;
    dst->field_0x24 = mon->tactic;
    dst->field_0x2a = *(struct unk_02055E14_2a *)mon->moves;
    StrncpySimple((u8 *)dst->field_0x42, (const u8 *)mon->name, 10);
    for (i = 0; i < 2; i++) {
        dst->field_0x2[i] = 0;
    }
    dst->field_0x25 = 0;
    dst->field_0x26 = 0;
    dst->field_0x28 = 0;
}

void sub_02055F04(struct ground_monster *mon, struct unk_02055E14 *src)
{
    mon->is_valid = src->field_0x0 & 1;
    mon->level = src->field_0x4;
    mon->joined_at = src->field_0x5;
    mon->joined_at_floor = src->field_0x6;
    mon->id = src->field_0x8;
    mon->level_at_first_evo = src->field_0xa;
    mon->level_at_second_evo = src->field_0xb;
    mon->iq = src->field_0xc;
    mon->max_hp = src->field_0xe;
    mon->offensive_stats[0] = src->field_0x10[0];
    mon->offensive_stats[1] = src->field_0x10[1];
    mon->defensive_stats[0] = src->field_0x12[0];
    mon->defensive_stats[1] = src->field_0x12[1];
    *(struct unk_02055E14_18 *)mon->iq_skill_flags = src->field_0x18;
    mon->exp = src->field_0x14;
    mon->tactic = src->field_0x24;
    *(struct unk_02055E14_2a *)mon->moves = src->field_0x2a;
    StrncpySimple((u8 *)mon->name, (const u8 *)src->field_0x42, 10);
}

bool8 sub_02055FCC(s16 member_idx, s16 item_id)
{
    struct ground_monster *mon;
    u16 move_id;
    s16 i;
    if (IsValidTeamMember(member_idx)) {
        move_id = GetItemMoveId16(item_id);
        mon = GetTeamMember(member_idx);
        for (i = 0; i < 4; i++) {
            bool8 enabled = (mon->moves[i].flags0 & 1) != 0;
            if (enabled && mon->moves[i].id == move_id) {
                break;
            }
        }
        if (i >= 4) {
            if (sub_02053D1C(move_id, mon->id)) {
                return TRUE;
            }
        }
    }
    return FALSE;
}

bool8 IsMonsterNotNicknamed(struct ground_monster *mon)
{
    return StrcmpMonsterName(mon->name, mon->id);
}

void GetRecoloredGroundMonsterName(char *dst, struct ground_monster *mon, s32 mode)
{
    RecolorNameString(dst, mon->name, mode);
}

void sub_02056094(char *dst, struct ground_monster *mon, bool8 is_leader)
{
    RecolorTeamMemberNameString(dst, mon->name, is_leader);
}

bool8 sub_020560A4(s32 a, s32 b)
{
    return a == b;
}

void sub_020560B8(void)
{
    SetActiveTeam(TEAM_MAIN);
}

void RemoveActiveMembersFromAllTeams(void)
{
    int i;
    int t;
    for (t = 0; t < 3; t++) {
        for (i = 0; i < 4; i++) {
            TEAM_MEMBER_TABLE_PTR->active_team_rosters[t][i].flags = 0;
            TEAM_MEMBER_TABLE_PTR->active_team_roster_member_idxs[t][i] = -1;
        }
        (&TEAM_MEMBER_TABLE_PTR->number_active_team_members_main)[t] = -1;
        (&TEAM_MEMBER_TABLE_PTR->field_0x9874)[t] = 0;
    }
}

void RemoveActiveMembersFromSpecialEpisodeTeam(void)
{
    int i;
    for (i = 0; i < 4; i++) {
        TEAM_MEMBER_TABLE_PTR->active_team_rosters[1][i].flags = 0;
        TEAM_MEMBER_TABLE_PTR->active_team_roster_member_idxs[1][i] = -1;
    }
    TEAM_MEMBER_TABLE_PTR->number_active_team_members_se = -1;
    TEAM_MEMBER_TABLE_PTR->field_0x9875 = 0;
}

void RemoveActiveMembersFromRescueTeam(void)
{
    int i;
    for (i = 0; i < 4; i++) {
        TEAM_MEMBER_TABLE_PTR->active_team_rosters[2][i].flags = 0;
        TEAM_MEMBER_TABLE_PTR->active_team_roster_member_idxs[2][i] = -1;
    }
    TEAM_MEMBER_TABLE_PTR->number_active_team_members_rescue = -1;
    TEAM_MEMBER_TABLE_PTR->field_0x9876 = 0;
}

bool8 sub_02056228(s32 idx)
{
    if (idx == 0x55AA) {
        return TRUE;
    }
    if (idx == 0x5AA5) {
        return TRUE;
    }
    return idx < 0;
}

bool8 CheckTeamMemberIdx(s32 idx)
{
    if (idx == 0x55AA) {
        return TRUE;
    }
    return idx == 0x5AA5;
}

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
