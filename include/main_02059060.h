#ifndef PMDSKY_MAIN_02059060_H
#define PMDSKY_MAIN_02059060_H

// Returns the name of the explorer maze team. If the language of the team name is different from the
// language of selected in this game a default team name is written to the buffer instead.
// dest: [output] Buffer
void GetExplorerMazeTeamName(u8 *dest);
u64 sub_020590C0(void);
void sub_020590DC(u64 param0);
struct ground_monster* GetExplorerMazeMonster(s16 entry_number);

#endif //PMDSKY_MAIN_02059060_H
