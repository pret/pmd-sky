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

struct unk_02309DAC {
    s32 field_0x0;
    s16 field_0x4;
};

struct unk_02308F4C {
    s32 field_0x0;
    s16 field_0x4;
    u8 field_0x6[2];
    s16 field_0x8;
    u8 field_0xa;
    u8 field_0xb;
    u32 *field_0xc;
    s16 *field_0x10;
};

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
    struct struct_2 field_0x1c;         struct preprocessor_args field_0xb4; u8 field_0x104[0x134];
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

struct unk_02322D38 {
    u16 field_0x0;
    u16 field_0x2;
    u32 field_0x4;
};

extern struct unk_02322D38 ov11_02322D38[];
extern s32 ov11_02322C78;
extern s32 ov11_02322C88;
extern s32 ov11_02322C98;
extern s32 ov11_02322CA8;
extern s32 ov11_02322CB8;
extern s32 ov11_02322CC8;
extern s32 ov11_02322CD8;
extern s32 ov11_02322CF0;
extern s32 ov11_02322D10;
extern s32 ov11_02322D60;
extern s32 ov11_02322D88;
extern u8 ov11_02322DB0[];

extern void CloseScrollBox(s8);                                          extern void CloseTextBox2(s8);                                           extern u8 CreateParentMenuFromStringIds(void *, u32, void *, void *);    extern s8 CreateScrollBoxSingle(void *, s32, s32, s32, void *, s32, void *); extern s8 CreateSimpleMenuFromStringIds(void *, s32, s32, void *, s32);  extern s8 CreateTextBox(void *, void *);                                 extern void DrawTextInWindow(s32 window_id, s32 x, s32 y, char *string);
extern struct team_member *GetActiveTeamMember(s32 roster_idx);
extern void GetPressedButtons(u32, u16 *);
extern s32 GetSimpleMenuResult__0202AEA4(s8);                            extern s32 GetSimpleMenuResult__0202B870(s8);                            extern struct ground_monster *GetTeamMember(s32 member_idx);
extern void InitPreprocessorArgs(struct preprocessor_args *);
extern s32 IsScrollBoxActive(s8);                                        extern void ShowDialogueBox(s8);                                         extern void ShowStringIdInDialogueBox(s8, s32, s32, void *);             extern void ov11_022DC504(void);
extern u8 *strcpy(u8 *dest, const u8 *src);

