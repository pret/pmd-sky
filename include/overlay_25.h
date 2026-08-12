#ifndef PMD_SKY_OVERLAY_25_H
#define PMD_SKY_OVERLAY_25_H

struct overlay_25 {

    // size: 0x150

    s32 unk0;
    s32 unk4;
    s32 unk8;
    s16 unkC;
    u16 unkE;
    u8 fill10[0x14 - 0x10];

    s32 unk14;
    s32 unk18;
    s32 unk1C;
    s32 unk20;
    s32 unk24;
    s32 unk28;

    u8 fill2C[0x38 - 0x2C];

    s32 unk38;
    s32 unk3C;
    u8 fill40[0x4C - 0x40];
    
    s32 unk4C;
    s32 unk50;
    s32 unk54;
    s32 unk58;
    s32 unk5C;
    s32 *unk60;
    u8 fill64[0x74 - 0x64];
    s32 unk74;
    u8 unk78[0x40];
    s32 unkB8;
    u8 fillBC[0x138 - 0xBC];
    s8 unk138;
    s8 unk139;
    s8 unk13A;
    s8 unk13B;
    s8 unk13C;
    s8 unk13D;
    s8 unk13E;
    s8 unk13F;
    s32 unk140;
    u8 fill144[0x150 - 0x144];
};


s32 ov25_0238A140(void);
void ov25_0238A694(s32 arg0);
s32 ov25_0238B134(void);
void ov25_0238B1CC(void);
s32 ov25_0238B1F8(void);
void ov25_0238B380(void);
void ov25_0238B414(char *output);

#endif /* ifndef PMD_SKY_OVERLAY_25_H */
