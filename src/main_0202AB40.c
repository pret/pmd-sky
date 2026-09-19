#include "main_0202AB40.h"
#include "main_0202A66C.h"
#include "main_0202AAA8.h"
#include "main_02027AF0.h"
#include "main_020282F4.h"
#include "main_0203258C.h"
#include "main_020327CC.h"
#include "main_02032558.h"
#include "window.h"

extern void sub_02032684(struct unk_02032558 *p, s32 a);
extern void sub_02031C74(struct unk_02032558 *p, u32 mask);
extern void sub_02031C84(struct unk_02032558 *p, u32 mask);
extern s32 sub_02031C98(struct unk_02032558 *p, u32 *buttons, s32 *state, s32 a);
extern s32 sub_02032160(struct unk_02032558 *p, s32 *state, s32 a, s32 b, s32 c, s32 d);
extern s32 sub_02033758(struct unk_02032558 *p, u32 *buttons, s32 *state);
extern s32 sub_020323F8(struct unk_02032558 *p, u32 buttons, s32 idx, s32 a);
extern bool8 IsMenuOptionActive(struct unk_02032558 *p);
extern s32 sub_02032070(struct unk_02032558 *p);
extern s32 sub_0203250C(struct unk_02032558 *p, u32 buttons);
extern void PlayWindowInputSound(struct unk_02032558 *p, s32 sound);
extern void sub_02028948(s32 window_id, struct unk_02032558 *p);
extern void sub_020263C8(s32 window_id, s32 a, s32 y, u8 *str, u8 colour);
extern s32 sub_020265A8(u8 *str);
extern void sub_0202A03C(struct unk_02032558 *p, s32 window_id);

u32 IsParentMenuActive(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);
    s32 state = menu->field_0x19C;

    return state != 8 && state != 9;
}

bool8 CheckParentMenuField0x1A0(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);

    return menu->field_0x1A0 == 0;
}

s32 GetWindowIdSelectedItemOnPage(s32 window_id)
{
    return GetSelectedItemOnPage(GetWindowContents(window_id) + 4);
}

void sub_0202AB94(s32 window_id, s32 a)
{
    sub_02032684(GetWindowContents(window_id) + 4, a);
}

s32 GetSimpleMenuResult__0202AEA4(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);
    struct unk_0202A75C *items = menu->field_0x198;
    s32 idx;

    if (menu->field_0x1A0 != 0) {
        if (menu->field_0x1A1 != 0) {
            idx = GetTotalNumMenuItems((void *)menu + 4);
        } else {
            idx = GetSelectedMenuItemIdx((void *)menu + 4);
        }
        return items[idx].field_0x100;
    }
    return 0;
}