extern void ApplyGummiBoostsToGroundMonster(struct ground_monster *, s16, int, void *);
extern void ApplyGummiBoostsToTeamMember(struct team_member *, s16, int, void *);
extern void CloseAdvancedTextBox(s32 window_id);
extern s8 CreateInventoryMenuOuter(s32, s32, s32, void *, void *, void *, u8);
extern bool8 IsBagNotEmpty(void);
extern u8 PopInventoryMenuField0x1A3(s32 window_id);
extern void SetItemAcquired(struct item *);
extern void SortItemsInBag(void);
extern void *memcpy(void *, const void *, u32);
extern void ov10_022BCDF4(s32 window_id);
extern void ov11_02308D48(void);
extern void *ov11_02308DD8(void *);
extern void ov11_02308EDC(void);
extern void ov11_02308F14(void);
extern void ov11_02308F4C(void *dst, const void *src);
extern void ov11_02308FD0(void *);
extern void ov11_02308FEC(void *);
extern s32 ov11_0230901C(void *);
extern int ov11_02309040(s32);
extern int ov11_02309084(s16);
extern int ov11_023090DC(void);
extern void ov11_02309DAC(void *out);
extern void ov11_02309DF8(void);
extern s16 ov11_02309E24(void);
extern int ov11_02309E48(s16);
extern s32 ov11_02307300(s32, s32, s32);
extern s32 sub_020037A4(void);
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
    char                     buf[0x400];
    struct unk_02309DAC      sel_18;
    struct unk_02309DAC      sel_10;
    u16                      btn_e;
    u16                      btn_c;

    switch (ov11_02324D8C->field_0x0) {
    case 0: {
        ov11_02324D8C->field_0x4 = CreateInventoryMenuOuter(GetNbItemsInBag(), 0, ov11_02324D8C->field_0x10, ov11_02324D8C->field_0x104, (void *)ov11_02307300, ov11_02324D8C->field_0x31c, 0);
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
        u8 v1;

        GetPressedButtons(0, &btn_e);
        v1 = PopInventoryMenuField0x1A3(ov11_02324D8C->field_0x4);
        if ((btn_e & 4) || (btn_e & 0x800) || v1) {
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
                        strcpy((u8 *)buf, StringFromId((u16)(v4->id + 0x2f4b)));
#elif defined(JAPAN)
                        strcpy((u8 *)buf, StringFromId((u16)(v4->id + 0x1d41)));
#else
                        strcpy((u8 *)buf, StringFromId((u16)(v4->id + 0x2f49)));
#endif
                    } else {
                        strcpy((u8 *)buf, ov11_02322DB0);
                    }
                    DrawTextInWindow(v2, 2, 2, buf);
                    UpdateWindow(v2);
                }
            }
            if (!IsInventoryMenuActive(ov11_02324D8C->field_0x4)) {
                s32 v5 = ov10_022BCDBC(ov11_02324D8C->field_0x4);

                if (v5 >= 0) {
                    struct item *v6;
                    s32 v7;
                    s32 v8;

                    ov11_02324D8C->field_0x10 = v5;
                    v6 = GetItemAtIdx(ov11_02324D8C->field_0x10);
                    ov11_02324D8C->field_0x24e = v6->id;
                    if ((bool8)((v6->flags & 1) != 0)) {
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
                            }
                        }
                        menu_a.c = ov11_02324D8C->field_0x276;
                        ov11_02324D8C->field_0x6 = CreateParentMenuFromStringIds(&ov11_02322CB8, 0x400213, &menu_a, ov11_02322D38);
                    } else if (IsGummi(ov11_02324D8C->field_0x24e) && v8 != 4 && v8 != 5) {
                        ov11_02324D8C->field_0x6 = CreateParentMenuFromStringIds(&ov11_02322CB8, 0x400013, 0, &ov11_02322D88);
                    } else if (v6->held_by) {
                        ov11_02324D8C->field_0x6 = CreateParentMenuFromStringIds(&ov11_02322CA8, 0x400013, 0, &ov11_02322D10);
                    } else {
                        ov11_02324D8C->field_0x6 = CreateParentMenuFromStringIds(&ov11_02322CA8, 0x400013, 0, &ov11_02322D60);
                    }
                    ov11_02324D8C->field_0x0 = 3;
                } else {
                    ov10_022BCD10(ov11_02324D8C->field_0x4);
                    ov11_02324D8C->field_0x0 = 0xe;
                }
            } else {
                GetPressedButtons(0, &btn_c);
                if (btn_c & 8) {
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
                    ov11_02324D8C->field_0x7 = CreateParentMenuFromStringIds(&ov11_02322C98, 0x33, &menu_b, &ov11_02322CD8);
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
        struct unk_02308F4C *v2;
        s16 v3;
        s32 v4;

        if (!ov11_023090DC()) {
            break;
        }
        if (ov11_02309E24() != -1) {
            v2 = &ov11_02324D8C->field_0x238;
            ov11_02309DAC(&sel_18);
            ov11_02308F4C(v2, &sel_18);
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
                ShowStringIdInDialogueBox(ov11_02324D8C->field_0x8, 0x18, 0x2BF + OV11_02307334_OFFSET, &ov11_02324D8C->field_0xb4);
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
            v1 = 0x2C1 + OV11_02307334_OFFSET;
            break;
        case 2:
            v1 = 0x2C2 + OV11_02307334_OFFSET;
            break;
        case 4:
            v1 = 0x2C3 + OV11_02307334_OFFSET;
            break;
        case 8:
            v1 = 0x2C4 + OV11_02307334_OFFSET;
            break;
        default:
            v1 = 0x2C0 + OV11_02307334_OFFSET;
            break;
        }
        if (v1 == 0) {
            ov11_02324D8C->field_0x0 = 0x10;
            break;
        }
        ov11_02308EDC();
        ShowStringIdInDialogueBox(ov11_02324D8C->field_0x8, 0x18, 0x2BF + OV11_02307334_OFFSET, &ov11_02324D8C->field_0xb4);
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

            ov11_02309DAC(&sel_10);
            ov11_02308F4C(&v1->field_0x238, &sel_10);
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
        ov11_02324D8C->field_0xc = CreateSimpleMenuFromStringIds(&ov11_02322CC8, 0x33, (s32)&ov11_02324D8C->field_0x1c, &ov11_02322CF0, 3);
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

            if (ov11_02324D8C->field_0x24c < 3) {
                if (sub_02041364(ov11_02324D8C->field_0x24c)) {
                    v1--;
                }
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
        ov11_02324D8C->field_0x7 = CreateParentMenuFromStringIds(0, 0x33, &menu_b, &ov11_02322CD8);
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
    case 15: {
        if (!IsInventoryMenuActive(ov11_02324D8C->field_0x4)) {
            CloseTextBox2(ov11_02324D8C->field_0x5);
            ov11_02324D8C->field_0x5 = -2;
            CloseInventoryMenu(ov11_02324D8C->field_0x4);
            ov11_02324D8C->field_0x4 = -2;
            ov11_02324D8C->field_0x0 = 0x10;
        }
    }
    case 16:
        return 1;
    }

    return 0;
}
