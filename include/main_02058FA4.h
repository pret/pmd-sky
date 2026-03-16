#ifndef PMDSKY_MAIN_02058FA4_H
#define PMDSKY_MAIN_02058FA4_H

#include "util.h"

struct unkStruct_sub_02058FCC {
    s8 explorer_maze_team_native_language;
    u8 field_0x1;
    u8 explorer_maze_team_name[20];
    u16 fill_0x16;
    const u8 field_0x18[4][0x4c];
};

bool8 ExplorerMazeMonsterExists(void);
void sub_02058FCC(struct unkStruct_sub_02058FCC *ptr);

#endif //PMDSKY_MAIN_02058FA4_H
