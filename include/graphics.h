#ifndef PMDSKY_GRAPHICS_H
#define PMDSKY_GRAPHICS_H

#include "util.h"
#include "wan.h"

struct wan_offset {
    struct uvec2_16 head;
    struct uvec2_16 hand_left;
    struct uvec2_16 hand_right;
    struct uvec2_16 center;
};

struct wan_palettes {
    struct rgba* palette_bytes;
    u16 unk1;
    u16 nb_color;
    u16 unk2;
    u16 unk3;
    s32 unk4; // Normally always 0
};

// Contains data relating to animation.
// Mentioned under the name of "AnimeCtrl" in a debug message.
struct animation_control {
    u16 some_bitfield;
    u16 field1_0x2;
    u16 field2_0x4;
    u16 anim_frame_duration;
    u16 field4_0x8;
    u16 field5_0xa;
    u16 field6_0xc; // (from struct entity) animation frame counter for the idle animation?
    u8 field7_0xe;
    u8 field8_0xf;
    // appears to be a structure used for unknown purpose with 6 2-byte value
    u16 field9_0x10[6];
    u16 field10_0x1c;
    u16 field11_0x1e;
    struct vec2_16 anim_frame_offset;
    struct vec2_16 anim_frame_shadow_offset;
    s32 anim_frame_flag;
    s32 anim_frame_flag_sum;     // ORed from the current WAN animation frame flag
    u16 animations_or_group_len; // number of animation group Chara sprites, other number of
                                      // animation in the first animation group
    u16 field19_0x32;
    u8 field20_0x34;
    u8 field21_0x35;
    u16 field22_0x36; // seems to be an index into the wan fragments table
    u16 field23_0x38;
    u16 anim_frame_frame_id;
    u16 field25_0x3c;
    u8 field26_0x3e;
    u8 field27_0x3f;
    // Used to determine where to store the palette's colors. Multiplied by 0x100
    u8 palette_pos_high;
    u8 palette_pos_low; // Used to determine where to store the palette's colors
    u8 field30_0x42;
    u8 field31_0x43;
    u8 field32_0x44;
    u8 field33_0x45;
    u8 field34_0x46;
    u8 field35_0x47;
    struct wan_animation_frame* first_animation_frame; // first frame in animation group
    struct wan_animation_frame* next_animation_frame;
    struct wan_offset* wan_offsets;
    u8* wan_frames;
    void** wan_fragments_byte_store;
    struct wan_palettes* wan_palettes;
    u16 wan_is_256_color;
    u16 loop_start; // same meaning as in struct wan_animation_frame
    u8 field44_0x64;
    u8 field45_0x65;
    u8 field46_0x66;
    u8 field47_0x67;
    // seems to point to a SIRO file containing another sprite, that is sometimes used instead of
    // the one specified in loaded_sprite_id (maybe it is loaded_sprite_id but looked up?)
    u8* sprite_override;
    u32 field49_0x6c;
    u16 loaded_sprite_id; // id in the WAN_TABLE static list
    u16 field51_0x72;
    u8 field52_0x74;
    u8 field53_0x75;
    u16 animation_group_id;
    u16 animation_id;
    u8 palette_bank;
    u8 field57_0x7b;
};

#endif //PMDSKY_GRAPHICS_H