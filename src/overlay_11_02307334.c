#include "overlay_11_02307334.h"
#include "item.h"
#include "item_util.h"
#include "game_mode.h"
#include "main_0200C4FC.h"
#include "main_0200EDC0.h"
#include "main_0200F370.h"
#include "main_0200F798.h"
#include "main_02017B58.h"
#include "main_02017C80.h"
#include "main_0202593C.h"
#include "main_02027AF0.h"
#include "main_0202AAA8.h"
#include "main_0202AB40.h"
#include "main_0202B4C4.h"
#include "main_0202F180.h"
#include "main_02058CD8.h"
#include "main_02058E68.h"
#include "overlay_10_022BCC60.h"
#include "overlay_31_02382820.h"
#include "main_020114F8.h"
#include "main_0203088C.h"
#include "main_02001188.h"
#include "common.h"
#include <stdarg.h>
#include "main_020251AC.h"
#include "main_020502B0.h"
#include "main_02026174.h"
#include "main_0202B558.h"
#include "main_02055410.h"
#include "main_02056294.h"
#include "main_020526EC.h"
#include "main_0203755C.h"
#include "main_0200330C.h"
#include "main_020307A4.h"
#include "main_0202A66C.h"

struct unk_0202A690 { char *field_0x0; s32 field_0x4; };
struct unk_0230A044 { s32 field_0x0; s16 field_0x4; };
struct unk_02309EE4 { struct unk_0230A044 field_0x0[6]; s32 field_0x30; };
struct unk_023090DC {
    struct unk_02309EE4 field_0x0;
    s32 field_0x34;
    struct unk_0202A690 field_0x38[7];
    u8 field_0x70[6];
    char field_0x76[6][0x100];
};

struct unk_02324D90 {
    s32 field_0x0;
    s8 field_0x4;
    s8 field_0x5;
    u8 field_0x6[3];
    s8 field_0x9;
    s8 field_0xa;
    s8 field_0xb;
    u8 field_0xc[4];
    s32 field_0x10;
    s32 field_0x14;
    s32 field_0x18;
    s16 field_0x1c;
    u8 field_0x1e[0x20];
#ifdef JAPAN
    u8 field_0x3e[0xA];
    u8 field_0x52[0xA];
    u8 field_0x66[0xA];
#else
    u8 field_0x3e[0x14];
    u8 field_0x52[0x14];
    u8 field_0x66[0x14];
#endif
    u32 field_0x7c;
    u8 field_0x80[4];
    s16 field_0x84;
    u8 field_0x86[2];
    s32 field_0x88;
    u8 field_0x8c[0x50];
    u8 *field_0xdc;
    u8 field_0xe0[0x34];
    s32 field_0x114;
    s16 field_0x118;
    u8 field_0x11a[2];
    struct unk_023090DC field_0x11c;
};

extern struct unk_02324D90 *ov11_02324D90;
extern char ov11_02322DB8[];

extern u8 ov11_02322DD0[];
extern u8 ov11_02322DE0[];
extern struct unk_0202A5CC ov11_02322E00[];
extern struct unk_0202A5CC ov11_02322E28[];
extern char ov11_02322E58[];
extern char ov11_02322E7C[];
extern char ov11_02322EA0[];

extern void CreateMonsterSummaryFromTeamMember(struct monster_summary *monster_summary, struct team_member *team_member, bool8 is_leader);
extern s32 GetKeyboardStatus();
extern int PreprocessString(char* output, int output_size, const char* format, u16 flags, struct preprocessor_args* args);
extern void ShowKeyboard(s32 mode, u8 *, s32, u8 *);
extern s32 sub_02037468();
extern void sub_0203909C(u8 *name);
extern s32 sub_02039218();
extern s32 sub_0203931C();
extern u8 CreateParentMenu(void *a, u32 b, void *c, struct unk_0202A690 *items);
extern void ResumeParentMenu(s8 menu_id);
extern void PrintIqSkillsMenu(s16 monster_id, u32 *iq_skill_flags, s16 iq, s32 d);
extern void RecolorNameString(char *dst, const char *src, s32 mode);
extern s32 StrcmpMonsterName(u8 *name, s16 monster_id);
extern s32 sub_02028354(s8);
extern s8 sub_0203F150(struct monster_summary *summary, s32 b);
extern s32 sub_0203F398(void);
extern void sub_0203F974(void);
extern void sub_0203F990(void);
extern s8 sub_0204018C(s32 a, s32 b, s32 c);
extern s32 sub_02041A18(void);
extern s32 sub_02041B7C(void);
extern void sub_020420F4(void);
extern s32 sub_02053D1C(u16 move_id, s16 monster_id);
extern s32 sub_020586F0(s16 a, s16 b);

extern s32 ov11_02309EE4(struct unk_02309EE4 *out, s32 mode);
extern u8 *ov11_0230A044(struct unk_0230A044 *entry);
extern void ov11_0230D000(void);
extern s32 ov11_0230D220(void);
extern void ov11_0230D92C(void);
extern void ov11_02310BDC(void);

#ifdef JAPAN
#define OV11_023090DC_CONST_1 0x2FF2
#define OV11_023090DC_CONST_2 0x875
#else
#define OV11_023090DC_CONST_1 0x2F2
#define OV11_023090DC_CONST_2 0xA3A
#endif

extern bool8 sub_020564B0(int idx);
extern s32 vsprintf(u8 *str, const u8 *format, va_list ap);
extern s8 CreateDialogueBox(s8);
extern void CloseDialogueBox(s8);
extern void sub_0203FA64(s16 idx);
extern void sub_0203FBD4(s16 idx);

struct unk_02324D8C {
    s32 field_0x0;                      s8 field_0x4;
    s8 field_0x5;
    s8 field_0x6;
    s8 field_0x7;
    s8 field_0x8;
    s8 field_0x9;
    s8 field_0xa;
    s8 field_0xb;
    s8 field_0xc;
    u8 field_0xd[3];
    s32 field_0x10;
    s32 field_0x14;
    s32 field_0x18;
    struct struct_2 field_0x1c;         struct preprocessor_args field_0xb4; u8 field_0x104[0x32];
    char field_0x136[0x102];
    struct unk_02308F4C field_0x238;    s16 field_0x24c;
    s16 field_0x24e;
    s16 field_0x250;
    u16 field_0x252;
    s16 field_0x254;
    u8 field_0x256[0x20];
    u8 field_0x276[0xa];
    u8 field_0x280[0x45];
    u8 field_0x2c5[0x45];
    u8 field_0x30a[2];
    s32 field_0x30c;
    s32 field_0x310;
    s32 field_0x314;
    s32 field_0x318;
    u8 field_0x31c[8];
    void *field_0x324;
    u16 field_0x328[2];
    s32 field_0x32c;
};

extern struct unk_02324D8C *ov11_02324D8C;

extern struct unk_0202A5CC ov11_02322D38[];
extern s32 ov11_02322C78;
extern s32 ov11_02322C88;
extern s32 ov11_02322C98;
extern s32 ov11_02322CA8;
extern s32 ov11_02322CB8;
extern WindowTemplate ov11_02322CC8;
extern struct unk_0202A5CC ov11_02322CD8[];
extern struct unk_0202A5CC ov11_02322CF0[];
extern struct unk_0202A5CC ov11_02322D10[];
extern struct unk_0202A5CC ov11_02322D60[];
extern struct unk_0202A5CC ov11_02322D88[];
extern u8 ov11_02322DB0[];

extern void CloseScrollBox(s8);                                          extern void CloseTextBox2(s8);extern s8 CreateScrollBoxSingle(void *, s32, s32, s32, void *, s32, void *);  extern s8 CreateTextBox(void *, void *);
extern void GetPressedButtons(u32, u16 *);
extern void InitPreprocessorArgs(struct preprocessor_args *);
extern s32 IsScrollBoxActive(s8);                                        extern void ShowDialogueBox(s8);                                         extern void ShowStringIdInDialogueBox(s8, s32, s32, void *);             extern void ov11_022DC504(void);
extern u8 *strcpy(u8 *dest, const u8 *src);

