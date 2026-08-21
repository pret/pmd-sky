#ifndef PMDSKY_OVERLAY_11_022FE490_H
#define PMDSKY_OVERLAY_11_022FE490_H

struct unk_022FE498 {
    s32 field_0x0;
    s32 field_0x4;
};

struct unk_022FE490 {
    u8 field_0x0[4];
    s16 field_0x4;
    u8 field_0x6[0xA];
    s32 field_0x10;
    s32 field_0x14;
    s32 field_0x18;
    s32 field_0x1C;
    s8 field_0x20;
    u8 field_0x21[3];
    s32 field_0x24;
    s32 field_0x28;
    s32 field_0x2C;
    s32 field_0x30;
    s32 field_0x34;
    s32 field_0x38;
    u8 field_0x3C[0xF0];
    s8 field_0x12C;
    u8 field_0x12D[3];
    s32 field_0x130;
    s32 field_0x134;
    s32 field_0x138;
    s32 field_0x13C;
    s32 field_0x140;
    s32 field_0x144;
    u8 field_0x148;
};

s16 GetIdLivePerformer(struct unk_022FE490 *p);
void GetCollisionBoxLivePerformer(struct unk_022FE490 *p, struct unk_022FE498 *out);

#endif
