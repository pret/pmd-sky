#ifndef PMDSKY_MAIN_02056294_H
#define PMDSKY_MAIN_02056294_H

#include "main_02055770.h"

#include "util.h"
#include "common.h"

bool8 sub_02055B20(s16 idx);
void sub_02055B78(s16 idx, s16 monster_id, u8 joined_at, const char *name);
s16 sub_02055CCC(struct ground_monster *mon);
struct ground_monster* sub_02055D4C(struct ground_monster *mon);
void sub_02055D7C(s16 idx, struct ground_monster *mon);
struct ground_monster* sub_02055DD0(s16 monster_id, const char *name, u8 *joined, u16 *moves, u8 flag);
void sub_02055E14(struct unk_02055E14 *dst, struct ground_monster *mon);
void sub_02055F04(struct ground_monster *mon, struct unk_02055E14 *src);
bool8 sub_02055FCC(s16 member_idx, s16 item_id);
bool8 IsMonsterNotNicknamed(struct ground_monster *mon);
void GetRecoloredGroundMonsterName(char *dst, struct ground_monster *mon, s32 mode);
void sub_02056094(char *dst, struct ground_monster *mon, bool8 is_leader);
bool8 sub_020560A4(s32 a, s32 b);
void sub_020560B8(void);
void RemoveActiveMembersFromAllTeams(void);
void RemoveActiveMembersFromSpecialEpisodeTeam(void);
void RemoveActiveMembersFromRescueTeam(void);
bool8 sub_02056228(s32 idx);
bool8 CheckTeamMemberIdx(s32 idx);
bool8 IsMonsterIdInNormalRange(s16 id);
bool8 sub_020562B8(int a);
void SetActiveTeam(enum team_id team);
void sub_02056318(u8 a);
u8 sub_0205633C(void);
bool32 sub_02056360(void);
struct team_member* GetActiveTeamMember(s32 roster_idx);

#endif
