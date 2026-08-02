#ifndef PMD_SKY_OVERLAY_24_H
#define PMD_SKY_OVERLAY_24_H

#include "window.h"

struct overlay_24_unk1E8_sub {
    u32 unk0;
    u32 unk4;
    u8 fill8[0xA - 8];
    s16 unkA;
    u8 unkC;
    u8 unkD;
    u8 unkE;
    u8 unkF;
    u8 fill10[0x3A - 0x10];
    u8 unk3A;
};

struct overlay_24_unk1E8_sub* sub_02055DD0(s32, void*, void*, u16*, s32);      /* extern */


struct overlay_24 {

     // size: 0x2A8
    
    s32 unk0; // state
    s32 unk4;
    s32 unk8;
    s32 unkC;
    u8 fill10[0x14 - 0x10];
    s16 unk14;
    s16 unk16;
    s32 unk18;
    s32 unk1C;
    u8 unk20;
    u8 unk21;
    u8 unk22[0x20];
    u8 unk42[0x10];
    u8 unk52[0x14];
    u8 unk66[0x10];
    u8 fill62[0x166 - 0x76];
    u8 unk166[0x10];
    u8 fill176[0x17A - 0x176];
    s32 unk17A;
    u8 fill17E[0x1BC - 0x180];
    s16 unk1BC;
    u8 unk1BE;
    s32 unk1C0;
    s32 unk1C4;
    s32 unk1C8;
    s32 unk1CC;
    s16 unk1D0;
    s16 unk1D2;
    u8 fill1D4[0x1E0 - 0x1D4];
    s16 unk1E0;
    s16 unk1E2;
    s32 unk1E4;
    struct overlay_24_unk1E8_sub *unk1E8;
    s32 unk1EC;
    s8 unk1F0;
    u8 fill1F1[3];
    s32 unk1F4;
    s32 unk1F8;
    u8 fill1FC[0x20C - 0x1FC];
    s32 unk20C;
    s32 unk210;
    s32 unk214;
    s32 unk218;
    s32 unk21C;
    s32 unk220;
    u8 fill224[0x230 - 0x224];
    void *unk230;
    u8 fill234[0x244 - 0x234];
    s32 unk244;
    s32 unk248;
    u8 fill24C[0x28C - 0x24C];
    s8 unk28C; // Dialogue Box
    s8 unk28D;
    s8 unk28E;
    s8 unk28F;
    s32 unk290;
    /* 0x294 */ portrait_params *portrait_params;
    u8 fill298[0x2A4 - 0x298];
    s32 unk2A4;
};
    
extern struct overlay_24* OVERLAY24_UNKNOWN_POINTER__NA_238C600;

s32 ov24_0238A140(void);
s32 ov24_0238C1D4(void);
void ov24_0238C340(void);
s32 ov24_0238C36C(void);
void ov24_0238C47C(void);
void ov24_0238C4CC(void);

#endif /* ifndef PMD_SKY_OVERLAY_24_H */
