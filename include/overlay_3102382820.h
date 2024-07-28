#ifndef PMDSKY_OVERLAY_3102382820_H
#define PMDSKY_OVERLAY_3102382820_H

#include "util.h"
#include "preprocessString.h"
#include "dungeon_mode.h"

struct Window {
    u8 PAD[6];
    u8 width; // 0x6: Window width in multiples of 8 pixels
};

void EntryOverlay31(void);

#ifdef JAPAN
#define DRAW_DUNGEON_MENU_STATUS_WINDOW_DATA_OFFSET 0x1458
#else
#define DRAW_DUNGEON_MENU_STATUS_WINDOW_DATA_OFFSET 0
#endif

#define DRAW_DUNGEON_MENU_STATUS_WINDOW_STR_ID_1 (0x000008B2 + DRAW_DUNGEON_MENU_STATUS_WINDOW_DATA_OFFSET)
#define DRAW_DUNGEON_MENU_STATUS_WINDOW_STR_ID_2 (0x000008B5 + DRAW_DUNGEON_MENU_STATUS_WINDOW_DATA_OFFSET)
#define DRAW_DUNGEON_MENU_STATUS_WINDOW_STR_ID_3 (0x000008B6 + DRAW_DUNGEON_MENU_STATUS_WINDOW_DATA_OFFSET)
#define DRAW_DUNGEON_MENU_STATUS_WINDOW_STR_ID_4 (0x000008B7 + DRAW_DUNGEON_MENU_STATUS_WINDOW_DATA_OFFSET)
#define DRAW_DUNGEON_MENU_STATUS_WINDOW_STR_ID_5 (0x000008B8 + DRAW_DUNGEON_MENU_STATUS_WINDOW_DATA_OFFSET)

#define DRAW_DUNGEON_MENU_STATUS_WINDOW_CONST_1 (0x0000C402)
#define DRAW_DUNGEON_MENU_STATUS_WINDOW_CONST_2 (999)

#define DRAW_DUNGEON_MENU_STATUS_WINDOW_BUFF_SIZE (256)

#define LINE_HEIGHT 12
#define X_OFFSET 115
void DrawDungeonMenuStatusWindow(struct Window* window);
void DungeonMenuSwitch(struct Window* window);

struct struct_1 {
    union {  // 0x0
        s8 f[4];
        s32 d;
    };
    u32 a;   // 0x4
    u8 b[7]; // 0x8
};

struct struct_2 {
    u32 b;        // 0x0
    u8 PAD1[92];
    u8* c;        // 0x60
    u8 PAD2[50];
};

#define OV31_02382B54_CONST_1 (0x00000233)
u32 ov31_02382B54(void);




#endif //PMDSKY_OVERLAY_3102382820_H
