#include "overlay_31_02382820.h"
#include "number_util.h"

extern struct dungeon* DUNGEON_PTR[];

extern const u8 DUNGEON_MENU_SWITCH_STR1[];// = "[dungeon:0]";

extern struct struct_1* OVERLAY31_UNKNOWN_POINTER__NA_238A260[2];
extern u32 DUNGEON_WINDOW_PARAMS_1;
extern u32 DUNGEON_WINDOW_PARAMS_2;
extern struct struct_1 DUNGEON_WINDOW_PARAMS_3;
extern u32 DUNGEON_WINDOW_PARAMS_4;
extern u32 DUNGEON_MAIN_MENU_ITEMS;

extern struct struct_4 ov31_0238A2A0;

extern struct struct_1 OVERLAY31_UNKNOWN_STRUCT__NA_2389E30;

extern u16 ov31_02389E22[];


extern void* MemAlloc(u32 size, u32 nmemb);

extern struct entity* GetLeader(void);
extern u32 GetMoneyCarried(void);
extern void* GetApparentWeather(u32);
extern u32 sub_0204F9E0(void);
extern void ov29_022E2A78(u8*, void*, u32); // The third argument isn't actually used in the
                                     // function (../asm/overlay_29_022E1A40.s#L1378)
extern u8* StringFromId(u32);
extern void PreprocessString(u8* dst, u32 dsize, const u8* src, u32 flags, struct PPStrValues* ptr);
extern void DrawTextInWindow(struct Window*, u32, u32, u8*);
extern void UpdateWindow(struct Window*);

extern u8* AllocateTemp1024ByteBufferFromPool(void);
extern struct Window* GetWindow(struct Window*);
extern s32 sub_020265A8(u8*); // Measures the text's width in pixels

extern u32 ShouldMonsterRunAwayVariation(struct entity*, u32);
extern u32 Arm9LoadUnkFieldNa0x2029EC8(u32, u8*);
extern u8 CreateParentMenuFromStringIds(u32*, u32, struct struct_2*, u32*);
extern u8 CreateTextBox(u32*, void (*fun)(struct Window*));
extern u32 IsParentMenuActive(s8);
extern u32 sub_0202AB80(s8);
extern void Arm9StoreUnkFieldNa0x2029ED8(u32, u8);
extern u32 GetPressedButtons(u32, u16*);
extern u32 ShouldMonsterRunAwayVariation(struct entity*, u32);
extern void sub_0202AB94(s8, u32);
extern void sub_0202B030(s8);
extern void sub_0202F954(s8);
extern struct struct_1* sub_0202ABB0(s8);

extern void CloseTextBox(s8);
extern void CloseParentMenu(s8);
extern void MemFree(void*);

extern void ov29_022EA428(u32, u32);
extern void AdvanceFrame(u8);
extern u32 ov29_022F0B9C(void);
extern void ov29_022E0C2C(u32);

extern u32 GetFloorType(void);
extern u32 PositionIsOnHiddenStairs(struct position*);

void EntryOverlay31(void) {
    struct struct_1* r0;
    if (sub_020348E4(&DUNGEON_WINDOW_PARAMS_3) == 0) {
        return;
    }
    r0 = (struct struct_1*)MemAlloc(16, 0x8);
    OVERLAY31_UNKNOWN_POINTER__NA_238A260[0] = r0;
    r0->a = 0;
    OVERLAY31_UNKNOWN_POINTER__NA_238A260[1] = (struct struct_1*)0xa;
}


