#ifndef PMDSKY_MAIN_0204DD80_H
#define PMDSKY_MAIN_0204DD80_H

typedef struct {
    union {
        u32 x;
        u8 y;
    };
    u8 auStack_20[20];
} UnkStruct_WonderMailPasswordToMission;

s32 WonderMailPasswordToMission(u8* param_1, u32 param_2);

#endif //PMDSKY_MAIN_0204DD80_H
