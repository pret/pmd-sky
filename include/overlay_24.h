#ifndef PMD_SKY_OVERLAY_24_H
#define PMD_SKY_OVERLAY_24_H

struct overlay_24 {
    s32 unk0; // state
    s32 unk4;
    s32 unk8;
    s32 unkC;
    u8 fill10[0x1C - 0x10];
    s32 unk1C;
    u8 fill20[0x22 - 0x20];
    u8 unk22[0x20];
    u8 unk42[0x20];
    u8 fill46[0x1E8 - 0x62];
    s32 unk1E8;
    u8 fill1EC[0x28C - 0x1EC];
    s8 unk28C; // Dialogue Box
    s8 unk28D;
    s8 unk28E;
    s8 unk28F;
    
};
    
extern struct overlay_24* OVERLAY24_UNKNOWN_POINTER__NA_238C600;

extern s32 ov24_0238A140(void);

#endif /* ifndef PMD_SKY_OVERLAY_24_H */