void DrawDungeonMenuStatusWindow(struct Window* window)
{
    struct PPStrValues str_values;
    u8 str_buff[DRAW_DUNGEON_MENU_STATUS_WINDOW_BUFF_SIZE];
    u8 member_name_buffer[256];
    struct entity* leader;
    struct monster* leader_info;
    u8* str;
    s32 line_offset;
    u8 is_valid_member;
    s32 i;

    leader = GetLeader();
    leader_info = (struct monster*)leader->info;

    str_values.digits_0 = CeilFixedPoint(leader_info->belly);
    str_values.digits_1 = CeilFixedPoint(leader_info->max_belly);

    str = StringFromId(DRAW_DUNGEON_MENU_STATUS_WINDOW_STR_ID_1);
    PreprocessString(str_buff, DRAW_DUNGEON_MENU_STATUS_WINDOW_BUFF_SIZE, str, 0, &str_values);
    DrawTextInWindow(window, X_OFFSET, 0, str_buff);

    str_values.gold_left_0 = GetMoneyCarried();
    str = StringFromId(DRAW_DUNGEON_MENU_STATUS_WINDOW_STR_ID_2);
    PreprocessString(str_buff, DRAW_DUNGEON_MENU_STATUS_WINDOW_BUFF_SIZE, str, 0, &str_values);
    DrawTextInWindow(window, X_OFFSET, LINE_HEIGHT, str_buff);

    str_values.weather_0 = GetApparentWeather(0);
    str = StringFromId(DRAW_DUNGEON_MENU_STATUS_WINDOW_STR_ID_3);
    PreprocessString(str_buff, DRAW_DUNGEON_MENU_STATUS_WINDOW_BUFF_SIZE, str, 0, &str_values);
    DrawTextInWindow(window, X_OFFSET, LINE_HEIGHT * 2, str_buff);

    str_values.time_0 = sub_0204F9E0();
    str = StringFromId(DRAW_DUNGEON_MENU_STATUS_WINDOW_STR_ID_4);
    PreprocessString(str_buff, DRAW_DUNGEON_MENU_STATUS_WINDOW_BUFF_SIZE, str, DRAW_DUNGEON_MENU_STATUS_WINDOW_CONST_1, &str_values);
    DrawTextInWindow(window, X_OFFSET, LINE_HEIGHT * 3, str_buff);

    line_offset = 0;
    for (i = 0; i < 4; i++) {
        struct entity* party_member = DUNGEON_PTR[0]->party_members[i];
        if (party_member == NULL) {
            is_valid_member = FALSE;
        } else {
            is_valid_member = (party_member->type != ENTITY_NOTHING);
        }
        if (is_valid_member) {
            struct monster* member_info = party_member->info;
            ov29_022E2A78(member_name_buffer, party_member, 0);

            str_values.string0 = member_name_buffer;
            str_values.value_0 = member_info->hp;

            str_values.value_1 = MIN(member_info->max_hp_stat + member_info->max_hp_boost,
                                     DRAW_DUNGEON_MENU_STATUS_WINDOW_CONST_2);

            str = StringFromId(DRAW_DUNGEON_MENU_STATUS_WINDOW_STR_ID_5);
            PreprocessString(str_buff, DRAW_DUNGEON_MENU_STATUS_WINDOW_BUFF_SIZE, str, 0, &str_values);
            DrawTextInWindow(window, 4, line_offset, str_buff);

            line_offset += 12;
            if (line_offset >= 0x30) {
                break;
            }
        }
    }

    UpdateWindow(window);
}

void DungeonMenuSwitch(struct Window* window)
{
    struct PPStrValues str_values;
    str_values.dungeon_0 = DUNGEON_PTR[0]->id | 0x40000;
    str_values.digits_0 = DUNGEON_PTR[0]->floor;
    u8* str_buff = AllocateTemp1024ByteBufferFromPool();
    PreprocessString(str_buff, 0x400, DUNGEON_MENU_SWITCH_STR1, 0, &str_values);
    struct Window* window2 = GetWindow(window);
    s32 text_width = sub_020265A8(str_buff);
    s32 x_offset = (window2->width * 8 - text_width) / 2;
    DrawTextInWindow(window, x_offset, 2, str_buff);
    UpdateWindow(window);
}