void UpdateParentMenu(struct Window *w)
{
    struct unk_0202AAA8 *menu;
    u32 buttons;
    s32 state[9];
    s32 changed;
    s32 r;

    menu = (struct unk_0202AAA8 *)w->template.unk0C;
    switch (menu->field_0x19C) {
        case 0:
            if (!sub_0202810C(w->id)) {
                break;
            }
            menu->field_0x1AC = menu->field_0x1A8;
            menu->field_0x19C = 2;
        case 1:
            if (menu->field_0x19C == 1) {
                menu->field_0x1AC = menu->field_0x1A8;
                menu->field_0x19C = 2;
                break;
            }
        case 2:
            if (menu->field_0x1A8 > 0) {
                if (menu->field_0x1AC > 0) {
                    menu->field_0x1AC--;
                }
                if (menu->field_0x1AC > 0) {
                    sub_02031C74((void *)menu + 4, 0x4000000);
                    menu->field_0x1A0 = 0;
                    menu->field_0x1A1 = 0;
                    menu->field_0x1A4 = 0;
                    w->unkB8 = -1;
                    sub_0202AF78(w);
                    break;
                }
                sub_02031C84((void *)menu + 4, 0x4000000);
            }
            menu->field_0x19C = 3;
        case 3:
            sub_0202AF78(w);
            if (menu->field_0xFC & 0x800000) {
                menu->field_0x19C = 9;
                menu->field_0x1A0 = 1;
                menu->field_0x1A1 = 0;
                menu->field_0x1A4 = 0;
                w->unkB8 = -4;
                break;
            }
            menu->field_0x19C = 4;
            menu->field_0x1A0 = 0;
            menu->field_0x1A1 = 0;
            menu->field_0x1A4 = 0;
            w->unkB8 = -1;
            break;
        case 4:
            changed = sub_02031C98((void *)menu + 4, &buttons, state, 1);
            if (buttons == 0 && (menu->field_0xFC & 1)) {
                r = sub_02032160((void *)menu + 4, state, 0x408, 0, 0, 1);
                if (r >= 0) {
                    sub_02032684((void *)menu + 4, r);
                    changed = 1;
                    buttons |= 1;
                }
            }
            if (buttons == 0) {
                changed |= sub_02033758((void *)menu + 4, &buttons, state);
            }
            if ((changed | sub_020323F8((void *)menu + 4, buttons,
                                        GetSelectedMenuItemIdx((void *)menu + 4),
                                        0)) != 0) {
                sub_0202AF78(w);
            }
            if (buttons & 1) {
                if (IsMenuOptionActive((void *)menu + 4)) {
                    if (!(menu->field_0xFC & 0x80000000)) {
                        PlayWindowInputSound((void *)menu + 4, 0);
                    }
                    menu->field_0x1A0 = 1;
                    menu->field_0x1A1 = 0;
                    menu->field_0x1A4 = buttons;
                    w->unkB8 = -4;
                    menu->field_0x19C = 5;
                } else {
                    PlayWindowInputSound((void *)menu + 4, 2);
                }
            } else if (buttons & 2) {
                PlayWindowInputSound((void *)menu + 4, 1);
                menu->field_0x1A0 = 1;
                menu->field_0x1A1 = 1;
                menu->field_0x1A4 = buttons;
                w->unkB8 = -5;
                menu->field_0x19C = 5;
            } else if (sub_0203250C((void *)menu + 4, buttons)) {
                menu->field_0x1A0 = 1;
                menu->field_0x1A1 = 0;
                menu->field_0x1A4 = buttons;
                w->unkB8 = -4;
                menu->field_0x19C = 5;
            }
            sub_02028948(w->id, (void *)menu + 4);
            break;
        case 5:
            if (sub_02032070((void *)menu + 4)) {
                break;
            }
        case 6:
            if (menu->field_0x1A1 == 0) {
                if (menu->field_0xFC & 0x400000) {
                    sub_0202AF78(w);
                    menu->field_0x19C = 9;
                    break;
                }
            } else if (*(u8 *)&menu->field_0x1B0 != 0) {
                menu->field_0x19C = 9;
                break;
            }
            menu->field_0x19C = 7;
        case 7:
            if (!sub_0202812C(w->id)) {
                break;
            }
            if (menu->field_0x1A1 != 0) {
                w->unkB8 = -5;
            } else {
                w->unkB8 = -4;
            }
            menu->field_0x19C = 8;
            break;
    }
}

void sub_0202AF78(struct Window *w)
{
    struct unk_0202AAA8 *menu;
    struct unk_0202A75C *item;
    s32 i;
    u8 *p;
    s32 highlight;
    s32 colour;

    menu = (struct unk_0202AAA8 *)w->template.unk0C;
    item = menu->field_0x198;
    if (menu->field_0xFC & 0x200) {
        p = menu->field_0x160;
    } else {
        p = NULL;
    }
    i = 0;
    sub_02027B1C(w->id);
    while (!IsEmptyString(item->field_0x0)) {
        highlight = 0;
        if (p != NULL) {
            if (*p & 2) {
                highlight = 1;
            }
            p++;
        }
        if (highlight) {
            colour = 0x42;
        } else {
            colour = 0x44;
        }
        sub_020263C8(w->id, 13, GetPageItemYOffset((void *)menu + 4, i),
                     item->field_0x0, colour);
        i++;
        item++;
    }
    sub_0202A03C((void *)menu + 4, w->id);
    UpdateWindow(w->id);
}

void sub_0202B030(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);

    if (IsMenuOptionActive((void *)menu + 4)) {
        if (!(menu->field_0xFC & 0x80000000)) {
            PlayWindowInputSound((void *)menu + 4, 0);
        }
        menu->field_0x1A0 = 1;
        menu->field_0x1A1 = 0;
        menu->field_0x1A4 = 1;
        sub_0202830C(window_id, -4);
        menu->field_0x19C = 6;
    } else {
        PlayWindowInputSound((void *)menu + 4, 2);
    }
}