extern s8 CreateInventoryMenuOuter(s32, s32, s32, void *, void *, void *, u8);
extern bool8 IsBagNotEmpty(void);
extern u8 PopInventoryMenuField0x1A3(s32 window_id);
extern void SortItemsInBag(void);
extern void *memcpy(void *, const void *, u32);
extern s32 ov11_02307300(s32, s32, s32);
extern void sub_0203FD14(u16 move_id);
extern struct move *sub_0203FD2C(void);
extern void *sub_0203FD38(void);
extern s16 sub_0203FD80(s32);
extern s16 sub_0203FDEC(s16);
extern s8 sub_0204019C(s32, s32, s32, void *);
extern void sub_020407C0(void);
extern int sub_020407EC(void);
extern s16 sub_02041094(void);
extern u16 sub_02041154(s32);
extern bool8 sub_02041364(s32);
extern void sub_02041484(void);
extern bool8 sub_020415BC(void);
extern s16 sub_02041614(u16 move_id);
extern void sub_020416FC(void);
extern s8 sub_020417A8(void *, s32, s32, s32);
extern void sub_02041A00(void);
extern void *sub_02044688(s16, s32, s32, s32, u8, s32);
extern int sub_02044800(void *);
extern void sub_020448EC(void **);
extern s32 sub_02053CA0(u16 *out, s32 limit, s16, u8);
extern void sub_020582E0(u8 held_by);
extern void sub_02058794(s16);

#ifdef JAPAN
#define OV11_02307334_OFFSET 0x2D20
#define OV11_02307334_OFFSET_2 0x1458
#define OV11_02307334_OFFSET_3 0x1567
#else
#define OV11_02307334_OFFSET 0
#define OV11_02307334_OFFSET_2 0
#define OV11_02307334_OFFSET_3 0
#endif

