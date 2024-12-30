#ifndef PMDSKY_OVERLAY_31_02382820_H
#define PMDSKY_OVERLAY_31_02382820_H

#include "main_020348E4.h"
#include "util.h"
#include "preprocessString.h"
#include "dungeon.h"

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
// Draws the contents shown in the main dungeon menu status window showing the player's belly, money, play time, etc.
void DrawDungeonMenuStatusWindow(struct Window* window);
void DungeonMenuSwitch(struct Window* window);

struct struct_2 {
    u32 b;        // 0x0
    u8 PAD1[92];
    u8* c;        // 0x60
    u8 PAD2[50];
};

struct struct_3 {
    s8                e[4]; // 0x0
    u32               f;    // 0x4
    struct entity*    a;    // 0x8
    u32               b;    // 0xC
    u32               c;    // 0x10
    u32               d;    // 0x14
};

struct struct_5 {
    u32 field_0x0;
    u32 field_0x4;
    u8 PAD1[172];
    struct struct_6* a; // 0xB4
};

struct struct_6 {
    u8  PAD[74];
    u16 a;   // 0x4A
    u16 field_0x4c;
    u8  b;   // 0x4E
    u8  field_0x4f;
    u16 c;   // 0x50
    u16 d;   // 0x52
    u8  e;   // 0x54
    u8  field_0x55;
    u16 f;   // 0x56
    u16 g;   // 0x58
};

struct struct_4 {
    u8* str;
    struct struct_3* st3;
};

#define OV31_02382B54_CONST_1 (0x00000233)

u32 ov31_02382B54(void);
void ov31_02382DAC(void);
struct struct_1* ov31_02382E08(void);
void ov31_02382E18(struct entity* arg_1, u32 arg_2);
// Called when the leader steps on any stairs tile (regular, warp zone, rescue point, hidden stairs).
// Allocates a stairs_menu struct on the heap with information for HandleStairsMenu, which will be pointed to by STAIRS_MENU_PTR.
// r0: Entity pointer (in practice, always the leader)
void CreateStairsMenuState(struct entity* entity);
// Callback function passed to CreateAdvancedTextBox for creating the subheading for the stairs menu.
void StairsSubheadingCallback(struct Window* window);




#endif //PMDSKY_OVERLAY_31_02382820_H
