#include "main_0202FD3C.h"
#include "main_0202AAA8.h"
#include "main_0200C4FC.h"
#include "main_02001188.h"
#include "main_02027648.h"
#include "main_02027AF0.h"
#include "main_02028080.h"

extern void GetPressedButtons(u32 a, u16 *out);
extern s32 PreprocessString(char *output, s32 size, const char *format, u32 flags,
                            struct preprocessor_args *args);
extern s32 sub_020265A8(char *str);
extern void UpdateAreaNameBox(struct Window *w);
extern WindowTemplate TEXT_BOX_DEFAULT_WINDOW_PARAMS;
extern WindowTemplate AREA_NAME_BOX_DEFAULT_WINDOW_PARAMS;
extern char _0209AF6C[];

s8 CreateTextBox(WindowTemplate *params, void (*cb)(s32 window_id))
{
    struct unk_0202F8C4 *box = CreateTextBoxInternal(params);

    box->field_0x4 = cb;
    return box->field_0x0;
}

s8 CreateTextBoxWithArg(WindowTemplate *params,
                        void (*cb)(s32 window_id, void *arg), void *arg)
{
    struct unk_0202F8C4 *box = CreateTextBoxInternal(params);

    box->field_0x14 = arg;
    box->field_0x8 = cb;
    return box->field_0x0;
}

void CloseTextBox(s32 window_id)
{
    MemFree(GetWindowContents(window_id));
    DeleteWindow(window_id);
}

void CloseTextBox2(s32 window_id)
{
    GetWindowContents(window_id);
    sub_0202836C(window_id);
    sub_02027B1C(window_id);
    sub_0202F954(window_id);
    MemFree(GetWindowContents(window_id));
    DeleteWindow(window_id);
}

void sub_0202F954(s32 window_id)
{
    struct unk_0202F8C4 *box = GetWindowContents(window_id);

    switch (box->field_0x10) {
    case 1:
        box->field_0x10 = 5;
        break;
    case 2:
        box->field_0x10 = 3;
        break;
    case 3:
        box->field_0x10 = 4;
        break;
    case 4:
    case 5:
    case 6:
        break;
    default:
        box->field_0x10 = 0;
        break;
    }
}

s32 IsTextboxState3(s32 window_id)
{
    struct unk_0202F8C4 *box = GetWindowContents(window_id);

    if (box->field_0x10 == 3) {
        box->field_0x10 = 2;
        return TRUE;
    }
    return FALSE;
}

struct unk_0202F8C4* CreateTextBoxInternal(WindowTemplate *params)
{
    WindowTemplate tmpl;
    struct unk_0202F8C4 *box;

    box = MemAlloc(0x18, 8);
    if (params == NULL) {
        tmpl = TEXT_BOX_DEFAULT_WINDOW_PARAMS;
    } else {
        tmpl = *params;
    }
    tmpl.unk00 = (u32)UpdateTextBox;
    tmpl.unk0C = (u32)box;
    box->field_0x0 = NewWindowScreenCheck((s32)&tmpl, 3);
    box->field_0x4 = NULL;
    box->field_0x8 = NULL;
    box->field_0x14 = NULL;
    box->field_0x10 = 0;
    box->field_0xC = UpdateTextBox;
    return box;
}

void UpdateTextBox(struct Window *w)
{
    struct unk_0202F8C4 *box = (struct unk_0202F8C4 *)w->template.unk0C;
    u16 buttons;

    GetPressedButtons(0, &buttons);
    switch (box->field_0x10) {
    case 0:
        w->unkB8 = -1;
        box->field_0x10 = 1;
    case 1:
        if (!sub_0202810C(w->id)) {
            return;
        }
        box->field_0x10 = 2;
    case 2:
        if (box->field_0x8 != NULL) {
            box->field_0x8(w->id, box->field_0x14);
        } else if (box->field_0x4 != NULL) {
            box->field_0x4(w->id);
        }
        box->field_0x10 = 3;
        return;
    case 3:
        if (w->template.bg_id == 1) {
            return;
        }
        if ((buttons & 2) && w->template.unk09 != -2 &&
            w->template.unk09 != -5 && w->template.unk09 != -8 &&
            w->template.unk09 != -9) {
            box->field_0x10 = 4;
        }
        if (box->field_0x10 != 4) {
            return;
        }
    case 4:
        sub_0202836C(w->id);
        sub_02027B1C(w->id);
        box->field_0x10 = 5;
    case 5:
        if (sub_0202812C(w->id)) {
            box->field_0x10 = 6;
            w->unkB8 = -6;
        }
        return;
    case 6:
        w->unkB8 = -5;
        box->field_0x10 = 7;
        return;
    }
}

bool8 IsTextBoxActive(s32 window_id)
{
    struct unk_0202F8C4 *box = GetWindowContents(window_id);

    return box->field_0x10 != 7;
}

s32 CreateAreaNameBox(WindowTemplate *params, u32 flags, struct struct_2 *cfg,
                      s32 a)
{
    WindowTemplate tmpl;
    struct preprocessor_args args;
    struct unk_0202FBBC *box;
    s32 width;

    box = MemAlloc(0x1B4, 8);
    box->field_0xA4 = a;
    args.id_vals[0] = a;
    PreprocessString(box->field_0xAC, 0x100, _0209AF6C, 0xC402, &args);
    width = sub_020265A8(box->field_0xAC);
    box->field_0xA8 = width;
    if (params == NULL) {
        tmpl = AREA_NAME_BOX_DEFAULT_WINDOW_PARAMS;
        flags |= 0x300000;
    } else {
        tmpl = *params;
        tmpl.unk00 = (u32)UpdateAreaNameBox;
    }
    tmpl.unk0C = (u32)box;
    if (tmpl.width == 0) {
        tmpl.width = (width + 7) / 8;
    }
    if (tmpl.height == 0) {
        tmpl.height = 2;
    }
    if (flags & 0x200000) {
        tmpl.x -= tmpl.width;
    }
    if (flags & 0x100000) {
        tmpl.y -= tmpl.height;
    }
    box->field_0x1B0 = (tmpl.width * 8 - box->field_0xA8) / 2;
    box->field_0x1AC = (tmpl.height * 8 - 12) / 2;
    if (box->field_0x1B0 < 0) {
        box->field_0x1B0 = 0;
    }
    box->field_0x0 = UpdateAreaNameBox;
    box->field_0x4 = flags;
    if (cfg != NULL) {
        box->field_0x8 = *cfg;
    }
    box->field_0xA0 = 0;
    return NewWindowScreenCheck((s32)&tmpl, 3);
}

void SetAreaNameBoxState3(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    w->field_0xA0 = 3;
}
