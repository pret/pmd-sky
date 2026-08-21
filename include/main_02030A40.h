#ifndef PMDSKY_MAIN_02030A40_H
#define PMDSKY_MAIN_02030A40_H

struct unk_02030A50 {
    u8 field_0x0[0xC0];
    s32 field_0xC0;
};

s32 GetAdvancedTextBoxFlags2(s32 window_id);
void sub_02030A50(s32 window_id, s32 value);
s32 sub_02030A64(s32 window_id);
void sub_02030A74(s32 window_id, u32 flags);

#endif