s32 ov11_02307334(void)
{
    struct struct_2          menu_b;
    struct struct_2          menu_a;
    struct preprocessor_args args;

    switch (ov11_02324D8C->field_0x0) {
    case 0: {
        ov11_02324D8C->field_0x4 = CreateInventoryMenuOuter(GetNbItemsInBag(), 0, ov11_02324D8C->field_0x10, ov11_02324D8C->field_0x104, ov11_02307300, ov11_02324D8C->field_0x31c, 0);
        ov11_02324D8C->field_0x5 = CreateTextBox(&ov11_02322C88, 0);
        ov11_02324D8C->field_0x18 = -1;
        ov11_02324D8C->field_0x0 = 1;
        break;
    }
    case 2: {
        if (!IsBagNotEmpty()) {
            SetInventoryMenuState6(ov11_02324D8C->field_0x4);
            ov11_02324D8C->field_0x0 = 0xc;
            break;
        }
        ov10_022BCC7C(ov11_02324D8C->field_0x4);
        ov11_02324D8C->field_0x0 = 1;
        break;
    }
    case 1: {
        u8   v1;
        char buf[0x400];
        u16  buttons;

        GetPressedButtons(0, &buttons);
        v1 = PopInventoryMenuField0x1A3(ov11_02324D8C->field_0x4);
        if ((buttons & 4) || (buttons & 0x800) || v1) {
            if (!v1) {
                PlaySeVolumeWrapper(5);
            }
            SortItemsInBag();
            ov11_02324D8C->field_0x10 = 0;
            ov10_022BCC60(ov11_02324D8C->field_0x4, GetNbItemsInBag());
            ov11_02324D8C->field_0x18 = -1;
            ov10_022BCCB0(ov11_02324D8C->field_0x4);
        } else {
            s8 v2 = ov11_02324D8C->field_0x5;

            if (v2 != -2) {
                s32 v3 = ov10_022BCDA8(ov11_02324D8C->field_0x4);

                if (ov11_02324D8C->field_0x18 != v3) {
                    struct item *v4 = GetItemAtIdx(v3);

                    ov11_02324D8C->field_0x18 = v3;
                    sub_02027B1C(v2);
                    if ((bool8)((v4->flags & 1) != 0)) {
#ifdef EUROPE
                        strcpy(buf, StringFromId((u16)(v4->id + 0x2f4b)));
#elif defined(JAPAN)
                        strcpy(buf, StringFromId((u16)(v4->id + 0x1d41)));
#else
                        strcpy(buf, StringFromId((u16)(v4->id + 0x2f49)));
#endif
                    } else {
                        strcpy(buf, ov11_02322DB0);
                    }
                    DrawTextInWindow(v2, 2, 2, buf);
                    UpdateWindow(v2);
                }
            }
            if (!IsInventoryMenuActive(ov11_02324D8C->field_0x4)) {
                s32 v5 = ov10_022BCDBC(ov11_02324D8C->field_0x4);

                if (v5 >= 0) {
                    struct item *v6;
                    bool8        v6f;
                    s32 v7;
                    s32 v8;

                    ov11_02324D8C->field_0x10 = v5;
                    v6 = GetItemAtIdx(ov11_02324D8C->field_0x10);
                    ov11_02324D8C->field_0x24e = v6->id;
                    v6f = (v6->flags & 1) != 0;
                    if (v6f) {
                        ov11_02324D8C->field_0x24e = v6->id;
                    } else {
                        ov11_02324D8C->field_0x24e = 0;
                    }
                    v7 = GetItemCategoryVeneer(ov11_02324D8C->field_0x24e);
                    v8 = GetGameMode();
                    if (v7 == 5 && v8 != 4 && v8 != 5) {
                        s16 i;

                        for (i = 0; ov11_02322D38[i].field_0x0 != 0; i++) {
                            ov11_02324D8C->field_0x276[i] = 0;
                            switch (ov11_02322D38[i].field_0x0) {
                            case 0x2b6 + OV11_02307334_OFFSET:
                                if (!ov11_02309E48(ov11_02324D8C->field_0x24e)) {
                                    ov11_02324D8C->field_0x276[i] = 3;
                                }
                                break;
                            default:
                                break;
                            }
                        }
                        menu_a.c = ov11_02324D8C->field_0x276;
                        ov11_02324D8C->field_0x6 = CreateParentMenuFromStringIds(&ov11_02322CB8, 0x400213, &menu_a, ov11_02322D38);
                    } else if (IsGummi(ov11_02324D8C->field_0x24e) && v8 != 4 && v8 != 5) {
                        ov11_02324D8C->field_0x6 = CreateParentMenuFromStringIds(&ov11_02322CB8, 0x400013, 0, ov11_02322D88);
                    } else if (v6->held_by) {
                        ov11_02324D8C->field_0x6 = CreateParentMenuFromStringIds(&ov11_02322CA8, 0x400013, 0, ov11_02322D10);
                    } else {
                        ov11_02324D8C->field_0x6 = CreateParentMenuFromStringIds(&ov11_02322CA8, 0x400013, 0, ov11_02322D60);
                    }
                    ov11_02324D8C->field_0x0 = 3;
                } else {
                    ov10_022BCD10(ov11_02324D8C->field_0x4);
                    ov11_02324D8C->field_0x0 = 0xe;
                }
            } else {
                u16 pressed;

                GetPressedButtons(0, &pressed);
                if (pressed & 8) {
                    PlaySeVolumeWrapper(0);
                    ov10_022BCDF4(ov11_02324D8C->field_0x4);
                    ov11_02324D8C->field_0x10 = ov10_022BCDA8(ov11_02324D8C->field_0x4);
                    CloseTextBox2(ov11_02324D8C->field_0x5);
                    ov11_02324D8C->field_0x5 = -2;
                    CloseInventoryMenu(ov11_02324D8C->field_0x4);
                    ov11_02324D8C->field_0x4 = -2;
                    ov11_02324D8C->field_0x0 = 0xa;
                }
            }
        }
        break;
    }
    case 3: {
        if (IsParentMenuActive(ov11_02324D8C->field_0x6)) {
            break;
        }
        {
            s32 v1 = GetSimpleMenuResult__0202AEA4(ov11_02324D8C->field_0x6);

            if (v1 != 8) {
                ov11_02324D8C->field_0x14 = v1;
                if (v1 == 0) {
                    ov11_02308D48();
                    ov11_02324D8C->field_0x0 = 7;
                } else if (v1 == 1) {
                    ov11_02308D48();
                    ov11_02324D8C->field_0x0 = 9;
                } else if (v1 == 2) {
                    menu_b.b = 5;
                    ov11_02324D8C->field_0x7 = CreateParentMenuFromStringIds(&ov11_02322C98, 0x33, &menu_b, ov11_02322CD8);
                    ov11_02324D8C->field_0x0 = 4;
                } else if (v1 == 6) {
                    ov11_02308D48();
                    ov11_02324D8C->field_0x0 = 0x11;
                } else if (v1 == 7) {
                    ov11_02308D48();
                    ov11_02324D8C->field_0x0 = 0x18;
                } else {
                    ov11_02308D48();
                    ov11_02324D8C->field_0x0 = 0xa;
                }
            } else {
                CloseParentMenu(ov11_02324D8C->field_0x6);
                ov11_02324D8C->field_0x6 = -2;
                ov11_02324D8C->field_0x0 = 2;
            }
        }
        break;
    }
    case 17: {
        ov11_02309040(1);
        ov11_02324D8C->field_0x0 = 0x12;
        break;
    }
    case 18: {
        struct unk_02309DAC  sel;
        struct unk_02308F4C *v2;
        s16 v3;
        s32 v4;

        if (!ov11_023090DC()) {
            break;
        }
        if (ov11_02309E24() != -1) {
            v2 = &ov11_02324D8C->field_0x238;
            ov11_02309DAC(&sel);
            ov11_02308F4C(v2, &sel);
            ov11_02324D8C->field_0x30c = GetLearnableIqSkills(ov11_02324D8C->field_0x280, v2->field_0x8, *v2->field_0x10);
            ov11_02324D8C->field_0x250 = -1;
            ov11_02324D8C->field_0x318 = *v2->field_0x10;
            v3 = ov11_02324D8C->field_0x24e;
            if (v2->field_0x0 == 0) {
                ApplyGummiBoostsToGroundMonster(GetTeamMember(v2->field_0x4), v3, 1, &ov11_02324D8C->field_0x250);
            } else if (v2->field_0x0 == 1) {
                ApplyGummiBoostsToTeamMember(GetActiveTeamMember(v2->field_0x4), v3, 1, &ov11_02324D8C->field_0x250);
            }
            ov11_02324D8C->field_0x318 -= *v2->field_0x10;
            ov11_022DC504();
            if (v2->field_0x0 == 1) {
                sub_02058794(v2->field_0x4);
            }
            ov11_02324D8C->field_0x310 = GetLearnableIqSkills(ov11_02324D8C->field_0x2c5, v2->field_0x8, *v2->field_0x10);
            ov11_02324D8C->field_0x314 = 1;
            v4 = ov11_02324D8C->field_0x250;
            ov11_02308EDC();
            if (v4 >= 0 && v4 <= 3) {
                RemoveItemNoHoleCheck(ov11_02324D8C->field_0x10);
                ov11_02324D8C->field_0x18 = -1;
                ov11_02324D8C->field_0x0 = 0x13;
            } else {
                ShowStringIdInDialogueBox(ov11_02324D8C->field_0x8, 0x18, 0x2be + OV11_02307334_OFFSET, &ov11_02324D8C->field_0xb4);
                ov11_02324D8C->field_0x0 = 0xd;
            }
        } else {
            ov11_02324D8C->field_0x0 = 0;
        }
        ov11_02309DF8();
        break;
    }
    case 19: {
        s32 v1;
        s16 v2;

        v2 = ov11_02324D8C->field_0x250;
        switch (v2) {
        case 0:
            v1 = 0x2b9 + OV11_02307334_OFFSET;
            break;
        case 1:
            v1 = 0x2ba + OV11_02307334_OFFSET;
            break;
        case 2:
            v1 = 0x2bb + OV11_02307334_OFFSET;
            break;
        case 3:
            v1 = 0x2bc + OV11_02307334_OFFSET;
            break;
        default:
            v1 = 0;
            break;
        }
        if (ov11_02324D8C->field_0x318 == 0 && v2 >= 0 && v2 <= 3) {
            v1 = 0x2bd + OV11_02307334_OFFSET;
        }
        if (v1 == 0) {
            ov11_02324D8C->field_0x0 = 0x10;
            break;
        }
        ov11_02324D8C->field_0xb4.flag_vals[0] = ov11_0230901C(&ov11_02324D8C->field_0x238);
        ov11_02308EDC();
        ShowStringIdInDialogueBox(ov11_02324D8C->field_0x8, 0x18, v1, &ov11_02324D8C->field_0xb4);
        ov11_02324D8C->field_0x0 = 0x14;
        break;
    }
    case 20: {
        if (IsDialogueBoxActive(ov11_02324D8C->field_0x8)) {
            break;
        }
        ShowDialogueBox(ov11_02324D8C->field_0x8);
        ov11_02308F14();
        ov11_02324D8C->field_0x0 = 0x15;
        break;
    }
    case 21: {
        do {
            int v1 = 0;
            int v2 = 0;
            int i;
            struct unk_02324D8C *st = ov11_02324D8C;
            int n = st->field_0x30c;

            for (i = 0; i < n; i++) {
                if (st->field_0x314 == st->field_0x280[i]) {
                    v1 = 1;
                    break;
                }
            }
            for (i = 0; i < ov11_02324D8C->field_0x310; i++) {
                if (ov11_02324D8C->field_0x314 == ov11_02324D8C->field_0x2c5[i]) {
                    v2 = 1;
                    break;
                }
            }
            if (v1 != v2) {
                ov11_02324D8C->field_0xb4.flag_vals[0] = ov11_0230901C(&ov11_02324D8C->field_0x238);
                ov11_02324D8C->field_0xb4.id_vals[0] = ov11_02324D8C->field_0x314;
                sub_02017C50(4);
                ov11_02308EDC();
                ShowStringIdInDialogueBox(ov11_02324D8C->field_0x8, 0x18, 0x2bf + OV11_02307334_OFFSET, &ov11_02324D8C->field_0xb4);
                EnableIqSkill(ov11_02324D8C->field_0x238.field_0xc, (u8)ov11_02324D8C->field_0x314);
                ov11_02308FD0(&ov11_02324D8C->field_0x238);
                ov11_02324D8C->field_0x314++;
                ov11_02324D8C->field_0x0 = 0x14;
                break;
            }
            ov11_02324D8C->field_0x314++;
        } while (ov11_02324D8C->field_0x314 < 0x45);
        if (ov11_02324D8C->field_0x314 >= 0x45) {
            ov11_02324D8C->field_0x0 = 0x16;
        }
        break;
    }
    case 22: {
        s32 v1;

        switch (ov11_02324D8C->field_0x252) {
        case 0:
            v1 = 0;
            break;
        case 1:
            v1 = 0x2c1 + OV11_02307334_OFFSET;
            break;
        case 2:
            v1 = 0x2c2 + OV11_02307334_OFFSET;
            break;
        case 4:
            v1 = 0x2c3 + OV11_02307334_OFFSET;
            break;
        case 8:
            v1 = 0x2c4 + OV11_02307334_OFFSET;
            break;
        default:
            v1 = 0x2c0 + OV11_02307334_OFFSET;
            break;
        }
        if (v1 == 0) {
            ov11_02324D8C->field_0x0 = 0x10;
            break;
        }
        ov11_02308EDC();
        ShowStringIdInDialogueBox(ov11_02324D8C->field_0x8, 0x18, 0x2bf + OV11_02307334_OFFSET, &ov11_02324D8C->field_0xb4);
        ov11_02324D8C->field_0x314++;
        ov11_02324D8C->field_0x0 = 0x17;
        break;
    }
    case 23: {
        if (IsDialogueBoxActive(ov11_02324D8C->field_0x8)) {
            break;
        }
        ShowDialogueBox(ov11_02324D8C->field_0x8);
        ov11_02308F14();
        ov11_02324D8C->field_0x0 = 0x10;
        break;
    }
    case 24: {
        ov11_02309084(GetItemAtIdx(ov11_02324D8C->field_0x10)->id);
        ov11_02324D8C->field_0x0 = 0x19;
        break;
    }
    case 25: {
        if (!ov11_023090DC()) {
            break;
        }
        if (ov11_02309E24() != -1) {
            struct unk_02324D8C *v1 = ov11_02324D8C;
            struct unk_02309DAC  sel;

            ov11_02309DAC(&sel);
            ov11_02308F4C(&v1->field_0x238, &sel);
            ov11_02308FEC(&v1->field_0x238);
            if (sub_020415BC()) {
                ov11_02324D8C->field_0x0 = 0x1d;
            } else {
                struct item *v2 = GetItemAtIdx(ov11_02324D8C->field_0x10);
                if (!IsHM(v2->id)) {
                    v2->quantity = v2->id - 0xbc;
                    v2->id = 0xbb;
                    SetItemAcquired(v2);
                }
                ov11_02324D8C->field_0x0 = 0x1a;
            }
        } else {
            ov11_02324D8C->field_0x0 = 0;
        }
        ov11_02309DF8();
        break;
    }
    case 33: {
        sub_02053CA0(ov11_02324D8C->field_0x328, 2, ov11_02324D8C->field_0x238.field_0x8, ov11_02324D8C->field_0x238.field_0xa);
        sub_0203FD14(GetItemMoveId16(ov11_02324D8C->field_0x24e));
        ov11_02324D8C->field_0xa = sub_0204019C(6, 0, 0, ov11_02324D8C->field_0x328);
        ov11_02324D8C->field_0x0 = 0x22;
        break;
    }
    case 34: {
        switch (sub_020407EC()) {
        case 2:
            ov11_02324D8C->field_0x0 = 0x1f;
            break;
        case 1:
            sub_020407C0();
            CloseAdvancedTextBox(ov11_02324D8C->field_0xa);
            ov11_02324D8C->field_0xa = -2;
            ov11_02324D8C->field_0x0 = 0x18;
            break;
        case 7:
            if (sub_02041094() < 4) {
                memcpy(ov11_02324D8C->field_0x256, sub_0203FD38(), 0x20);
                ov11_02324D8C->field_0x254 = sub_02041094();
            } else {
                memcpy(ov11_02324D8C->field_0x256, sub_0203FD2C(), 8);
                ov11_02324D8C->field_0x254 = -1;
            }
            sub_020407C0();
            CloseAdvancedTextBox(ov11_02324D8C->field_0xa);
            ov11_02324D8C->field_0xa = -2;
            ov11_02324D8C->field_0x0 = 0x27;
            break;
        }
        break;
    }
    case 31: {
        ov11_02324D8C->field_0x1c.b = 1;
        ov11_02324D8C->field_0xc = CreateSimpleMenuFromStringIds(&ov11_02322CC8, 0x33, &ov11_02324D8C->field_0x1c,
                                                   ov11_02322CF0, 3);
        ov11_02324D8C->field_0x0 = 0x20;
        break;
    }
    case 32: {
        if (!IsSimpleMenuActive(ov11_02324D8C->field_0xc)) {
            s32 v1;

            v1 = GetSimpleMenuResult__0202B870(ov11_02324D8C->field_0xc);
            CloseSimpleMenu(ov11_02324D8C->field_0xc);
            ov11_02324D8C->field_0xc = -2;
            switch (v1) {
            case 0:
                ov11_02324D8C->field_0x24c = sub_02041094();
                CloseAdvancedTextBox(ov11_02324D8C->field_0xa);
                ov11_02324D8C->field_0xa = -2;
                ov11_02324D8C->field_0x0 = 0x23;
                break;
            case 1:
                if (sub_02041094() < 4) {
                    memcpy(ov11_02324D8C->field_0x256, sub_0203FD38(), 0x20);
                    ov11_02324D8C->field_0x254 = sub_02041094();
                } else {
                    memcpy(ov11_02324D8C->field_0x256, sub_0203FD2C(), 8);
                    ov11_02324D8C->field_0x254 = -1;
                }
                sub_020407C0();
                CloseAdvancedTextBox(ov11_02324D8C->field_0xa);
                ov11_02324D8C->field_0xa = -2;
                ov11_02324D8C->field_0x0 = 0x27;
                break;
            case 2:
                sub_020416FC();
                ov11_02324D8C->field_0x0 = 0x22;
                break;
            }
        }
        break;
    }
    case 35: {
        ov11_02324D8C->field_0xb4.id_vals[0] = sub_02041154(ov11_02324D8C->field_0x24c);
        {
            s32 v1 = 0x8d7 + OV11_02307334_OFFSET_2;

            if (ov11_02324D8C->field_0x24c < 3 && sub_02041364(ov11_02324D8C->field_0x24c)) {
                v1 = 0x8d6 + OV11_02307334_OFFSET_2;
            }
            ov11_02308EDC();
            ShowStringIdInDialogueBox(ov11_02324D8C->field_0x8, 0x18, v1, &ov11_02324D8C->field_0xb4);
        }
        ov11_02324D8C->field_0x0 = 0x24;
        break;
    }
    case 36: {
        if (!IsDialogueBoxActive(ov11_02324D8C->field_0x8)) {
            ov11_02324D8C->field_0x0 = 0x25;
        }
        break;
    }
    case 37: {
        menu_b.b = 5;
        ov11_02324D8C->field_0x7 = CreateParentMenuFromStringIds(0, 0x33, &menu_b, ov11_02322CD8);
        ov11_02324D8C->field_0x0 = 0x26;
        break;
    }
    case 38: {
        if (IsParentMenuActive(ov11_02324D8C->field_0x7)) {
            break;
        }
        if (GetSimpleMenuResult__0202AEA4(ov11_02324D8C->field_0x7) == 4) {
            struct item *v1 = GetItemAtIdx(ov11_02324D8C->field_0x10);
            if (!IsHM(v1->id)) {
                if (v1->held_by != 0) {
                    sub_020582E0(v1->held_by);
                }
                v1->quantity = v1->id - 0xbc;
                v1->id = 0xbb;
                SetItemAcquired(v1);
            }
            ov11_02324D8C->field_0x0 = 0x1a;
            if (ov11_02324D8C->field_0x24c >= 4) {
                ov11_02324D8C->field_0x0 = 0x1b;
            } else {
                sub_02041484();
                ov11_02324D8C->field_0x0 = 0x1a;
            }
        } else {
            sub_020407C0();
            ov11_02308FEC(&ov11_02324D8C->field_0x238);
            ov11_02324D8C->field_0x0 = 0x21;
        }
        CloseParentMenu(ov11_02324D8C->field_0x7);
        ov11_02324D8C->field_0x7 = -2;
        ShowDialogueBox(ov11_02324D8C->field_0x8);
        ov11_02308F14();
        break;
    }
    case 39: {
        {
            s16 v1 = ov11_02324D8C->field_0x254;
            ov11_02324D8C->field_0xb = sub_020417A8(ov11_02324D8C->field_0x256,
                                                    v1 < 0 ? 1 : 4,
                                                    v1 < 0 ? 0 : v1, 1);
        }
        ov11_02324D8C->field_0x0 = 0x28;
        break;
    }
    case 40: {
        if (IsScrollBoxActive(ov11_02324D8C->field_0xb)) {
            break;
        }
        CloseScrollBox(ov11_02324D8C->field_0xb);
        sub_02041A00();
        ov11_02324D8C->field_0xb = -2;
        ov11_02324D8C->field_0x0 = 0x21;
        break;
    }
    case 26: {
        {
            u16 v1 = GetItemMoveId16(ov11_02324D8C->field_0x24e);
            sub_02017C74(0x131b, 0x100);
            sub_02041614(v1);
            {
                struct unk_02308F4C *v2 = &ov11_02324D8C->field_0x238;
                if (v2->field_0x0 == 0) {
                    sub_0203FD80(v2->field_0x4);
                } else if (v2->field_0x0 == 1) {
                    sub_0203FDEC(v2->field_0x4);
                }
            }
            sub_020407C0();
            ov11_02324D8C->field_0xb4.id_vals[0] = v1;
        }
        ov11_02324D8C->field_0xb4.strings[0] = ov11_02308DD8(&ov11_02324D8C->field_0x238);
        ov11_02308EDC();
        ShowStringIdInDialogueBox(ov11_02324D8C->field_0x8, 0x18, 0xf23 + OV11_02307334_OFFSET_3, &ov11_02324D8C->field_0xb4);
        ov11_02308FD0(&ov11_02324D8C->field_0x238);
        ov11_02324D8C->field_0x0 = 0x29;
        break;
    }
    case 27: {
        sub_020407C0();
        ov11_02324D8C->field_0x0 = 0x1c;
        ov11_02324D8C->field_0x32c = sub_020037A4() + 10;
        break;
    }
    case 28: {
        if (sub_020037A4() > ov11_02324D8C->field_0x32c) {
            ov11_02324D8C->field_0xb4.strings[0] = ov11_02308DD8(&ov11_02324D8C->field_0x238);
            ov11_02308EDC();
            ShowStringIdInDialogueBox(ov11_02324D8C->field_0x8, 0x18, 0xf24 + OV11_02307334_OFFSET_3, &ov11_02324D8C->field_0xb4);
            ov11_02324D8C->field_0x0 = 0x29;
        }
        break;
    }
    case 29: {
        ov11_02308EDC();
        ShowStringIdInDialogueBox(ov11_02324D8C->field_0x8, 0x18, 0xf28 + OV11_02307334_OFFSET_3, 0);
        ov11_02324D8C->field_0x0 = 0x1e;
        break;
    }
    case 30: {
        if (IsDialogueBoxActive(ov11_02324D8C->field_0x8)) {
            break;
        }
        ShowDialogueBox(ov11_02324D8C->field_0x8);
        ov11_02308F14();
        ov11_02324D8C->field_0x0 = 0x21;
        break;
    }
    case 41: {
        if (IsDialogueBoxActive(ov11_02324D8C->field_0x8)) {
            break;
        }
        ShowDialogueBox(ov11_02324D8C->field_0x8);
        ov11_02308F14();
        ov11_02324D8C->field_0x0 = 0;
        break;
    }
    case 4: {
        if (IsParentMenuActive(ov11_02324D8C->field_0x7)) {
            break;
        }
        {
            s32 v1 = GetSimpleMenuResult__0202AEA4(ov11_02324D8C->field_0x7);
            ov11_02324D8C->field_0x0 = 2;
            if (v1 != 8 && v1 == 4) {
                ov11_02324D8C->field_0xb4.id_vals[0] = ov11_02324D8C->field_0x24e;
                ov11_02324D8C->field_0xb4.number_vals[0] = 0;
                RemoveItemNoHoleCheck(ov11_02324D8C->field_0x10);
                ov11_022DC504();
                ov11_02324D8C->field_0x18 = -1;
                ov10_022BCC60(ov11_02324D8C->field_0x4, GetNbItemsInBag());
                SetInventoryMenuState6(ov11_02324D8C->field_0x4);
                ov11_02324D8C->field_0x0 = 5;
            }
        }
        CloseParentMenu(ov11_02324D8C->field_0x7);
        ov11_02324D8C->field_0x7 = -2;
        CloseParentMenu(ov11_02324D8C->field_0x6);
        ov11_02324D8C->field_0x6 = -2;
        break;
    }
    case 5: {
        if (IsInventoryMenuActive(ov11_02324D8C->field_0x4)) {
            break;
        }
        CloseTextBox2(ov11_02324D8C->field_0x5);
        ov11_02324D8C->field_0x5 = -2;
        CloseInventoryMenu(ov11_02324D8C->field_0x4);
        ov11_02324D8C->field_0x4 = -2;
        ov11_02308EDC();
        ShowStringIdInDialogueBox(ov11_02324D8C->field_0x8, 0x18, 0x2cb + OV11_02307334_OFFSET, &ov11_02324D8C->field_0xb4);
        ov11_02324D8C->field_0x0 = 6;
        break;
    }
    case 6: {
        if (IsDialogueBoxActive(ov11_02324D8C->field_0x8)) {
            break;
        }
        ShowDialogueBox(ov11_02324D8C->field_0x8);
        if (!IsBagNotEmpty()) {
            ov11_02324D8C->field_0x0 = 0xc;
            break;
        }
        ov11_02308F14();
        ov11_02324D8C->field_0x0 = 0;
        break;
    }
    case 7: {
        ov11_02324D8C->field_0x324 = sub_02044688(ov11_02324D8C->field_0x10, 2, 0, 0, 0, 0);
        ov11_02324D8C->field_0x0 = 8;
        break;
    }
    case 8: {
        if (sub_02044800(ov11_02324D8C->field_0x324) != 1) {
            break;
        }
        sub_020448EC(&ov11_02324D8C->field_0x324);
        ov11_02324D8C->field_0x0 = 0;
        break;
    }
    case 9: {
        sub_020582E0(GetItemAtIdx(ov11_02324D8C->field_0x10)->held_by);
        ov11_02324D8C->field_0x0 = 0;
        break;
    }
    case 10: {
        struct item *v1 = GetItemAtIdx(ov11_02324D8C->field_0x10);
        bool8 v2 = (v1->flags & 1) != 0;

        if (v2) {
            ov11_02324D8C->field_0x24e = v1->id;
        } else {
            ov11_02324D8C->field_0x24e = 0;
        }
        InitPreprocessorArgs(&args);
        args.id_vals[0] = ov11_02324D8C->field_0x24e;
        args.id_vals[2] = v1->quantity + 0xbc;
#ifdef EUROPE
        ov11_02324D8C->field_0x9 = CreateScrollBoxSingle(&ov11_02322C78, 0x1013, 0, 0x8e4, &args, (u16)(ov11_02324D8C->field_0x24e + 0x29d3), &args);
#elif defined(JAPAN)
        ov11_02324D8C->field_0x9 = CreateScrollBoxSingle(&ov11_02322C78, 0x1013, 0, 0x1d3c, &args, (u16)(ov11_02324D8C->field_0x24e + 0x41ce), &args);
#else
        ov11_02324D8C->field_0x9 = CreateScrollBoxSingle(&ov11_02322C78, 0x1013, 0, 0x8e4, &args, (u16)(ov11_02324D8C->field_0x24e + 0x29d1), &args);
#endif
        ov11_02324D8C->field_0x0 = 0xb;
        break;
    }
    case 11: {
        if (IsScrollBoxActive(ov11_02324D8C->field_0x9)) {
            break;
        }
        CloseScrollBox(ov11_02324D8C->field_0x9);
        ov11_02324D8C->field_0x9 = -2;
        ov11_02324D8C->field_0x0 = 0;
        break;
    }
    case 12: {
        if (ov11_02324D8C->field_0x5 != -2) {
            CloseTextBox2(ov11_02324D8C->field_0x5);
            ov11_02324D8C->field_0x5 = -2;
        }
        if (ov11_02324D8C->field_0x4 != -2) {
            CloseInventoryMenu(ov11_02324D8C->field_0x4);
            ov11_02324D8C->field_0x4 = -2;
        }
        if (ov11_02324D8C->field_0x8 == -2) {
            ov11_02308EDC();
        }
        ShowStringIdInDialogueBox(ov11_02324D8C->field_0x8, 0x18, 0x2b4 + OV11_02307334_OFFSET, 0);
        ov11_02324D8C->field_0x0 = 0xd;
        break;
    }
    case 13: {
        if (IsDialogueBoxActive(ov11_02324D8C->field_0x8)) {
            break;
        }
        ShowDialogueBox(ov11_02324D8C->field_0x8);
        ov11_02308F14();
        ov11_02324D8C->field_0x0 = 0x10;
        break;
    }
    case 14: {
        ov11_02324D8C->field_0x0 = 0xf;
        break;
    }
    case 15:
        if (!IsInventoryMenuActive(ov11_02324D8C->field_0x4)) {
            CloseTextBox2(ov11_02324D8C->field_0x5);
            ov11_02324D8C->field_0x5 = -2;
            CloseInventoryMenu(ov11_02324D8C->field_0x4);
            ov11_02324D8C->field_0x4 = -2;
            ov11_02324D8C->field_0x0 = 0x10;
        }
    case 16:
        return 1;
    }

    return 0;
}

