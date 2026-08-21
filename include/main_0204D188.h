#ifndef PMDSKY_MAIN_0204D188_H
#define PMDSKY_MAIN_0204D188_H

#include "util.h"

struct unk_020AFE60 {
    u32 field_0x0[0x25];
    u32 field_0x94[1];
    u32 field_0x98[0x2A];
    u8 field_0x140[3];
    u8 field_0x143[0xB4];
    u8 field_0x1F7[1];
    u32 field_0x1F8;
};

bool8 GetMonsterFlag1(s16 id);
void SetMonsterFlag2(s16 id);
bool8 HasMonsterBeenAttackedInDungeons(s16 id);
void SetDungeonTipShown(s32 idx);
bool8 GetDungeonTipShown(s32 idx);
void SetMaxReachedFloor(u32 idx, u8 floor);
u8 GetMaxReachedFloor(u32 idx);
void IncrementNbAdventures(void);
u32 GetNbAdventures(void);
s32 CanMonsterSpawn(void);

#endif
