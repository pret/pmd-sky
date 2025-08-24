#ifndef PMDSKY_GROUND_BG_H
#define PMDSKY_GROUND_BG_H

#include "directory_file.h"
#include "dungeon_mode.h"

#define BG_NAME_LEN 8
#define BPA_MAX_ENTRIES 8
#define UNK_4_ARR_COUNT 16 // Was 14 in Red
#define UNK_C4_ARR_COUNT 4 // Was 2 in Red
#define NUM_LAYERS 2

struct bg_list_entry_sub_struct {
    char name[BG_NAME_LEN + 2]; // Null-terminated string
};

// Represents an entry in the bg_list.dat file, after being loaded by LoadBgListEntry
struct bg_list_entry {
    struct bg_list_entry_sub_struct bpl;
    struct bg_list_entry_sub_struct bpc;
    struct bg_list_entry_sub_struct bma;
    struct bg_list_entry_sub_struct others_bpa[BPA_MAX_ENTRIES];
};

struct ground_bg_sub_struct_4
{
    s16 unk0;
    s16 unk2;
    const void *unk4;
    const void *unk8;
    //u8 fillC; // Filler byte removed in Sky, present in Red
};

// Was 0x24 in Red...
struct ground_bg_sub_struct_c4
{
    u8 unk0;
    u8 unk1;
    s16 unk2;
    s16 unk4;
    struct iovec bpa_file;
    const void *unk10;
    const void *unk14;
    const void *unk18;
    const void *unk1C;
    void *unk20;
    u32 unk24;
    u32 unk28;
};

struct ground_bg_sub_struct_194
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u8 unk8;
    u8 unk9;
    u8 unkA;
    u8 unkB;
};

struct ground_bg_sub_struct_1a0
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    u8 unk8;
    u8 unk9;
    u8 unkA;
    u8 unkB;
    u8 unkC;
    u8 unkD;
    u8 unkE;
    u8 unkF;
    u8 unk10;
    u8 unk11;
    u8 unk12;
    u8 unk13;
    u8 unk14;
    u8 unk15;
    u8 unk16;
    u8 unk17;
};

struct map_render
{
    s16 chunk_dimensions;
    s16 unk2;
    s16 num_bgs;
    bool8 wrap_around;
    s32 width_chunks;
    s32 height_chunks;
    struct pixel_position map_size_pixels;
    void (*tilemap_render_func)(struct map_render *);
};

struct bma_header
{
    u8 map_width_tiles;
    u8 map_height_tiles;

    u8 map_width_chunks;
    u8 map_height_chunks;

    u16 num_layers;
    u16 has_data_layer;
    u16 has_collision;
};

struct ground_bg_sub_struct_2bc
{
    u8 unk0; // 0x52C
    s16 unk2; // 0x52E
    s16 num_layers; // 0x530
    s16 unk6; // 0x532
    s16 unk8; // 0x534
    s16 unkA; // 0x536
    s16 unkC; // numLayers
    s16 unkE[2]; // 0x53A
    s16 unk12; // 0x53E
    s16 unk14;
    s16 unk16;
    void (*unk18)(void *, const void *, struct bma_header *, s32);
};

// size: 0x55C
struct ground_bg
{
    s16 unk0; // Not present in Red
    struct ground_bg_sub_struct_4 unk4[UNK_4_ARR_COUNT];
    struct ground_bg_sub_struct_c4 unkC4[UNK_C4_ARR_COUNT]; // 0xc4
    struct iovec bpl_file; // 0x174
    struct iovec unk17C; // 0x17C
    struct iovec bpc_file; // 0x184
    struct iovec bma_file; // 0x18c
    struct ground_bg_sub_struct_194 unk194;
    struct ground_bg_sub_struct_1a0 unk1A0;
    u8 unk1B8;
    u8 unk1B9;
    u8 unk1BA;
    u8 unk1BB;
    u8 unk1BC;
    u8 unk1BD;
    s16 unk1BE;
    u8 unk1C0;
    u8 unk1C1;
    u8 unk1C2;
    u8 unk1C3;
    u8 unk1C4;
    u8 unk1C5;
    u8 unk1C6;
    u8 unk1C7;
    u8 unk1C8;
    u8 unk1C9;
    u8 unk1CA;
    u8 unk1CB;
    u8 unk1CC;
    u8 unk1CD;
    u8 unk1CE;
    u8 unk1CF;
    u8 unk1D0;
    u8 unk1D1;
    u8 unk1D2;
    u8 unk1D3;
    u8 unk1D4;
    u8 unk1D5;
    u8 unk1D6;
    u8 unk1D7;
    u8 unk1D8;
    u8 unk1D9;
    u8 unk1DA;
    u8 unk1DB;
    u8 unk1DC;
    u8 unk1DD;
    u8 unk1DE;
    u8 unk1DF;
    u8 unk1E0;
    u8 unk1E1;
    u8 unk1E2;
    u8 unk1E3;
    u8 unk1E4;
    u8 unk1E5;
    u8 unk1E6;
    u8 unk1E7;
    u8 unk1E8;
    u8 unk1E9;
    u8 unk1EA;
    u8 unk1EB;
    u8 unk1EC;
    u8 unk1ED;
    u8 unk1EE;
    u8 unk1EF;
    s32 unk1F0;
    s32 unk1F4;
    u8 unk1F8;
    u8 unk1F9;
    u8 unk1FA;
    u8 unk1FB;
    u8 unk1FC;
    u8 unk1FD;
    u8 unk1FE;
    u8 unk1FF;
    struct pixel_position camera_pixel_position[NUM_LAYERS]; // 0x200
    struct map_render map_render[NUM_LAYERS]; // 0x210
    u8 unk248[112];
    s16 unk2B8;
    u8 unk2BA;
    struct ground_bg_sub_struct_2bc unk52C; // 2bc
    u16 *unk2D8;
    u16 *unk2DC[2];
    u16 *unk2E4[2];
    u16 *unk2EC[2];
};

#endif //PMDSKY_GROUND_BG_H