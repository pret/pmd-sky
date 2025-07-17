#ifndef PMDSKY_OVERLAY_31_02383478_H
#define PMDSKY_OVERLAY_31_02383478_H

struct loc_struct {
    u8 PAD_0x0000[4508];
    s16* field_0x119C;
    u8 PAD_0x11A0[18];
    u8 field_0x11B2;
    u8 field_0x11B3;
    struct item* field_0x11B4;
    u8 PAD_0x11B8[64];
    u8 field_0x11F8[127];
    u8 field_0x1277;
};

char* ov31_02383478(char* arg1, s32 arg2, u32 arg3);

#endif //PMDSKY_OVERLAY_31_02383478_H
