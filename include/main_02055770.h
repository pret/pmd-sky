#ifndef PMDSKY_MAIN_02055770_H
#define PMDSKY_MAIN_02055770_H

#include "util.h"
#include "common.h"

struct unk_02055E14_18 {
    u32 field_0x0[3];
};

struct unk_02055E14_2a {
    u16 field_0x0[12];
};

struct unk_02055E14 {
    u16 field_0x0;
    u8 field_0x2[2];
    u8 field_0x4;
    u8 field_0x5;
    u8 field_0x6;
    u8 field_0x7;
    s16 field_0x8;
    u8 field_0xa;
    u8 field_0xb;
    s16 field_0xc;
    s16 field_0xe;
    u8 field_0x10[2];
    u8 field_0x12[2];
    s32 field_0x14;
    struct unk_02055E14_18 field_0x18;
    u8 field_0x24;
    u8 field_0x25;
    s16 field_0x26;
    s16 field_0x28;
    struct unk_02055E14_2a field_0x2a;
    char field_0x42[10];
};


struct ground_monster* GetHero(void);
struct ground_monster* GetPartner(void);
struct ground_monster* GetMainCharacter1(void);
struct ground_monster* GetMainCharacter2(void);
struct ground_monster* GetMainCharacter3(void);
s16 sub_02055894(struct ground_monster *member);
s16 GetFirstMatchingMemberIdx(s16 monster_id);
s16 GetFirstEmptyMemberIdx(s16 monster_id);

#endif
