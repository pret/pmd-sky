#ifndef PMDSKY_MAIN_020332AC_H
#define PMDSKY_MAIN_020332AC_H

struct unk_020332AC {
    s32 field_0x0;
    s32 field_0x4;
    u8 field_0x8[8];
    u32 field_0x10;
    u8 field_0x14[0xA0];
    s32 field_0xB4;
    s32 field_0xB8;
    u8 field_0xBC[8];
    s32 field_0xC4;
    s32 field_0xC8;
    s32 field_0xCC;
    u8 field_0xD0[0x14];
    s32 field_0xE4;
    s32 field_0xE8;
    s32 field_0xEC;
    s32 field_0xF0;
};

void InventoryMenuPreviousPage(struct unk_020332AC *m);
void InventoryMenuNext10Pages(struct unk_020332AC *m);
void InventoryMenuPrevious10Pages(struct unk_020332AC *m);
void sub_0203330C(struct unk_020332AC *m, s32 a);
s32 sub_02033350(struct unk_020332AC *m, s32 i);
s32 sub_0203336C(struct unk_020332AC *m);
s32 sub_02033390(struct unk_020332AC *m);
s32 sub_020333B4(struct unk_020332AC *m);
s32 sub_020333D8(struct unk_020332AC *m, s32 idx);
void sub_020333FC(struct unk_020332AC *m);

#endif