void ov11_02308D1C(void)
{
    if (ov11_02324D8C != 0) {
        MemFree(ov11_02324D8C);
        ov11_02324D8C = 0;
    }
}

void ov11_02308D48(void)
{
    if (ov11_02324D8C->field_0x6 != -2) {
        CloseParentMenu(ov11_02324D8C->field_0x6);
        ov11_02324D8C->field_0x6 = -2;
    }
    if (ov11_02324D8C->field_0x5 != -2) {
        CloseTextBox2(ov11_02324D8C->field_0x5);
        ov11_02324D8C->field_0x5 = -2;
    }
    if (ov11_02324D8C->field_0x4 != -2) {
        CloseInventoryMenu(ov11_02324D8C->field_0x4);
        ov11_02324D8C->field_0x4 = -2;
    }
}

char* ov11_02308DD8(struct unk_02308F4C *a)
{
    u8 name[12];
    struct ground_monster *ground_monster;
    struct team_member *team_member;
    u32 color;
    bool8 f;
    bool8 leader;

    if (a->field_0x0 == 0) {
        ground_monster = GetTeamMember(a->field_0x4);
        sub_02056094(ov11_02324D8C->field_0x136, ground_monster,
                     sub_020564B0(sub_02055894(ground_monster)));
    } else if (a->field_0x0 == 1) {
        team_member = GetActiveTeamMember(a->field_0x4);
        StrncpySimpleNoPadSafe(name, (const u8 *)team_member->name, 10);
        color = 0x44;
        f = (*(u8 *)team_member & 2) != 0;
        if (f) {
            color = 0x46;
        }
        leader = team_member->is_leader != 0;
        if (leader) {
            color = 0x59;
        }
        ov11_02308EB4(ov11_02324D8C->field_0x136, ov11_02322DB8, color, name);
    }
    return ov11_02324D8C->field_0x136;
}

