#ifndef PMDSKY_MAIN_0205B690_H
#define PMDSKY_MAIN_0205B690_H

struct unkStruct_020B0A54_unk8_inner {
    u8 fill0[0x44];
    u16 unk44;
    u16 unk46;
    u16 unk48;
};

union unkStruct_020B0A54_unk8 {
    struct ground_monster *monster;
    struct unkStruct_020B0A54_unk8_inner *unk8;
};

struct unkStruct_020B0A54 {
    u8 unk0;
    u8 unk1[3];
    u32 unk4;
    union unkStruct_020B0A54_unk8 unk8;
    u8 unkC[150];
    u16 unkA2;
    u8 unkA4[10];
    u8 unkAE;
    u8 unkAF;
};

// Stupid hack but it's needed for some matches.
union unkStruct_020B0A54_union {
    struct unkStruct_020B0A54 *struct0;
    struct unkStruct_020B0A54 struct1;
    void (*fp[])(void);
};

s32 sub_0205B690(void);

#endif //PMDSKY_MAIN_0205B690_H
