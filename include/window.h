#ifndef PMDSKY_WINDOW_H
#define PMDSKY_WINDOW_H

#include "enums.h"

// Represents the state of a portrait to be displayed inside a window
typedef struct {
    enum monster_id monster_id; // 0x0: The species id, or the set index inside kaomado.kao
    // 0x2: Index of the emote in the species set of portraits
    u8 portrait_emotion;
    u8 layout_idx; // 0x3: Represents the current layout to display the portrait
    u32 offset_x;  // 0x4: Tile offset (x / 8) in the X axis to draw the portrait
    u32 offset_y;  // 0x8: Tile offset (y / 8) in the Y axis to draw the portrait
    u8 try_flip;      // 0xC: Whether to try to get a flipped portrait from kaomado.kao
    u8 has_flip;      // 0xD: Whether the specified emote has a flipped variant
    u8 hw_flip;       // 0xE: Whether the portrait should be flipped using the hardware
    u8 allow_default; // 0xF: If true, try using emote index 0 if the desired emote can't be found
} portrait_params;


#include "util.h"

typedef struct {
    s32 x;
    s32 y;
} Point;

typedef struct {
    u32 state;
    u8 is_dirty;
    u8 padding_05[3];
    Point base_pos;
    Point alt_pos;
    u8 unk18;
    u8 unk19;
    u16 padding_1A;
    Point extra_pos;
} CursorParams;

typedef struct {
    u32 unk00;
    u8 x;
    u8 y;
    u8 width;
    u8 height;
    volatile u8 bg_id;
    s8 unk09;
    u16 unk0A;
    u32 unk0C;
} WindowTemplate;

typedef struct {
    u16 unk00;
    u16 unk02;
    u16 unk04;
    u16 unk06;
    u8 padding_08[0x0C];
    u16 unk14;
    u16 unk16;
    u16 unk18;
    u16 unk1A;
    u16 unk1C;
    u16 padding_1E;
    u32 unk20;
    u32 unk24;
    u16 padding_28;
    u16 unk2A;
    u8 unk2C;
    u8 unk2D;
    u8 unk2E;
    u8 unk2F;
    u8 padding_30[0x0C];
    u8 unk3C;
    u8 padding_3D;
    u8 unk3E;
    u8 padding_3F;
} WindowBlock;

typedef struct {
    u8 pixels[8][8];
} WindowTile;

typedef struct Window {
    WindowTemplate template;
    s8 id;
    u8 unk11;
    u16 base_tile;
    WindowTile *pixel_buffer;
    u8 *vram_base;
    u32 transfer_length;
    u32 row_stride;
    WindowTile *active_transfer_src;
    u8 *active_vram_dest;
    u32 active_transfer_len;
    u16 unk30;
    u16 unk32;
    WindowBlock render_elem_1;
    WindowBlock render_elem_2;
    u8 unkB4;
    s8 next_window_id;
    s8 is_active;
    u8 unkB7;
    u32 unkB8;
    CursorParams cursor_params;
} Window;

extern Window WINDOW_LIST[20];

struct Window *GetWindow(s32 window_id);
void *GetWindowContents(s32 window_id);

#endif //PMDSKY_WINDOW_H
