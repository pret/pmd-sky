#ifndef PMDSKY_MAIN_02058FA4_H
#define PMDSKY_MAIN_02058FA4_H

#include "util.h"

struct unkStruct_02058FCC {
    s8 explorer_maze_team_native_language;
    u8 field_0x1;
    u8 explorer_maze_team_name[20];
    u16 fill_0x16;
    const u8 field_0x18[4][0x4c];
};

struct WriteMonsterInfoToSave_struct {
    u32 unk0;
    u32 unk4;
    s32 result;
    u32 unkC;
};

bool8 ExplorerMazeMonsterExists(void);
void sub_02058FCC(struct unkStruct_02058FCC *ptr);
// Returns the name of the explorer maze team. If the language of the team name is different from the
// language of selected in this game a default team name is written to the buffer instead.
// dest: [output] Buffer
void GetExplorerMazeTeamName(u8 *dest);
u64 sub_020590C0(void);
void sub_020590DC(u64 param0);
struct ground_monster* GetExplorerMazeMonster(s16 entry_number);
s32 WriteMonsterInfoToSave(void* start_addr, u32 total_len);

#endif //PMDSKY_MAIN_02058FA4_H
