#ifndef PMDSKY_MAIN_0201BCCC_H
#define PMDSKY_MAIN_0201BCCC_H

struct unk_oam_sub {
    u8 field_0x0[0x70];
};

struct unk_oam_elem {
    u8 field_0x0[0x78];
    u8 field_0x78;
    u8 field_0x79[0x23];
};

struct unk_0201BCCC {
    struct unk_oam_sub field_0x0[4];
    u8 field_0x1C0[0x1C08];
    struct unk_oam_elem field_0x1DC8[2];
};

void sub_0201BCCC(s32 idx);
void sub_0201BCF4(s32 idx);
void sub_0201BD1C(u32 a, s32 idx);
void sub_0201BD50(s32 a, s32 idx);
void sub_0201BD80(s32 a, s32 b, s32 idx);
void CopyAttributesToOamBothScreens(void);
void sub_0201BDEC(void);
void sub_0201BE28(void);
void GroupOamAttributesBothScreens(void);
void sub_0201BE84(void);

#endif