void ov11_02308EB4(char *str, const char *format, ...)
{
    va_list args;
    va_start(args, format);
    vsprintf(str, format, args);
}

void ov11_02308EDC(void)
{
    if (ov11_02324D8C->field_0x8 == -2) {
        ov11_02324D8C->field_0x8 = CreateDialogueBox(0);
    }
}

void ov11_02308F14(void)
{
    if (ov11_02324D8C->field_0x8 != -2) {
        CloseDialogueBox(ov11_02324D8C->field_0x8);
        ov11_02324D8C->field_0x8 = -2;
    }
}

void ov11_02308F4C(struct unk_02308F4C *dst, const struct unk_02309DAC *src)
{
    *(struct unk_02309DAC *)dst = *src;
    if (dst->field_0x0 == 0) {
        struct ground_monster *mon = GetTeamMember(dst->field_0x4);

        dst->field_0x8 = mon->id;
        dst->field_0xa = mon->joined_at;
        dst->field_0xc = mon->iq_skill_flags;
        dst->field_0x10 = (s16 *)&mon->iq;
    } else if (dst->field_0x0 == 1) {
        struct team_member *mem = GetActiveTeamMember(dst->field_0x4);

        dst->field_0x8 = *(s16 *)&mem->id;
        dst->field_0xa = mem->joined_at;
        dst->field_0xc = mem->iq_skill_flags;
        dst->field_0x10 = (s16 *)&mem->iq;
    }
}

