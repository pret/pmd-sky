#ifndef PMDSKY_MAIN_02059060_H
#define PMDSKY_MAIN_02059060_H

struct WriteMonsterInfoToSave_struct {
    u32 unk0;
    u32 unk4;
    s32 result;
    u32 unkC;
};

// Returns the name of the explorer maze team. If the language of the team name is different from the
// language of selected in this game a default team name is written to the buffer instead.
// dest: [output] Buffer
void GetExplorerMazeTeamName(u8 *dest);
u64 sub_020590C0(void);
void sub_020590DC(u64 param0);
struct ground_monster* GetExplorerMazeMonster(s16 entry_number);
s32 WriteMonsterInfoToSave(void* start_addr, u32 total_len);

#endif //PMDSKY_MAIN_02059060_H
