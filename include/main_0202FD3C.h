#ifndef PMDSKY_MAIN_0202FD3C_H
#define PMDSKY_MAIN_0202FD3C_H

#include "util.h"
#include "window.h"

struct unk_0202F8C4 {
    s8 field_0x0;
    u8 field_0x1[3];
    void (*field_0x4)(s32 window_id);
    void (*field_0x8)(s32 window_id, void *arg);
    void (*field_0xC)(struct Window *w);
    s32 field_0x10;
    void *field_0x14;
};

struct unk_0202FBBC {
    void (*field_0x0)(struct Window *w);
    u32 field_0x4;
    struct struct_2 field_0x8;
    s32 field_0xA0;
    s32 field_0xA4;
    s32 field_0xA8;
    char field_0xAC[0x100];
    s32 field_0x1AC;
    s32 field_0x1B0;
};

s8 CreateTextBox(WindowTemplate *params, void (*cb)(s32 window_id));
s8 CreateTextBoxWithArg(WindowTemplate *params, void (*cb)(s32 window_id, void *arg), void *arg);
void CloseTextBox(s32 window_id);
void CloseTextBox2(s32 window_id);
void sub_0202F954(s32 window_id);
s32 IsTextboxState3(s32 window_id);
struct unk_0202F8C4* CreateTextBoxInternal(WindowTemplate *params);
void UpdateTextBox(struct Window *w);
bool8 IsTextBoxActive(s32 window_id);
s32 CreateAreaNameBox(WindowTemplate *params, u32 flags, struct struct_2 *cfg, s32 a);
void SetAreaNameBoxState3(s32 window_id);

#endif