void ov11_02308FD0(struct unk_02308F4C *a)
{
    if (a->field_0x0 == 1) {
        sub_02058794(a->field_0x4);
    }
}

void ov11_02308FEC(struct unk_02308F4C *a)
{
    if (a->field_0x0 == 0) {
        sub_0203FA64(a->field_0x4);
    } else if (a->field_0x0 == 1) {
        sub_0203FBD4(a->field_0x4);
    }
}

s32 ov11_0230901C(struct unk_02308F4C *a)
{
    if (a->field_0x0 == 0) {
        return a->field_0x4 | 0x20000;
    }
    if (a->field_0x0 == 1) {
        return a->field_0x4 | 0x30000;
    }
}

int ov11_02309040(s32 param_1)
{
    ov11_02324D90 = MemAlloc(sizeof(struct unk_02324D90), 8);
    if (ov11_02324D90 == 0) {
        return 0;
    }
    ov11_02324D90->field_0x114 = param_1;
    ov11_02324D90->field_0x0 = 0;
    return 1;
}

int ov11_02309084(s16 param_1)
{
    ov11_02324D90 = MemAlloc(sizeof(struct unk_02324D90), 8);
    if (ov11_02324D90 == NULL) {
        return 0;
    }
    ov11_02324D90->field_0x114 = 2;
    ov11_02324D90->field_0x0 = 0;
    ov11_02324D90->field_0x118 = param_1;
    return 1;
}

