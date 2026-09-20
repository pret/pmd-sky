#include "main_0202B4C4.h"
#include "main_0202A66C.h"
#include "main_0202AAA8.h"
#include "main_02001188.h"
#include "main_02027648.h"
#include "main_02028284.h"
#include "main_020282F4.h"
#include "main_02032558.h"
#include "window.h"

extern s32 GetCurrentPage(struct unk_02032558 *p);
extern void *GetWindowContents(s32 window_id);
extern s32 GetSelectedItemOnPage(struct unk_02032558 *p);

extern WindowTemplate SIMPLE_MENU_DEFAULT_WINDOW_PARAMS;

extern void UpdateSimpleMenu(struct Window *w);
extern void sub_02031C74(struct unk_02032558 *p, u32 mask);
extern void sub_02031C84(struct unk_02032558 *p, u32 mask);
extern bool8 IsMenuOptionActive(struct unk_02032558 *p);
extern void PlayWindowInputSound(struct unk_02032558 *p, s32 sound);
extern void sub_02032984(struct unk_02032558 *p);
extern s32 sub_020265A8(u8 *str);
extern u8 sub_02031A5C(u32 flags, struct struct_2 *cfg, s32 width);
extern u8 CalcMenuHeightDiv8__02031AA4(u32 flags, struct struct_2 *cfg, s32 *count, s32 *n);
extern void InitWindowInput(struct unk_02032558 *p, u32 flags, struct struct_2 *cfg,
                            struct unk_02028284 *rect, s32 count, s32 n);
extern s32 PreprocessStringFromId(u8 *output, s32 output_size, s32 string_id,
                                  s32 flags, void *args);

void sub_0202B0A4(s32 window_id, s32 a)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);

    if (a != 0) {
        sub_02031C74((void *)menu + 4, 0xB000000);
        sub_02031C84((void *)menu + 4, 0x10);
    } else {
        sub_02031C84((void *)menu + 4, 0xB000000);
        sub_02031C74((void *)menu + 4, 0x10);
    }
}

s32 CreateSimpleMenuFromStringIds(WindowTemplate *params, u32 flags,
                                  struct struct_2 *cfg,
                                  struct unk_0202A5CC *items, s32 n)
{
    struct unk_0202A5CC *p;
    struct unk_0202A75C *buf;
    struct unk_0202A75C *q;
    s32 count;

    p = items;
    count = 0;
    while (p->field_0x0 != 0) {
        p++;
        count++;
    }

    buf = MemAlloc((count + 1) * sizeof(struct unk_0202A75C), 8);
    q = buf;
    while (items->field_0x0 != 0) {
        PreprocessStringFromId(q->field_0x0, 0x100, items->field_0x0, 0xC402,
                               NULL);
        q->field_0x100 = items->field_0x4;
        items++;
        q++;
    }
    q->field_0x0[0] = 0;
    q->field_0x100 = items->field_0x4;
    return CreateSimpleMenuInternal(params, flags, cfg, buf, n);
}

s32 CreateSimpleMenu(WindowTemplate *params, u32 flags, struct struct_2 *cfg,
                     struct unk_0202A75C *items, s32 n)
{
    struct unk_0202A75C *p;
    struct unk_0202A75C *buf;
    struct unk_0202A75C *q;
    s32 count;

    p = items;
    count = 0;
    while (!IsEmptyString(p->field_0x0)) {
        p++;
        count++;
    }

    buf = MemAlloc((count + 1) * sizeof(struct unk_0202A75C), 8);
    q = buf;
    while (!IsEmptyString(items->field_0x0)) {
        *q++ = *items++;
    }
    *q = *items;
    return CreateSimpleMenuInternal(params, flags, cfg, buf, n);
}

s32 CreateSimpleMenuInternal(WindowTemplate *params, u32 flags,
                             struct struct_2 *cfg, struct unk_0202A75C *items,
                             s32 n)
{
    WindowTemplate tmpl;
    struct unk_02028284 rect;
    s32 count;
    struct unk_0202AAA8 *menu;
    struct unk_0202A75C *p;
    s32 target;
    s32 sel;
    s32 width;
    s32 item_width;
    s32 window_id;

    menu = MemAlloc(0x1B4, 8);
    if (flags & 0x20) {
        target = cfg->b;
    } else {
        target = 0;
    }
    sel = 0;
    count = 0;
    p = items;
    flags |= 0x8000;
    if (params == NULL) {
        tmpl = SIMPLE_MENU_DEFAULT_WINDOW_PARAMS;
        flags |= 0x300000;
    } else {
        tmpl = *params;
        tmpl.unk00 = (u32)UpdateSimpleMenu;
    }
    tmpl.unk0C = (u32)menu;
    if (tmpl.width == 0) {
        width = 0;
        while (!IsEmptyString(p->field_0x0)) {
            item_width = sub_020265A8(p->field_0x0);
            if (item_width > width) {
                width = item_width;
            }
            p++;
        }
        tmpl.width = sub_02031A5C(flags, cfg, width + 0x10);
    }
    p = items;
    while (!IsEmptyString(p->field_0x0)) {
        if (p->field_0x100 == target) {
            sel = count;
        }
        p++;
        count++;
    }
    if (n <= 0) {
        n = count;
    }
    if (tmpl.height == 0) {
        tmpl.height = CalcMenuHeightDiv8__02031AA4(flags, cfg, &count, &n);
    } else {
        CalcMenuHeightDiv8__02031AA4(flags, cfg, &count, &n);
    }
    if (flags & 0x200000) {
        tmpl.x -= tmpl.width;
    }
    if (flags & 0x100000) {
        tmpl.y -= tmpl.height;
    }
    menu->field_0x0 = (u32)UpdateSimpleMenu;
    menu->field_0xFC = flags;
    if (cfg != NULL) {
        *(struct struct_2 *)&menu->field_0x100 = *cfg;
    }
    menu->field_0x100 = sel;
    menu->field_0x198 = items;
    menu->field_0x19C = 0;
    menu->field_0x1A0 = 0;
    menu->field_0x1A1 = 0;
    menu->field_0x1A4 = 0;
    menu->field_0x1AC = 0;
    menu->field_0x1B0 = 0;
    tmpl.bg_id = 0;
    window_id = NewWindowScreenCheck((s32)&tmpl, 3);
    GetWindowRectangle(window_id, &rect);
    InitWindowInput((void *)menu + 4, flags,
                    (struct struct_2 *)&menu->field_0x100, &rect, count, n);
    return window_id;
}

void ResumeSimpleMenu(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);

    menu->field_0x19C = 1;
    menu->field_0x1A0 = 0;
    menu->field_0x1A1 = 0;
    menu->field_0xFC &= ~0x800000;
    sub_02032984((void *)menu + 4);
}

void CloseSimpleMenu(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);

    MemFree(menu->field_0x198);
    MemFree(menu);
    DeleteWindow(window_id);
}

u32 IsSimpleMenuActive(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);
    s32 state = menu->field_0x19C;

    return state != 7 && state != 8;
}

bool8 CheckSimpleMenuField0x1A0(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);

    return menu->field_0x1A0 == 0;
}

s32 sub_0202B530(s32 window_id)
{
    return GetSelectedItemOnPage(GetWindowContents(window_id) + 4);
}

s32 sub_0202B544(s32 window_id)
{
    return GetCurrentPage(GetWindowContents(window_id) + 4);
}
