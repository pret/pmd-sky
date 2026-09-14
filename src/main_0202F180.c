#include "main_0202F180.h"
#include "main_0202AAA8.h"
#include "main_0200330C.h"
#include "main_02001188.h"
#include "main_02027648.h"
#include "main_02027AF0.h"
#include "main_02028080.h"

extern void sub_02026184(struct unk_02026130 *p, s32 a, s32 b);
extern void sub_02026194(struct unk_02026130 *p, u32 flags, char *string);
extern void sub_020261A4(struct unk_02026130 *p);
extern void sub_020261B4(struct unk_02026130 *p);
extern void sub_020261C4(struct unk_02026130 *p);
extern s32 sub_020261D4(struct unk_02026130 *p);
extern s32 sub_020261E4(struct unk_02026130 *p);
extern s32 sub_02026204(struct unk_02026130 *p);
extern void sub_02048240(char *str);
extern s32 PreprocessString(char *output, s32 size, const char *format, u32 flags,
                            struct preprocessor_args *args);
extern s32 PreprocessStringFromId(char *output, s32 size, s32 string_id, u32 flags,
                                  struct preprocessor_args *args);
extern void InitPortraitParams(portrait_params *p);
extern bool8 IsValidPortrait(portrait_params *p);
extern bool8 LoadPortrait(portrait_params *p, void *buf);
extern void sub_02027040(s32 window_id, void *buf, u32 a);
extern void sub_02026E3C(s32 window_id, void *buf, u32 a);
extern void sub_02028770(s32 window_id, Point pos);
extern WindowTemplate PORTRAIT_BOX_DEFAULT_WINDOW_PARAMS;

bool8 IsDialogueBoxActive(s32 window_id)
{
    struct unk_0202AAA8 *w = GetWindowContents(window_id);

    return w->field_0x8;
}

void sub_0202F190(s32 window_id, s32 a, s32 b)
{
    struct unk_0202F190 *box = GetWindowContents(window_id);

    sub_02026184(&box->field_0xC, a, b);
}

void ShowStringIdInDialogueBox(s32 window_id, u32 flags, s32 string_id,
                               struct preprocessor_args *args)
{
    struct unk_0202F190 *box = GetWindowContents(window_id);

    if (box->field_0x4 != 2) {
        sub_0202613C(&box->field_0xC);
        box->field_0x4 = 1;
    } else if (box->field_0x9 != 0) {
        sub_02048240(box->field_0x128);
    }
    box->field_0x8 = 1;
    box->field_0x9 = box->field_0xA;
    PreprocessStringFromId(box->field_0x128, 0x400, string_id, flags, args);
    sub_02026194(&box->field_0xC, flags, box->field_0x128);
}

void ShowStringInDialogueBox(s32 window_id, u32 flags, const char *string,
                             struct preprocessor_args *args)
{
    struct unk_0202F190 *box = GetWindowContents(window_id);

    if (box->field_0x4 != 2) {
        sub_0202613C(&box->field_0xC);
        box->field_0x4 = 1;
    } else if (box->field_0x9 != 0) {
        sub_02048240(box->field_0x128);
    }
    box->field_0x8 = 1;
    box->field_0x9 = box->field_0xA;
    PreprocessString(box->field_0x128, 0x400, string, flags, args);
    sub_02026194(&box->field_0xC, flags, box->field_0x128);
}

void sub_0202F2C4(s32 window_id)
{
    struct unk_0202F190 *box = GetWindowContents(window_id);

    switch (box->field_0x4) {
    case 1:
        box->field_0x4 = 4;
        box->field_0x8 = 1;
        break;
    case 2:
        sub_020261A4(&box->field_0xC);
        box->field_0x8 = 1;
        break;
    case 3:
    case 4:
        break;
    default:
        sub_0202613C(&box->field_0xC);
        box->field_0x4 = 0;
        box->field_0x8 = 0;
        break;
    }
}

void sub_0202F334(s32 window_id)
{
    struct unk_0202F190 *box = GetWindowContents(window_id);

    switch (box->field_0x4) {
    case 1:
        box->field_0x4 = 4;
        box->field_0x8 = 1;
        break;
    case 2:
        box->field_0x4 = 3;
        box->field_0x8 = 1;
        break;
    case 3:
    case 4:
        break;
    default:
        sub_0202613C(&box->field_0xC);
        box->field_0x4 = 0;
        box->field_0x8 = 0;
        break;
    }
}

void ShowDialogueBox(s32 window_id)
{
    struct unk_0202F190 *box = GetWindowContents(window_id);

    switch (box->field_0x4) {
    case 1:
    case 2:
        sub_020261C4(&box->field_0xC);
        break;
    case 3:
    case 4:
        break;
    default:
        sub_0202613C(&box->field_0xC);
        box->field_0x4 = 0;
        box->field_0x8 = 0;
        break;
    }
}

void sub_0202F3F8(s32 window_id)
{
    struct unk_0202F190 *box = GetWindowContents(window_id);

    switch (box->field_0x4) {
    case 1:
    case 2:
        sub_020261B4(&box->field_0xC);
        break;
    case 3:
    case 4:
        break;
    default:
        sub_0202613C(&box->field_0xC);
        box->field_0x4 = 0;
        box->field_0x8 = 0;
        break;
    }
}

void ReadStringFromDialogueBox(s32 window_id, char *dest, s32 n)
{
    struct unk_0202F190 *box = GetWindowContents(window_id);

    MemcpySimple((u8 *)dest, (u8 *)box->field_0x128, n);
}

void sub_0202F474(s32 window_id, s32 a)
{
    struct unk_0202F190 *box = GetWindowContents(window_id);

    box->field_0xA = a;
}

