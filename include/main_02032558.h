#ifndef PMDSKY_MAIN_02032558_H
#define PMDSKY_MAIN_02032558_H

struct unk_02032558 {
    u8 field_0x0[0xBC];
    s32 field_0xBC;
    s32 field_0xC0;
    s32 field_0xC4;
    s32 field_0xC8;
    s32 field_0xCC;
    s32 field_0xD0;
};


s32 GetSelectedItemOnPage(struct unk_02032558* p);
s32 GetCurrentPage(struct unk_02032558* p);
s32 GetPageStart(struct unk_02032558* p);
s32 GetSelectedMenuItemIdx(struct unk_02032558* p);

#endif
