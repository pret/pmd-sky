#ifndef PMDSKY_OVERLAY_13_0238BDA8_H
#define PMDSKY_OVERLAY_13_0238BDA8_H

struct Overlay13Main
{
    u8 unk0;
    u8 unk1;
    s8 unk2;
    s8 unk3;
    s8 unk4;
    s8 unk5;
    s8 unk6;
    u8 unk7;
    u32 unk8;
    u8 unkC[0x14 - 0xC];
    u32 unk14;
    u32 unk18;
    u32 unk1C;
    u32 unk20;
    u32 unk24;
    u32 unk28;
    u8 fill2C[0x30 - 0x2C];
    u32 unk30;
    u8 unk34[0x10];
    u8 unk44[0x10];
    u8 unk54;
    u8 unk55[0x5D - 0x55];
    u8 unk5D;
    u8 unk5E;
    u8 unk5F;
    u16 unk60;
    u8 fill62[0x6C - 0x62];
    u32 unk6C;
    u8 fill70[0x370 - 0x70];
    u32 unk370;
    s16 unk374;
    u8 fill376[0x3B4 - 0x376];
    u32 unk3B4;
    u8 fill3B8[0x3C4 - 0x3B8];
    s32 unk3C4;
    u8 fill3C8[0x3E4 - 0x3C8];
    u32 unk3E4;
    u8 fill3E8[0x404 - 0x3E8];
    u32 unk404;
    u8 fill408[0x424 - 0x408];
    s16 unk424;
    u16 unk426;
};

// Returns the personality obtained after answering all the questions.
// The value to return is determined by checking the points obtained for each the personalities and returning the one with the highest amount of points.
// return: Personality (0-15)
s32 GetPersonality(void);

#endif //PMDSKY_OVERLAY_13_0238BDA8_H
