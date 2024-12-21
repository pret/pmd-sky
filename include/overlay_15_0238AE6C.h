#ifndef PMDSKY_OVERLAY_15_0238AE6C_H
#define PMDSKY_OVERLAY_15_0238AE6C_H

typedef struct {
    s32 unk0;
    u8 fill20[0x20 - 0x5];
    s8 unk20;
    u8 fill54[0x54 - 0x21];
    u32 unk54;
    u8 fill68[0x68 - 0x58];
    u32 unk68;
    u8 fill80[0x80 - 0x6c];
    s8 unk80;
    s8 unk81;
    s8 unk82;
    s8 unk83;
    s8 unk84;
    u8 fillD8[0xD8 - 0x85];
    u8 unkD8;
} unkStruct_ov15_0238AE6C;

void ov15_0238AE6C(void);
s32 ov15_0238AE88(void);
void ov15_0238AE98(void);
int ov15_0238AF54(void);

#endif //PMDSKY_OVERLAY_15_0238AE6C_H