int ov11_023090DC(void)
{
    struct monster_summary summary;
    struct preprocessor_args args;
    char buf[0x42];
    u16 buttons;

    switch (ov11_02324D90->field_0x0) {
    case 0: {
        struct unk_02324D90 *p = ov11_02324D90;
        struct unk_023090DC *lst;
        s32 mode;
        struct unk_0230A044 *e;
        u16 move_id;
        struct unk_0202A690 *w;
        s32 n;
        s32 k;
        s32 i;
        s32 q;
        u32 flags;
        s16 item_id;
        s16 monster_id;
        s32 v_sel;
        bool8 v_flag;

        mode = p->field_0x114;
        v_flag = 0;
        n = v_flag;
        lst = &p->field_0x11c;
        v_sel = n;
        item_id = p->field_0x118;
        flags = 0x00401833;
        w = lst->field_0x38;
        ov11_02309EE4(&lst->field_0x0, mode);

        for (i = 0; i < lst->field_0x0.field_0x30; i++) {
            lst->field_0x70[i] = 0;
        }

        if (mode == 2) {
            for (i = 0; i < lst->field_0x0.field_0x30; i++) {
                e = &lst->field_0x0.field_0x0[i];
                move_id = GetItemMoveId16(item_id);

                if (e->field_0x0 == 1) {
                    struct ground_monster *gm = GetTeamMember(e->field_0x4);

                    monster_id = gm->id;
                    for (k = 0; k < 4; k++) {
                        bool8 exists = (gm->moves[k].flags0 & 1) != 0;

                        if (exists) {
                            if (move_id == gm->moves[k].id) {
                                break;
                            }
                        }
                    }
                } else if (e->field_0x0 == 2) {
                    struct team_member *tm = GetActiveTeamMember(e->field_0x4);

                    monster_id = tm->id;
                    for (k = 0; k < 4; k++) {
                        bool8 exists = (tm->moves[k].flags0 & 1) != 0;

                        if (exists) {
                            if (move_id == tm->moves[k].id) {
                                break;
                            }
                        }
                    }
                }
                if (sub_02053D1C(move_id, monster_id)) {
                    if (k < 4) {
                        lst->field_0x70[i] = 3;
                    }
                } else {
                    lst->field_0x70[i] = 3;
                }
            }
        }

        for (i = 0; i < lst->field_0x0.field_0x30; i++) {
            e = &lst->field_0x0.field_0x0[i];

            if (e->field_0x0 == 1) {
                struct ground_monster *gm = GetTeamMember(e->field_0x4);

                args.flag_vals[0] = e->field_0x4 | 0x20000;
                args.number_vals[0] = GetDexNumber(gm->id);
                RecolorNameString(buf, gm->name, 0);
                args.strings[0] = buf;
            } else if (e->field_0x0 == 2) {
                struct team_member *tm = GetActiveTeamMember(e->field_0x4);

                args.flag_vals[0] = e->field_0x4 | 0x30000;
                args.number_vals[0] = GetDexNumber(tm->id);
                RecolorNameString(buf, tm->name, 0);
                args.strings[0] = buf;
            }

            if (mode == 1) {
                q = n * 0x100;
                PreprocessString(lst->field_0x76[n], 0x100, ov11_02322E58, 0, &args);
            } else if (mode == 2) {
                if (lst->field_0x70[i] & 2) {
                    q = n * 0x100;
                    PreprocessString(lst->field_0x76[n], 0x100, ov11_02322E7C, 0, &args);
                } else {
                    q = n * 0x100;
                    PreprocessString(lst->field_0x76[n], 0x100, ov11_02322E58, 0, &args);
                }
            } else {
                q = n * 0x100;
                PreprocessString(lst->field_0x76[n], 0x100, ov11_02322EA0, 0, &args);
            }

            if (lst->field_0x70[i] == 0 && v_flag == 0) {
                v_flag = 1;
                v_sel = i;
            }
            n++;
            w->field_0x0 = lst->field_0x76[0] + q;
            w->field_0x4 = i;
            w++;
        }
        w->field_0x0 = 0;
        w->field_0x4 = -1;
        lst->field_0x34 = v_sel;

        ov11_02324D90->field_0x88 = 0x10;
        ov11_02324D90->field_0x7c = 0;
        if (ov11_02324D90->field_0x114 == 1) {
            ov11_02324D90->field_0x84 = OV11_023090DC_CONST_1;
        } else if (ov11_02324D90->field_0x114 == 2) {
            ov11_02324D90->field_0x84 = OV11_023090DC_CONST_1;
            flags |= 0x200;
            ov11_02324D90->field_0xdc = ov11_02324D90->field_0x11c.field_0x70;
            ov11_02324D90->field_0x7c = ov11_02324D90->field_0x11c.field_0x34;
        } else {
            ov11_02324D90->field_0x84 = OV11_023090DC_CONST_2;
        }
        ov11_02324D90->field_0x4 =
            CreateParentMenu(ov11_02322DD0, flags, &ov11_02324D90->field_0x7c,
                             ov11_02324D90->field_0x11c.field_0x38);
        ov11_02324D90->field_0x0 = 1;
        break;
    }

    case 2:
        if (sub_02028354(ov11_02324D90->field_0x4) == 3) {
            sub_0202810C(ov11_02324D90->field_0x4);
        }
        ResumeParentMenu(ov11_02324D90->field_0x4);
        ov11_02324D90->field_0x0 = 1;
        break;

    case 1: {
        s32 mode = ov11_02324D90->field_0x114;
        s32 r;
        s32 cond;

        GetPressedButtons(0, &buttons);
        cond = (buttons & 8) && mode == 0;
        if (cond) {
            ov11_02324D90->field_0x10 =
                ov11_02324D90->field_0x11c.field_0x38[GetWindowIdSelectedItemOnPage(
                    ov11_02324D90->field_0x4)].field_0x4;
            sub_0202B030(ov11_02324D90->field_0x4);
            sub_0202812C(ov11_02324D90->field_0x4);
            ov11_02324D90->field_0x0 = 4;
            break;
        }
        if (IsParentMenuActive(ov11_02324D90->field_0x4)) {
            break;
        }
        r = GetSimpleMenuResult__0202AEA4(ov11_02324D90->field_0x4);
        if (r >= 0) {
            struct unk_0230A044 *e;
            s16 id;
            u8 *name;

            ov11_02324D90->field_0x10 = r;
            e = &ov11_02324D90->field_0x11c.field_0x0.field_0x0[r];
            if (e->field_0x0 == 1) {
                id = GetTeamMember(e->field_0x4)->id;
            } else if (e->field_0x0 == 2) {
                id = GetActiveTeamMember(e->field_0x4)->id;
            }
            name = ov11_0230A044(e);
            if (ov11_02324D90->field_0x114 == 1 || ov11_02324D90->field_0x114 == 2) {
                ov11_02324D90->field_0x0 = 0x1a;
                break;
            }
            if (GetGameMode() != GAME_MODE_5 && id == 0x140 &&
                StrcmpMonsterName(name, id)) {
                ov11_02324D90->field_0x5 = CreateParentMenuFromStringIds(
                    ov11_02322DE0, 0x13, 0, ov11_02322E28);
            } else {
                ov11_02324D90->field_0x5 = CreateParentMenuFromStringIds(
                    ov11_02322DE0, 0x13, 0, ov11_02322E00);
            }
            ov11_02324D90->field_0x0 = 3;
        } else {
            ov11_02324D90->field_0x0 = 0x1a;
            ov11_02324D90->field_0x10 = -1;
        }
        break;
    }

    case 3: {
        s32 r;

        if (IsParentMenuActive(ov11_02324D90->field_0x5)) {
            break;
        }
        r = GetSimpleMenuResult__0202AEA4(ov11_02324D90->field_0x5);
        if (r != -1) {
            ov11_02324D90->field_0x14 = r;
            switch (r) {
            case 0:
                ov11_02324D90->field_0x0 = 4;
                break;
            case 1:
                ov11_02324D90->field_0x0 = 7;
                break;
            case 2:
                ov11_02324D90->field_0x0 = 0xc;
                break;
            case 3:
                ov11_02324D90->field_0x0 = 0xe;
                break;
            }
            sub_0202812C(ov11_02324D90->field_0x4);
        } else {
            ov11_02324D90->field_0x0 = 2;
        }
        CloseParentMenu(ov11_02324D90->field_0x5);
        break;
    }

    case 4: {
        struct unk_0230A044 *e =
            &ov11_02324D90->field_0x11c.field_0x0.field_0x0[ov11_02324D90->field_0x10];
        s32 leader = GetActiveTeamMember(e->field_0x4)->is_leader != 0;

        CreateMonsterSummaryFromTeamMember(&summary,
                                          GetActiveTeamMember(e->field_0x4),
                                          leader);
        ov11_02324D90->field_0x9 = sub_0203F150(&summary, 3);
        ov11_02324D90->field_0x0 = 5;
    }

    case 5:
        if (sub_0203F398() != 1) {
            break;
        }
        sub_0203F974();
        ov11_02324D90->field_0x18 = 1;
        ov11_02324D90->field_0x0 = 6;
        break;

    case 6:
        if (ov11_02324D90->field_0x18-- != 0) {
            break;
        }
        sub_0203F990();
        ov11_02324D90->field_0x0 = 2;
        break;

    case 7:
#ifdef JAPAN
        sub_0203FBD4(ov11_02324D90->field_0x10);
#else
        sub_0203FBD4(ov11_02324D90->field_0x11c.field_0x0
                         .field_0x0[ov11_02324D90->field_0x10]
                         .field_0x4);
#endif
        ov11_02324D90->field_0xa = sub_0204018C(9, 0, 0);
        ov11_02324D90->field_0x0 = 8;

    case 8: {
        s32 r = sub_020407EC();

        if (r == 1) {
            sub_0203FDEC(ov11_02324D90->field_0x11c.field_0x0
                             .field_0x0[ov11_02324D90->field_0x10]
                             .field_0x4);
            sub_020407C0();
            CloseAdvancedTextBox(ov11_02324D90->field_0xa);
            ov11_02324D90->field_0x0 = 2;
            break;
        }
        if (r == 2 || r == 7) {
            struct unk_0230A044 *e =
                &ov11_02324D90->field_0x11c.field_0x0.field_0x0[ov11_02324D90->field_0x10];

            MemcpySimple(ov11_02324D90->field_0x1e, sub_0203FD38(), 0x20);
            ov11_02324D90->field_0x1c = sub_02041094();
            sub_0203FDEC(e->field_0x4);
            sub_020407C0();
            CloseAdvancedTextBox(ov11_02324D90->field_0xa);
            ov11_02324D90->field_0x0 = 0xa;
        }
        break;
    }

    case 9:
        sub_020307EC(ov11_02324D90->field_0xa);
        ov11_02324D90->field_0x0 = 8;
        break;

    case 10:
        ov11_02324D90->field_0xb = sub_020417A8(ov11_02324D90->field_0x1e, 4,
                                                ov11_02324D90->field_0x1c, 1);
        ov11_02324D90->field_0x0 = 0xb;

    case 11:
        if (sub_02041A18() != 1) {
            break;
        }
        sub_02041A00();
        CloseScrollBox(ov11_02324D90->field_0xb);
        ov11_02324D90->field_0x0 = 7;
        break;

    case 12: {
        struct team_member *tm =
            GetActiveTeamMember(ov11_02324D90->field_0x11c.field_0x0
                                    .field_0x0[ov11_02324D90->field_0x10]
                                    .field_0x4);

        PrintIqSkillsMenu(tm->id, tm->iq_skill_flags, tm->iq, 0);
        ov11_02324D90->field_0x0 = 0xd;
    }

    case 13:
        if (sub_02041B7C() != 1) {
            break;
        }
        sub_020420F4();
        ov11_02324D90->field_0x0 = 2;
        break;

    case 14:
        ov11_0230D92C();
        CloseParentMenu(ov11_02324D90->field_0x4);
        ov11_02324D90->field_0x0 = 0xf;
        break;

    case 15:
        if (ov11_0230D220() == 0) {
            ov11_02324D90->field_0x0 = 0x10;
        }
        break;

    case 16:
        StrncpySimpleNoPad(
            ov11_02324D90->field_0x3e,
            ov11_0230A044(&ov11_02324D90->field_0x11c.field_0x0
                               .field_0x0[ov11_02324D90->field_0x10]),
            10);
        StrcpySimple(ov11_02324D90->field_0x52, ov11_02324D90->field_0x3e);
        ShowKeyboard(2, ov11_02324D90->field_0x3e, 0, ov11_02324D90->field_0x52);
        ov11_02310BDC();
        ov11_02324D90->field_0x0 = 0x11;
        break;

    case 17:
        if (ov11_0230D220() == 0) {
            ov11_02324D90->field_0x0 = 0x12;
        }
        break;

    case 18:
        if (GetKeyboardStatus() != 3) {
            break;
        }
        ov11_02324D90->field_0x18 = 0xa;
        StrcpySimple(ov11_02324D90->field_0x3e, (u8 *)GetKeyboardStringResult());
        ov11_02324D90->field_0x0 = 0x13;
        break;

    case 19:
        if (!sub_02037468()) {
            break;
        }
        if (ov11_02324D90->field_0x18-- > 0) {
            break;
        }
        StrncpySimpleNoPadSafe(ov11_02324D90->field_0x66,
                               ov11_02324D90->field_0x3e, 10);
        sub_0203909C(ov11_02324D90->field_0x66);
        ov11_02324D90->field_0x0 = 0x14;
        break;

    case 20: {
        struct unk_0230A044 *e =
            &ov11_02324D90->field_0x11c.field_0x0.field_0x0[ov11_02324D90->field_0x10];
        u8 *name = ov11_0230A044(e);
        s32 r = sub_0203931C();

        if (r == -1) {
            break;
        }
        if (r != 0) {
            if (r == 1) {
                ov11_02324D90->field_0x0 = 0x15;
            }
            break;
        }
        StrncpySimple(name, ov11_02324D90->field_0x3e, 10);
        StrncpySimple(name, ov11_02324D90->field_0x3e, 10);
        if (e->field_0x0 == 2) {
            sub_02058794(e->field_0x4);
        }
        ov11_02324D90->field_0x0 = 0x16;
        break;
    }

    case 21:
        if (!sub_02039218()) {
            break;
        }
        ShowKeyboard(2, ov11_02324D90->field_0x3e, 0, ov11_02324D90->field_0x52);
        ov11_02324D90->field_0x0 = 0x12;
        break;

    case 22:
        ov11_0230D92C();
        ov11_02324D90->field_0x0 = 0x17;
        break;

    case 23:
        if (ov11_0230D220() != 0) {
            break;
        }
        if (sub_02039218() != 0) {
            ov11_02324D90->field_0x0 = 0x18;
        }
        break;

    case 24:
        ov11_0230D000();
        ov11_02324D90->field_0x0 = 0x19;
        break;

    case 25:
        if (ov11_0230D220() == 0) {
            ov11_02324D90->field_0x0 = 0;
        }
        break;

    case 26:
        CloseParentMenu(ov11_02324D90->field_0x4);
        ov11_02324D90->field_0x0 = 0x1b;

    case 27:
        return 1;
    }
    return 0;
}

