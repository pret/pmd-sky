#ifndef PMDSKY_OVERLAY_15_0238AD78_H
#define PMDSKY_OVERLAY_15_0238AD78_H

typedef struct {
    u8 fill0[0x54];
    u32 unk54;
    u8 fill58[0x68 - 0x58];
    s8 unk68;
} unkStruct_ov15_0238AD78;

void ov15_0238AD78(u8 r0);

#endif //PMDSKY_OVERLAY_15_0238AD78_H