u32 ov31_02382B54(void)
{
    u16 pressed_buttons;
    struct struct_2 sp;
    struct entity* leader;

    switch (OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->a) {
        case 0:
            OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->a++;
            break;

        case 1:
            for (int i = 0; i<7; i++) {
                OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->b[i] = 0;
            }
            leader = GetLeader();
            if (ShouldMonsterRunAwayVariation(leader, 1)) {
                OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->b[0] = 3;
                OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->b[1] = 3;
                OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->b[2] = 3;
                OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->b[4] = 3;
            }
            sp.c = OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->b;
            sp.b = Arm9LoadUnkFieldNa0x2029EC8(5, sp.c);

            OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->f[0] = CreateParentMenuFromStringIds(&DUNGEON_WINDOW_PARAMS_1, OV31_02382B54_CONST_1, &sp, &DUNGEON_MAIN_MENU_ITEMS);

            OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->f[2] = CreateTextBox(&DUNGEON_WINDOW_PARAMS_4, DrawDungeonMenuStatusWindow);
            OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->f[1] = CreateTextBox(&DUNGEON_WINDOW_PARAMS_2, DungeonMenuSwitch);
            OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->a++;
            break;

        case 2:
            if (IsParentMenuActive(OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->f[0])) {
                u8 tmp4 = sub_0202AB80(OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->f[0]);

                Arm9StoreUnkFieldNa0x2029ED8(5, tmp4);

                GetPressedButtons(0, &pressed_buttons);
                if ((pressed_buttons & 0x400) == 0)
                    break;

                struct entity* leader = GetLeader();

                if (ShouldMonsterRunAwayVariation(leader, 1))
                    break;

                sub_0202AB94(OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->f[0], 0);

                sub_0202B030(OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->f[0]);

                sub_0202F954(OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->f[1]);

                sub_0202F954(OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->f[2]);

                OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->a++;
            } else {
                sub_0202F954(OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->f[1]);

                sub_0202F954(OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->f[2]);
                OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->a++;
            }
            break;

        case 3:
            OVERLAY31_UNKNOWN_POINTER__NA_238A260[1] = sub_0202ABB0(OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->f[0]);
            OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->a++;
            return 4;
            break;
    }
    return 1;
}

void ov31_02382DAC(void)
{
    if (OVERLAY31_UNKNOWN_POINTER__NA_238A260[0] == NULL)
        return;

    CloseTextBox(OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->f[1]);
    CloseTextBox(OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->f[2]);
    CloseParentMenu(OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]->f[0]);
    MemFree(OVERLAY31_UNKNOWN_POINTER__NA_238A260[0]);
    OVERLAY31_UNKNOWN_POINTER__NA_238A260[0] = NULL;
}

struct struct_1* ov31_02382E08(void)
{
    return OVERLAY31_UNKNOWN_POINTER__NA_238A260[1];
}

void ov31_02382E18(struct entity* arg_1, u32 arg_2)
{
    ov29_022EA428(6, 0);
    AdvanceFrame(0x62);
    AdvanceFrame(0x62);
    CreateStairsMenuState(arg_1);

    while ((u8)(ov31_0238A2A0.st3 != NULL)) {
        AdvanceFrame(0x62);
    }

    AdvanceFrame(0x62);

    if (ov29_022F0B9C()) {
        ov29_022EA428(11, 0);
    } else if (arg_2) {
        ov29_022EA428(11, 0);
    } else {
        ov29_022EA428(0, 0);
    }
    ov29_022E0C2C(1);
}

void CreateStairsMenuState(struct entity* entity)
{
    struct struct_3* tmp1;
    if (sub_020348E4(&OVERLAY31_UNKNOWN_STRUCT__NA_2389E30) == 0)
        return;

    tmp1 = MemAlloc(sizeof(struct struct_3), 8);
    ov31_0238A2A0.st3 = tmp1;
    ov31_0238A2A0.st3->f = 0;
    ov31_0238A2A0.st3->a = entity;
    ov31_0238A2A0.st3->b = 0;
    ov31_0238A2A0.st3->c = 0;

    u32 floor_type = GetFloorType();
    u32 r4 = 0;
    if (floor_type == 2) {
        r4 = 2;
    } else if (floor_type == 1) {
        r4 = 1;
    } else if (PositionIsOnHiddenStairs(&(entity->pos))) {
        r4 = 3;
    }

    ov31_0238A2A0.st3->d = r4;
}

void StairsSubheadingCallback(struct Window* window)
{
    u8* str = StringFromId(ov31_02389E22[ov31_0238A2A0.st3->d * 2]);

    ov31_0238A2A0.str = str;
    DrawTextInWindow(window, 16, 18, str);
    UpdateWindow(window);
}
