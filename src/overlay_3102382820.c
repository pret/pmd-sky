#include "overlay_3102382820.h"

extern u32 DUNGEON_WINDOW_PARAMS_3[];
extern struct {u32* a; u32 b;} OVERLAY31_UNKNOWN_POINTER__NA_238A260;
extern struct dungeon* DUNGEON_PTR;

extern const u8 DUNGEON_MENU_SWITCH_STR1[];// = "[dungeon:0]";

extern void* MemAlloc(u32 len, u32 flags);
extern void* sub_020348E4(u32*);


struct Window {
    u8 PAD[6];
    u8 width; // 0x6: Window width in multiples of 8 pixels
};


extern struct entity* GetLeader(void);
extern s32 CeilFixedPoint(struct fixed_point);
extern u32 GetMoneyCarried(void);
extern void* GetApparentWeather(u32);
extern u32 sub_0204F9E0(void);
extern void ov29_022E2A78(u8*, void*, u32); // The third argument isn't actually used in the
                                     // function (../asm/overlay_29_022E1A40.s#L1378)
extern u8* StringFromId(u32);
extern void PreprocessString(u8* dst, u32 dsize, const u8* src, u32 flags, struct PPStrValues* ptr);
extern void DrawTextInWindow(struct Window*, u32, u32, u8*);
extern void UpdateWindow(struct Window*);

extern u8* sub_02025888(void);
extern struct Window* GetWindow(struct Window*);
extern s32 sub_020265A8(u8*); // Measures the text's width in pixels

void EntryOverlay31(void) {
    u32* r0 = (u32*)sub_020348E4(DUNGEON_WINDOW_PARAMS_3);
    if (r0 == NULL) {
        return;
    }
    r0 = (u32*)MemAlloc(16, 0x8);
    OVERLAY31_UNKNOWN_POINTER__NA_238A260.a = r0;
    r0[1] = 0;
    OVERLAY31_UNKNOWN_POINTER__NA_238A260.b = 0xa;
}


void DrawDungeonMenuStatusWindow(struct Window* window)
{
    struct PPStrValues str_values;
    u8 str_buff[DRAW_DUNGEON_MENU_STATUS_WINDOW_BUFF_SIZE];
    u8 member_name_buffer[256];
    struct entity* leader;
    struct leader_info* leader_info;
    u8* str;
    s32 line_offset;
    u8 is_valid_member;
    s32 i;
    
    leader = GetLeader();
    leader_info = (struct leader_info*)leader->info;
    
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
        struct entity* party_member = DUNGEON_PTR->party_members[i];
        if (party_member == NULL) {
            is_valid_member = FALSE;
        } else {
            is_valid_member = (party_member->type != ENTITY_NOTHING);
        }
        if (is_valid_member) {
            struct party_member_info* member_info = party_member->info;
            ov29_022E2A78(member_name_buffer, party_member, 0);

            str_values.string0 = member_name_buffer;
            str_values.value_0 = member_info->hp_left;

            str_values.value_1 = MIN(member_info->hp_max_1 + member_info->hp_max_2, DRAW_DUNGEON_MENU_STATUS_WINDOW_CONST_2);
        
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

u32 DungeonMenuSwitch(struct Window* window)
{
    struct PPStrValues str_values;
    str_values.dungeon_0 = DUNGEON_PTR->dungeon | 0x40000;
    str_values.digits_0 = DUNGEON_PTR->floor;
    u8* str_buff = sub_02025888();
    PreprocessString(str_buff, 0x400, DUNGEON_MENU_SWITCH_STR1, 0, &str_values);
    struct Window* window2 = GetWindow(window);
    s32 text_width = sub_020265A8(str_buff);
    s32 x_offset = (window2->width * 8 - text_width) / 2;
    DrawTextInWindow(window, x_offset, 2, str_buff);
    UpdateWindow(window);
}
