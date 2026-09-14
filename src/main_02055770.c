#include "main_02055770.h"
#include "common.h"
#include "game_mode.h"
#include "debug.h"
#include "enums.h"
#include "item_util.h"
#include "main_020251AC.h"
#include "main_0204FDFC.h"
#include "main_0205283C.h"
#include "main_02055410.h"
#include "main_02056294.h"
#include "main_020564B0.h"
#include "main_02058E68.h"

extern struct team_member_table *TEAM_MEMBER_TABLE_PTR;

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

struct ground_monster* GetHero(void)
{
    struct ground_monster *m = TEAM_MEMBER_TABLE_PTR->members;
    bool8 valid = (m->is_valid & 1) != 0;
    return valid ? m : NULL;
}

struct ground_monster* GetPartner(void)
{
    bool8 valid = (TEAM_MEMBER_TABLE_PTR->members[1].is_valid & 1) != 0;
    return valid ? &TEAM_MEMBER_TABLE_PTR->members[1] : NULL;
}

struct ground_monster* GetMainCharacter1(void)
{
    s16 idx = (GetGameMode() == GAME_MODE_SPECIAL_EPISODE) ? 2 : 0;
    struct ground_monster *base = TEAM_MEMBER_TABLE_PTR->members;
    bool8 valid = (base[idx].is_valid & 1) != 0;
    return valid ? base + idx : NULL;
}

struct ground_monster* GetMainCharacter2(void)
{
    s16 idx = (GetGameMode() == GAME_MODE_SPECIAL_EPISODE) ? 3 : 1;
    struct ground_monster *base = TEAM_MEMBER_TABLE_PTR->members;
    bool8 valid = (base[idx].is_valid & 1) != 0;
    return valid ? base + idx : NULL;
}

struct ground_monster* GetMainCharacter3(void)
{
    bool8 valid;
    if (GetGameMode() != GAME_MODE_SPECIAL_EPISODE) {
        return NULL;
    }
    valid = (TEAM_MEMBER_TABLE_PTR->members[4].is_valid & 1) != 0;
    return valid ? &TEAM_MEMBER_TABLE_PTR->members[4] : NULL;
}

s16 sub_02055894(struct ground_monster *member)
{
    struct ground_monster *m = TEAM_MEMBER_TABLE_PTR->members;
    s32 i;
    for (i = 0; i < MAX_GROUND_TEAM_MEMBERS; i++, m++) {
        if (m == member) {
            bool8 valid = (m->is_valid & 1) != 0;
            if (!valid) {
                break;
            }
            return i;
        }
    }
    return -1;
}

s16 GetFirstMatchingMemberIdx(s16 monster_id)
{
    struct ground_monster *m = &TEAM_MEMBER_TABLE_PTR->members[5];
    s32 i;
    for (i = 5; i < MAX_GROUND_TEAM_MEMBERS; i++, m++) {
        bool8 valid = (m->is_valid & 1) != 0;
        if (valid && m->id == monster_id) {
            return i;
        }
    }
    return -1;
}

s16 GetFirstEmptyMemberIdx(s16 monster_id)
{
    struct ground_monster *m = &TEAM_MEMBER_TABLE_PTR->members[5];
    s32 limit = (monster_id == 0x214) ? MAX_GROUND_TEAM_MEMBERS : _022B5788;
    s32 i;
    for (i = 5; i < limit; i++, m++) {
        bool8 valid = (m->is_valid & 1) != 0;
        if (!valid) {
            return i;
        }
    }
    return -1;
}
