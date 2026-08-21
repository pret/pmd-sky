#ifndef PMDSKY_OVERLAY_11_022E7F28_H
#define PMDSKY_OVERLAY_11_022E7F28_H

struct unk_C_ROUTINES {
    u8 field_0x0[8];
};

struct unk_02320904 {
    s16 field_0x0;
    s16 field_0x2;
};

struct unk_02324FA0 {
    u16 *field_0x0;
    u16 *field_0x4;
};

void ov11_022E7F28(void);
void ov11_022E7F34(void);
void ov11_022E7F80(void);
struct unk_C_ROUTINES * ov11_022E7FA8(s32 idx);

#endif
