#include "main_0203D538.h"
#include "window.h"
#include "common.h"
#include "item.h"
#include "main_0200C4FC.h"
#include "item_util.h"
#include "item_util_4.h"
#include "main_02017B58.h"
#include "main_0201077C.h"
#include "main_020107DC.h"
#include "item_util_1.h"
#include "main_0200330C.h"
#include "main_0200ECFC.h"
#include "main_020251AC.h"
#include "main_0202AB40.h"
#include "main_0202B4C4.h"
#include "main_0203755C.h"
#include "progression.h"
#include "script_variable.h"
#include "main_020517D4.h"
#include "main_0202A66C.h"
#include "main_0200224C.h"
#include "main_0202B558.h"

struct unk_020AFE74 {
    s32 field_0x0;
    s8 field_0x4;
    s8 field_0x5;
    s8 field_0x6;
    u8 field_0x7;
    s32 field_0x8;
    u8 field_0xc;
    u8 field_0xd[3];
    s32 field_0x10;
    s16 field_0x14;
    u8 field_0x16[2];
    s32 field_0x18;
    s32 field_0x1c;
    s32 field_0x20;
    struct item field_0x24[3];
    u8 field_0x36;
    u8 field_0x37;
    s16 field_0x38;
    u8 field_0x3a[2];
    s32 field_0x3c;
    struct ground_monster field_0x40;
    struct item field_0x84;
    u8 field_0x8a[2];
    struct preprocessor_args field_0x8c;
    s16 field_0xdc;
    struct item field_0xde;
    u32 field_0xe4;
    char field_0xe8[0x50];
    char field_0x138[0x50];
    s32 field_0x188;
    s32 field_0x18c;
    portrait_params field_0x190;
    s8 field_0x1a0;
    char field_0x1a1[10];
    char field_0x1ab[10];
    char field_0x1b5[10];
    u8 field_0x1bf[0xf6];
    char field_0x2b5[0x4e];
    u8 field_0x303[0xb5];
    struct ground_monster *field_0x3b8;
    s32 field_0x3bc;
};

extern struct unk_020AFE74 *MISSION_REWARD_STRUCT_MAIN_PTR;

extern void GetNameWithGender(char *dst, s16 monster_id, char color_id);
extern void GetNameRaw(unsigned char *, s32);
extern void InitPreprocessorArgs(struct preprocessor_args* args);
extern bool8 IsMonsterIllegalForMissions(enum monster_id);
extern void sub_02046BE8(s32 a, s32 b, struct preprocessor_args *c);
extern s32 sub_02046C78(void);
extern void sub_02046D20(void);
extern s32 ov11_0230D220(void);
extern void ov11_0230D92C(void);
extern void *ov11_02306C64();
extern s32 ov11_02306C9C();
extern s32 GetKeyboardStatus();
extern s32 sub_02037468();
extern s32 sub_02039218();
extern s32 sub_0203931C();

extern s32 sub_02046028(void);
extern void sub_02045FD0(struct item *out);
extern bool8 AddItemToStorage(struct item *item);
extern void InitUnkStorageStruct0x410(struct item *, u8);
extern s32 GetRank(void);
extern void sub_0203F00C(void);
extern void MissionRewardCloseAllBoxes(void);
extern struct ground_monster *sub_02055D4C(struct ground_monster *mon);
extern void sub_02052E2C(struct ground_monster *, s16, s32, const u8 *, const u16 *);
extern void sub_02053A0C(u16 *buf, s16 monster_id, s32, s32);
extern void ApplyLevelUpBoostsToGroundMonster(void *mon, s16 levels, s32 flag);
extern void sub_02050C10(s32 delta);
extern void sub_0203909C(u8 *name);
extern void ShowKeyboard(s32 mode, u8 *, s32, u8 *);
extern void ov11_023061CC(void *);
extern void ov11_023061E4(void *, s32);
extern void ov11_02310BDC(void);

extern const u8 _0209C844[2];
extern const u16 _0209C846[4];
extern struct unk_0209C850 _0209C850;
extern WindowTemplate _0209C85C;
extern struct unk_0202A5CC _0209C86C[];
extern s32 _0209C884;

