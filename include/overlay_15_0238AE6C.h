#ifndef PMDSKY_OVERLAY_15_0238AE6C_H
#define PMDSKY_OVERLAY_15_0238AE6C_H

typedef struct {
    u8 fill0[0x54];
    u32 unk54;
    u8 fill58[0x68 - 0x58];
    u32 unk68;
    u8 fill3[0x80 - 0x6c];
    s8 unk80;
    u8 fill82[0x82 - 0x81];
    s8 unk82;
    s8 unk83;
    s8 unk84;
    u8 fillD8[0xD8 - 0x85];
    u8 unkD8;
} unkStruct_ov15_0238AE6C;

void ov15_0238AE6C(void);
s32 ov15_0238AE88(void);
void ov15_0238AE98(void);

#endif //PMDSKY_OVERLAY_15_0238AE6C_H