void ov11_02309DAC(struct unk_02309DAC *out)
{
    struct unk_02324D90 *p = ov11_02324D90;
    struct unk_0230A044 *list = p->field_0x11c.field_0x0.field_0x0;
    struct unk_0230A044 *e = &list[p->field_0x10];

    if (e->field_0x0 == 1) {
        out->field_0x0 = 0;
        out->field_0x4 = e->field_0x4;
        return;
    }
    if (e->field_0x0 == 2) {
        out->field_0x0 = 1;
        out->field_0x4 = e->field_0x4;
    }
}

void ov11_02309DF8(void)
{
    if (ov11_02324D90 == NULL) {
        return;
    }
    MemFree(ov11_02324D90);
    ov11_02324D90 = NULL;
}

s16 ov11_02309E24(void)
{
    if (ov11_02324D90 != NULL) {
        return ov11_02324D90->field_0x10;
    }
    return -1;
}

int ov11_02309E48(s16 param_1)
{
    struct unk_02309EE4 *p;
    int found = 1;
    s32 i;

    p = MemAlloc(sizeof(struct unk_02309EE4), 0);
    ov11_02309EE4(p, 2);
    for (i = 0; i < p->field_0x30; i++) {
        struct unk_0230A044 *e = &p->field_0x0[i];

        if (e->field_0x0 == 1) {
            if (sub_02055FCC(e->field_0x4, param_1)) {
                break;
            }
        } else if (e->field_0x0 == 2) {
            if (sub_020586F0(e->field_0x4, param_1)) {
                break;
            }
        }
    }
    if (i == p->field_0x30) {
        found = 0;
    }
    MemFree(p);
    return found;
}
