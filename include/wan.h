#ifndef PMDSKY_WAN_H
#define PMDSKY_WAN_H

#include "util.h"

struct wan_animation_frame {
    u8 duration;
    u8 flag;
    u16 frame_id;
    struct vec2_16 offset;
    struct vec2_16 shadow_offset;
};

struct wan_table_entry {
    char path[32];                  // 0x0: Needs to be null-terminated. Only used for direct file.
    bool8 file_externally_allocated; // 0x20: True if the iov_base shouldn’t be freed by this struct.
    u8 source_type; // 0x21: 1 = direct file, 2 = pack file
    s16 pack_id;                      // 0x22: for wan in pack file
    s16 file_index;                   // 0x24: for wan in pack file
    u8 field5_0x26;
    u8 field6_0x27;
    u32 iov_len;
    // 0x2C: When removing a reference, if it reaches 0, the entry is removed (unless
    // file_externally_allocated is true, as it is always removed even if there are remaining
    // references)
    s16 reference_counter;
    u8 field9_0x2e;
    u8 field10_0x2f;
    // 0x30: pointer to the beginning of the data section of iov_base.
    struct wan_header* sprite_start;
    void* iov_base; // 0x34: points to a sirO
};

struct wan_table {
    struct wan_table_entry sprites[96]; // 0x0
    void* at_decompress_scratch_space;  // 0x1500
    u8 field2_0x1504;
    u8 field3_0x1505;
    u8 field4_0x1506;
    u8 field5_0x1507;
    s16 total_nb_of_entries;  // 0x1508: The total number of entries. Should be equal to 0x60.
    s16 next_alloc_start_pos; // 0x150A
    s16 field8_0x150c;
    u8 field9_0x150e;
    u8 field10_0x150f;
};

#endif //PMDSKY_WAN_H