#ifdef JAPAN
#define SUB_0203D538_OFFSET 0x21D4
#else
#define SUB_0203D538_OFFSET 0
#endif

s32 sub_0203D538(void)
{
    u16 v6[4];
    struct item v5;
    struct item v4;
    struct item v3;
    struct item v2;
#ifndef JAPAN
    struct item v1;
#endif
    struct preprocessor_args v7;
    struct preprocessor_args v8;
    struct preprocessor_args v9;

    switch (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0) {
        case 0: {
            s32 i;
            s32 k;
            k = -1;
            if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x36 != 0) {
                if (GetEggSpecies() != 0 || !GetResolvedPerformanceProgressFlag(0x1e)) {
                    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1c = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1c * k;
                    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x36 = 0;
                    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x38 = 0;
                }
            } else if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x38 != 0) {
                if (!GetResolvedPerformanceProgressFlag(0x1d) || IsMonsterIllegalForMissions((enum monster_id)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x38)) {
                    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x38 = 0;
                    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1c = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1c * k;
                }
            }
            if (!(MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe4 & 0x10) && !GetResolvedPerformanceProgressFlag(0x1f)) {
                for (i = 0; i < MISSION_REWARD_STRUCT_MAIN_PTR->field_0x20; i++) {
                    if (GetItemCategory(MISSION_REWARD_STRUCT_MAIN_PTR->field_0x24[i].id) == CATEGORY_EXCLUSIVE_ITEMS) {
                        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x24[i].id = ITEM_NOTHING;
                        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1c = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1c * k;
                    }
                }
            }
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 1;
            break;
        }
        case 1: {
            u16 msg;
            if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1c <= 0) {
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 7;
                break;
            }
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.number_vals[0] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1c;
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.number_vals[1] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1c * 10;
            if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 != 0) {
                if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 2) {
                    msg = (0x289 + SUB_0203D538_OFFSET);
                    sub_0203F00C();
                } else if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 3) {
                    msg = (0x28a + SUB_0203D538_OFFSET);
                    sub_0203F00C();
                } else if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 4) {
                    msg = LoadScriptVariableValue(NULL, VAR_REQUEST_THANKS_RESULT_VARIATION) + (0x28b + SUB_0203D538_OFFSET);
                    sub_0203F00C();
                } else {
                    msg = (0x288 + SUB_0203D538_OFFSET);
                }
                sub_02046BE8(0x101c, msg, &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 2;
            } else {
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 4;
            }
            break;
        }
        case 2:
            if (sub_02046C78() != 0) {
                MissionRewardCloseAllBoxes();
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188 = 10;
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 3;
            }
            break;
        case 3:
            if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188-- <= 0) {
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 4;
            }
            break;
        case 4: {
            u16 msg;
            sub_02017C50(4);
            AddMoneyCarried(MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1c);
            if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 2) {
                msg = (0x26f + SUB_0203D538_OFFSET);
            } else if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 3) {
                msg = (0x270 + SUB_0203D538_OFFSET);
            } else if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 4) {
                msg = (0x271 + SUB_0203D538_OFFSET);
            } else {
                msg = (0x26e + SUB_0203D538_OFFSET);
            }
            sub_02046BE8(0x101c, msg, &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 5;
            break;
        }
        case 5:
            if (sub_02046C78() != 0) {
                MissionRewardCloseAllBoxes();
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188 = 10;
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 6;
            }
            break;
        case 6:
            if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188-- <= 0) {
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 7;
            }
            break;
        case 7: {
            u16 msg;
            if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x38 == 0 || MISSION_REWARD_STRUCT_MAIN_PTR->field_0x36 != 0) {
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x29;
                break;
            }
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.flag_vals[0] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x14;
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.flag_vals[1] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x38;
            if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 != 0) {
                if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 2) {
                    msg = (0x29a + SUB_0203D538_OFFSET);
                    sub_0203F00C();
                } else if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 4) {
                    msg = LoadScriptVariableValue(NULL, VAR_REQUEST_THANKS_RESULT_VARIATION) + (0x29b + SUB_0203D538_OFFSET);
                    sub_0203F00C();
                } else {
                    msg = (0x299 + SUB_0203D538_OFFSET);
                }
                sub_02046BE8(0x3008, msg, &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 8;
            } else {
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0xb;
            }
            break;
        }
        case 8:
            if (sub_02046C78() != 0) {
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x4 = CreateParentMenuFromStringIds(NULL, 0x11, NULL, (struct unk_0202A5CC *)&_0209C884);
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 9;
            }
            break;
        case 9:
            if (!IsParentMenuActive(MISSION_REWARD_STRUCT_MAIN_PTR->field_0x4)) {
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x18c = GetSimpleMenuResult__0202AEA4(MISSION_REWARD_STRUCT_MAIN_PTR->field_0x4);
                MissionRewardCloseAllBoxes();
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188 = 10;
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 10;
            }
            break;
        case 10:
            if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188-- <= 0) {
                if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x18c == 0) {
                    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0xb;
                } else {
                    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x23;
                }
            }
            break;
        case 11: {
            struct unk_0209C846 {
                u16 field_0x0[4];
            };
            *(struct unk_0209C846 *)v6 = *(const struct unk_0209C846 *)_0209C846;
            sub_02053A0C(v6, MISSION_REWARD_STRUCT_MAIN_PTR->field_0x38, 1, 0);
            sub_02052E2C(&MISSION_REWARD_STRUCT_MAIN_PTR->field_0x40, MISSION_REWARD_STRUCT_MAIN_PTR->field_0x38, 0, _0209C844, v6);
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x3b8 = sub_02055D4C(&MISSION_REWARD_STRUCT_MAIN_PTR->field_0x40);
            if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x3b8 != NULL) {
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0xc;
            } else {
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x1e;
            }
            break;
        }
    case 12:
        if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x18 > 1) {
            ApplyLevelUpBoostsToGroundMonster(MISSION_REWARD_STRUCT_MAIN_PTR->field_0x3b8, (s16)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x18, 1);
        }
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.flag_vals[0] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x38;
        if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 2) {
            sub_02046BE8(0x101C, (0x27A + SUB_0203D538_OFFSET), &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
            sub_0203F00C();
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0xd;
        } else if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 4) {
            sub_02046BE8(0x101C, (u16)(LoadScriptVariableValue(0, 0x69) + (0x27B + SUB_0203D538_OFFSET)), &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
            sub_0203F00C();
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0xd;
        } else {
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0xf;
        }
        break;
    case 13:
        if (sub_02046C78() != 0) {
            MissionRewardCloseAllBoxes();
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188 = 10;
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0xe;
        }
        break;
    case 14:
        if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188-- <= 0) {
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0xf;
        }
        break;
    case 15:
        GetNameWithGender(MISSION_REWARD_STRUCT_MAIN_PTR->field_0x2b5, MISSION_REWARD_STRUCT_MAIN_PTR->field_0x38, 0x4e);
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.strings[0] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x2b5;
        sub_02046BE8(0x100C, (0x2A6 + SUB_0203D538_OFFSET), &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
#ifdef JAPAN
        StrcpySimple((unsigned char *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1a1, (const unsigned char *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x3b8->name);
#else
        StrncpySimple((unsigned char *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1a1, (const unsigned char *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x3b8->name, 10);
#endif
        MemcpySimple((u8 *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1ab, (u8 *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x3b8->name, 10);
        StrncpySimpleNoPadSafe((u8 *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1b5, (const u8 *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1ab, 10);
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x10;
        break;
    case 16:
        if (sub_02046C78() != 0) {
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1a0 = CreateSimpleMenuFromStringIds(&_0209C85C, 0x300011, 0, _0209C86C, 2);
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x11;
        }
        break;
    case 17:
        if (IsSimpleMenuActive(MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1a0) == 0) {
            s32 result = GetSimpleMenuResult__0202B870(MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1a0);
            CloseSimpleMenu(MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1a0);
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1a0 = -2;
            sub_02046D20();
            switch (result) {
                case 0:
                    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x12;
                    break;
                case 1:
                default:
                    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x20;
                    break;
            }
        }
        break;
    case 18:
        ov11_0230D92C();
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x13;
        break;
    case 19:
        if (ov11_0230D220() == 0) {
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x14;
        }
        break;
    case 20:
        ShowKeyboard(2, (u8 *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1ab, 0, (u8 *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1a1);
        ov11_02310BDC();
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x15;
        break;
    case 21:
        if (ov11_0230D220() == 0) {
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x16;
        }
        break;
    case 22:
        if (GetKeyboardStatus() == 3) {
            MemcpySimple((u8 *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1ab, (u8 *)GetKeyboardStringResult(), 10);
            StrncpySimpleNoPadSafe((u8 *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1b5, (const u8 *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1ab, 10);
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x17;
        }
        break;
    case 23:
        if (sub_02037468() != 0) {
            ov11_0230D92C();
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x18;
        }
        break;
    case 24:
        if (ov11_0230D220() == 0) {
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x19;
        }
        break;
    case 25:
        ov11_0230D92C();
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x1a;
        break;
    case 26:
        if (ov11_0230D220() == 0) {
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x1b;
        }
        break;
    case 27:
        sub_0203909C((u8 *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1b5);
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x1c;
        break;
    case 28:
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x3bc = sub_0203931C();
        if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x3bc >= 0) {
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x1d;
        }
        break;
    case 29:
        if (sub_02039218() != 0) {
            switch (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x3bc) {
                case 0:
                    MemcpySimple((u8 *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x3b8->name, (u8 *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1ab, 10);
                    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x20;
                    break;
                case 1:
                default:
                    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x12;
                    break;
            }
        }
        break;
    case 32:
        {
            s32 v10;
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.flag_vals[0] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x38 | 0x80000;
            StrncpySimpleNoPadSafe((u8 *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1b5, (u8 *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1ab, 10);
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.strings[0] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x1b5;
            if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 2) {
                v10 = (0x283 + SUB_0203D538_OFFSET);
            } else {
                v10 = (0x281 + SUB_0203D538_OFFSET);
            }
            sub_02017C50(5);
            sub_02046BE8(0x101C, v10, &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x21;
        }
        break;
    case 33:
        if (sub_02046C78()) {
            MissionRewardCloseAllBoxes();
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188 = 10;
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x22;
        }
        break;
    case 34:
        if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188-- <= 0) {
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x29;
        }
        break;
    case 30:
        sub_02046D20();
        if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 2 || MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 3) {
            ov11_023061E4(&MISSION_REWARD_STRUCT_MAIN_PTR->field_0x40, 1);
        } else {
            ov11_023061CC(&MISSION_REWARD_STRUCT_MAIN_PTR->field_0x40);
        }
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x1f;
        break;
    case 31:
        {
            s32 v10;
            struct ground_monster *v11;
            v10 = ov11_02306C9C();
            switch (v10) {
            case 3:
            case 4:
                v11 = ov11_02306C64();
                if (v11 == 0) {
                    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x23;
                } else {
                    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x3b8 = v11;
                    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0xc;
                }
                break;
            }
        }
        break;
    case 35:
        GetNameRaw((u8 *)MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe8, MISSION_REWARD_STRUCT_MAIN_PTR->field_0x38);
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.strings[0] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe8;
        sub_02046BE8(0x101C, (0x284 + SUB_0203D538_OFFSET), &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x24;
        break;
    case 36:
        if (sub_02046C78()) {
            MissionRewardCloseAllBoxes();
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188 = 10;
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x25;
        }
        break;
    case 37:
        if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188-- <= 0) {
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x26;
        }
        break;
    case 38:
        sub_02017C50(4);
        AddMoneyCarried(1000);
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.number_vals[0] = 1000;
        sub_02046BE8(0x101C, (0x285 + SUB_0203D538_OFFSET), &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x27;
        break;
    case 39:
        if (sub_02046C78()) {
            MissionRewardCloseAllBoxes();
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188 = 10;
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x28;
        }
        break;
    case 40:
        if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188-- <= 0) {
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x29;
        }
        break;
    case 41:
        {
            s32 v10;
            if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x10 >= MISSION_REWARD_STRUCT_MAIN_PTR->field_0x20) {
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x3a;
                break;
            }
            v5.id = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x24[MISSION_REWARD_STRUCT_MAIN_PTR->field_0x10].id;
            v5.flags = 0;
            if (IsStorableItem(v5.id)) {
                if (IsThrownItem(v5.id) || (v5.id >= ITEM_GORGEOUS_BOX_1 && v5.id <= ITEM_SINISTER_BOX_3)) {
                    v5.quantity = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x24[MISSION_REWARD_STRUCT_MAIN_PTR->field_0x10].quantity;
                } else {
                    v5.quantity = 0;
                }
                v5.flags = 1;
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x24[MISSION_REWARD_STRUCT_MAIN_PTR->field_0x10] = v5;
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.id_vals[0] = v5.id;
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.number_vals[0] = 0;
                MaybeGetColoredFormattedItemName(MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe8, &v5, &_0209C850);
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.strings[0] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe8;
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.flag_vals[0] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x14;
                if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 != 0) {
                    if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 2) {
                        v10 = (0x296 + SUB_0203D538_OFFSET);
                        sub_0203F00C();
                    } else if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 3) {
                        v10 = (0x297 + SUB_0203D538_OFFSET);
                        sub_0203F00C();
                    } else if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 4) {
                        v10 = (0x298 + SUB_0203D538_OFFSET);
                        sub_0203F00C();
                    } else {
                        v10 = (0x295 + SUB_0203D538_OFFSET);
                    }
                    sub_02046BE8(0x101C, v10, &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
                    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x2a;
                } else {
                    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x2c;
                }
            } else {
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x33;
            }
        }
        break;
    case 42:
        if (sub_02046C78()) {
            MissionRewardCloseAllBoxes();
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188 = 10;
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x2b;
        }
        break;
    case 43:
        if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188-- <= 0) {
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x2c;
        }
        break;
    case 44:
        if (AddItemToStorage(&MISSION_REWARD_STRUCT_MAIN_PTR->field_0x24[MISSION_REWARD_STRUCT_MAIN_PTR->field_0x10])) {
            if ((MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe4 & 2) == 0) {
                sub_02017C50(4);
            }
            if ((MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe4 & 4) == 0) {
                sub_02046BE8(0x1c, (0x273 + SUB_0203D538_OFFSET), &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x2e;
            } else if ((MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe4 & 8) != 0) {
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x30;
            } else {
                MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x33;
            }
        } else {
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x34;
        }
        break;
case 52:
    v4.id = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x24[MISSION_REWARD_STRUCT_MAIN_PTR->field_0x10].id;
    v4.quantity = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x24[MISSION_REWARD_STRUCT_MAIN_PTR->field_0x10].quantity;
    v4.flags = 0;
    sub_02046D20();
    InitUnkStorageStruct0x410(&v4, (MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe4 & 1) == 0);
    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x35;
    break;
case 53:
    switch (sub_02046028()) {
    case 4:
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188 = 10;
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x2d;
        break;
    case 2:
        sub_02045FD0(&MISSION_REWARD_STRUCT_MAIN_PTR->field_0xde);
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188 = 10;
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x36;
        break;
    case 3:
        sub_02045FD0(&MISSION_REWARD_STRUCT_MAIN_PTR->field_0xde);
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188 = 10;
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x38;
        break;
    }
    break;
case 54:
    if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188-- <= 0) {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x37;
    }
    break;
case 55:
    if (AddItemToStorage(&MISSION_REWARD_STRUCT_MAIN_PTR->field_0x24[MISSION_REWARD_STRUCT_MAIN_PTR->field_0x10])) {
        if ((MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe4 & 2) == 0) {
            sub_02017C50(4);
        }
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.id_vals[0] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x24[MISSION_REWARD_STRUCT_MAIN_PTR->field_0x10].id;
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.number_vals[0] = 0;
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.id_vals[2] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0xdc;
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.number_vals[2] = 0;
        v3.id = MISSION_REWARD_STRUCT_MAIN_PTR->field_0xde.id;
        v3.quantity = MISSION_REWARD_STRUCT_MAIN_PTR->field_0xde.quantity;
        v3.flags = 0;
        MaybeGetColoredFormattedItemName(MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe8, &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x24[MISSION_REWARD_STRUCT_MAIN_PTR->field_0x10], &_0209C850);
        MaybeGetColoredFormattedItemName(MISSION_REWARD_STRUCT_MAIN_PTR->field_0x138, &v3, &_0209C850);
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.strings[2] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x138;
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.strings[0] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe8;
        sub_02046BE8(0x101C, (0x275 + SUB_0203D538_OFFSET), &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x2e;
    } else {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x34;
    }
    break;
case 56:
    if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188-- <= 0) {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x39;
    }
    break;
case 57:
    if (AddItemToStorage(&MISSION_REWARD_STRUCT_MAIN_PTR->field_0x24[MISSION_REWARD_STRUCT_MAIN_PTR->field_0x10])) {
        if ((MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe4 & 2) == 0) {
            sub_02017C50(4);
        }
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.id_vals[0] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x24[MISSION_REWARD_STRUCT_MAIN_PTR->field_0x10].id;
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.number_vals[0] = 0;
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.id_vals[2] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0xdc;
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.number_vals[2] = 0;
        MaybeGetColoredFormattedItemName(MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe8, &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x24[MISSION_REWARD_STRUCT_MAIN_PTR->field_0x10], &_0209C850);
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.strings[0] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe8;
        sub_02046BE8(0x101C, (0x277 + SUB_0203D538_OFFSET), &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x2e;
    } else {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x34;
    }
    break;
case 45:
    if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188-- <= 0) {
        sub_02046BE8(0x101C, (0x286 + SUB_0203D538_OFFSET), &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
        sub_02045FD0(&MISSION_REWARD_STRUCT_MAIN_PTR->field_0xde);
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x2e;
    }
    break;
case 46:
    if (sub_02046C78()) {
        MissionRewardCloseAllBoxes();
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188 = 10;
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x2f;
    }
    break;
case 47:
    if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188-- <= 0) {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x33;
    }
    break;
case 48:
    #ifdef JAPAN
        sub_02046BE8(0x101C, 0x2FEC, &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
#else
        sub_02046BE8(0x101C, 0x2CC, &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
#endif
    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x31;
    break;
case 49:
    if (sub_02046C78()) {
        MissionRewardCloseAllBoxes();
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188 = 10;
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x32;
    }
    break;
case 50:
    if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188-- <= 0) {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x33;
    }
    break;
case 51:
    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x10++;
    if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x10 < 3) {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x29;
    } else {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x3a;
    }
    break;
case 58:
    if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x36 == 0) {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x40;
        break;
    }
    if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 != 0) {
        s32 v10;
        if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 2) {
            v10 = (0x292 + SUB_0203D538_OFFSET);
            sub_0203F00C();
        } else if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 3) {
            v10 = (0x293 + SUB_0203D538_OFFSET);
            sub_0203F00C();
        } else if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8 == 4) {
            v10 = (0x294 + SUB_0203D538_OFFSET);
            sub_0203F00C();
        } else {
            v10 = (0x291 + SUB_0203D538_OFFSET);
        }
        sub_02046BE8(0x101c, v10, &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x3b;
    } else {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x3d;
    }
    break;
case 59:
    if (sub_02046C78() != 0) {
        MissionRewardCloseAllBoxes();
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188 = 10;
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x3c;
    }
    break;
case 60:
    if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188-- <= 0) {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x3d;
    }
    break;
case 61:
    sub_02017C50(5);
    SetEggSpecies(MISSION_REWARD_STRUCT_MAIN_PTR->field_0x38);
    SetEggHatchTimer((u16)(RandIntSafe(4) + 6));
    sub_02046BE8(0x101c, (0x272 + SUB_0203D538_OFFSET), &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x3e;
    break;
case 62:
    if (sub_02046C78() != 0) {
        MissionRewardCloseAllBoxes();
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188 = 10;
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x3f;
    }
    break;
case 63:
    if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x188-- <= 0) {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x40;
    }
    break;
case 64:
    if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0x3c == 0) {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x4c;
        break;
    }
    InitPreprocessorArgs(&v7);
    MISSION_REWARD_STRUCT_MAIN_PTR->field_0xc = GetRank();
    sub_02050C10(MISSION_REWARD_STRUCT_MAIN_PTR->field_0x3c);
    sub_02017C50(4);
    v7.number_vals[0] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x3c;
    sub_02046BE8(0x101c, (0x2a1 + SUB_0203D538_OFFSET), &v7);
    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x41;
    break;
case 65:
    if (sub_02046C78() != 0) {
        if (MISSION_REWARD_STRUCT_MAIN_PTR->field_0xc != GetRank()) {
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x42;
        } else {
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x4c;
        }
    }
    break;
case 66:
    sub_02017C50(2);
    InitPreprocessorArgs(&v8);
    v8.id_vals[2] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0xc;
    v8.id_vals[3] = GetRank();
    sub_02046BE8(0x101c, (0x2a2 + SUB_0203D538_OFFSET), &v8);
    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x43;
    break;
case 67:
    if (sub_02046C78() != 0) {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x44;
    }
    break;
case 68:
    InitPreprocessorArgs(&v9);
    v9.number_vals[0] = GetRankUpEntry(MISSION_REWARD_STRUCT_MAIN_PTR->field_0xc)->field_0x8;
    v9.number_vals[1] = GetRankUpEntry(GetRank())->field_0x8;
    if (v9.number_vals[0] == v9.number_vals[1]) {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x46;
        break;
    }
    sub_02046BE8(0x101c, (0x2a3 + SUB_0203D538_OFFSET), &v9);
    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x45;
    break;
case 69:
    if (sub_02046C78() != 0) {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x46;
    }
    break;
case 70: {
    struct unk_020AFE74 *p;
    s16 v;
    p = MISSION_REWARD_STRUCT_MAIN_PTR;
    v = GetRankUpEntry(GetRank())->field_0xc;
    p->field_0x84.id = v;
    if (v == 0) {
        sub_02046D20();
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x4c;
    } else if (IsStorableItem(v)) {
        p->field_0x84.quantity = IsThrownItem(p->field_0x84.id) != 0;
        p->field_0x84.flags = ITEM_FLAG_EXISTS;
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.id_vals[0] = p->field_0x84.id;
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.number_vals[0] = 0;
        sub_02017C50(4);
        sub_02046BE8(0x101c, (0x2a4 + SUB_0203D538_OFFSET), &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x47;
    } else {
        sub_02046D20();
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x4c;
    }
    break;
}
case 71:
    if (sub_02046C78()) {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x48;
    }
    break;
case 72:
    if (!AddItemToStorage(&MISSION_REWARD_STRUCT_MAIN_PTR->field_0x84)) {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x49;
    } else {
        sub_02046D20();
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x4c;
    }
    break;
case 73:
    v2.id = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x84.id;
    v2.quantity = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x84.quantity;
    v2.flags = 0;
    sub_02046D20();
    InitUnkStorageStruct0x410(&v2, (MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe4 & 1) == 0);
    MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x4a;
    break;
case 74: {
    s32 v10;
    v10 = sub_02046028();
#ifndef JAPAN
    if (v10 == 1) {
        break;
    }
    sub_02045FD0(&v1);
    if (v1.id == 0) {
        v1 = MISSION_REWARD_STRUCT_MAIN_PTR->field_0x84;
    }
#endif
    switch (v10) {
        case 4:
#ifndef JAPAN
            MaybeGetColoredFormattedItemName(MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe8, &v1, &_0209C850);
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c.strings[0] = MISSION_REWARD_STRUCT_MAIN_PTR->field_0xe8;
#endif
            sub_02046BE8(0x101c, (0x286 + SUB_0203D538_OFFSET), &MISSION_REWARD_STRUCT_MAIN_PTR->field_0x8c);
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x4b;
            break;
        case 2:
        case 3:
            MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x48;
            break;
    }
    break;
}
case 75:
    if (sub_02046C78()) {
        MISSION_REWARD_STRUCT_MAIN_PTR->field_0x0 = 0x4c;
    }
    break;
case 76:
    return 1;
    }
    return 0;
}