void UpdateDialogueBox(struct Window *w)
{
    struct unk_0202F190 *box = (struct unk_0202F190 *)w->template.unk0C;
    u8 was_busy;

    switch (box->field_0x4) {
    case 0:
        if (!sub_020261D4(&box->field_0xC)) {
            box->field_0x8 = 0;
            return;
        }
        box->field_0x4 = 1;
        box->field_0x8 = 1;
        w->unkB8 = -1;
    case 1:
        box->field_0x8 = 1;
        if (!sub_0202810C(w->id)) {
            return;
        }
        box->field_0x4 = 2;
    case 2:
        if (sub_02026204(&box->field_0xC) == 0x10) {
            box->field_0x4 = 3;
            box->field_0x8 = 1;
            return;
        }
        was_busy = box->field_0x8;
        box->field_0x8 = sub_020261E4(&box->field_0xC);
        if (was_busy == 0) {
            return;
        }
        if (box->field_0x8 != 0) {
            return;
        }
        if (box->field_0x9 == 0) {
            return;
        }
        sub_02048240(box->field_0x128);
        box->field_0x9 = 0;
        return;
    case 3:
        box->field_0x4 = 4;
        box->field_0x8 = 1;
        return;
    case 4:
        if (sub_0202812C(w->id)) {
            sub_0202613C(&box->field_0xC);
            box->field_0x4 = 0;
            box->field_0x8 = 0;
            w->unkB8 = -6;
        }
        return;
    }
}

s8 CreatePortraitBox(s32 bg_id, s32 a, s32 b)
{
    WindowTemplate tmpl;
    struct unk_0202F5AC *box;

    box = MemAlloc(0x380, 8);
    tmpl = PORTRAIT_BOX_DEFAULT_WINDOW_PARAMS;
    tmpl.unk00 = (u32)UpdatePortraitBox;
    tmpl.unk0C = (u32)box;
    tmpl.bg_id = bg_id;
    tmpl.unk09 = b != 0 ? -4 : -7;
    box->field_0x2A = b;
    box->field_0x0 = NewWindowScreenCheck((s32)&tmpl, 3);
    box->field_0x4 = 0;
    InitPortraitParams(&box->field_0x8);
    InitPortraitParams(&box->field_0x18);
    box->field_0x2C = a;
    box->field_0x28 = 0;
    box->field_0x29 = 0;
    return box->field_0x0;
}

void ClosePortraitBox(s32 window_id)
{
    MemFree(GetWindowContents(window_id));
    DeleteWindow(window_id);
}

bool8 PortraitBoxNeedsUpdate(s32 window_id)
{
    struct unk_0202F5AC *box = GetWindowContents(window_id);

    if (box->field_0x4 == 1 || box->field_0x4 == 2) {
        return TRUE;
    }
    return FALSE;
}

void ShowPortraitInPortraitBox(s32 window_id, portrait_params *p)
{
    struct unk_0202F5AC *box = GetWindowContents(window_id);

    if (box->field_0x4 != 2 && box->field_0x4 != 3) {
        box->field_0x4 = 1;
    }
    if (p != NULL) {
        box->field_0x18 = *p;
    } else {
        InitPortraitParams(&box->field_0x18);
    }
    box->field_0x28 = 1;
}

void HidePortraitBox(s32 window_id)
{
    struct unk_0202F5AC *box = GetWindowContents(window_id);

    box->field_0x28 = 0;
    InitPortraitParams(&box->field_0x18);
    if (box->field_0x4 != 0) {
        box->field_0x29 = 1;
    }
}

void UpdatePortraitBox(struct Window *w)
{
    struct unk_0202F5AC *box = (struct unk_0202F5AC *)w->template.unk0C;

    switch (box->field_0x4) {
    case 0:
        if (box->field_0x28 == 0) {
            return;
        }
        box->field_0x28 = 0;
        box->field_0x4 = 1;
        w->unkB8 = -1;
    case 1:
        if (!sub_0202811C(w->id)) {
            return;
        }
        box->field_0x4 = 2;
    case 2:
        box->field_0x28 = 0;
        box->field_0x8 = box->field_0x18;
        if (box->field_0x29 == 0) {
            if (IsValidPortrait(&box->field_0x8)) {
                if (LoadPortrait(&box->field_0x8, box->field_0x30)) {
                    sub_02027040(w->id, box->field_0x30, box->field_0x2C << 4);
                    sub_02026E3C(w->id, box->field_0x60, box->field_0x2C);
                    w->unk11 = box->field_0x8.hw_flip;
                    if (box->field_0x2A != 0) {
                        sub_02028080(box->field_0x0, -4);
                    } else {
                        sub_02028080(box->field_0x0, -7);
                    }
                    sub_02028770(w->id, box->field_0x8.offset);
                } else {
                    sub_0202836C(w->id);
                    sub_02027B1C(w->id);
                    sub_02028080(box->field_0x0, 0);
                    sub_02028770(w->id, box->field_0x8.offset);
                }
            } else {
                box->field_0x29 = 1;
            }
            box->field_0x4 = 3;
            w->unkB8 = -1;
        }
    case 3:
        if (box->field_0x28 != 0) {
            box->field_0x4 = 2;
            return;
        }
        if (box->field_0x29 != 0) {
            box->field_0x4 = 4;
        }
        return;
    case 4:
        if (sub_0202812C(w->id)) {
            InitPortraitParams(&box->field_0x8);
            box->field_0x29 = 0;
            box->field_0x4 = 0;
            w->unkB8 = -6;
        }
        return;
    }
}
