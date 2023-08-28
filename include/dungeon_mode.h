#ifndef PMDSKY_DUNGEON_MODE_H
#define PMDSKY_DUNGEON_MODE_H

#include "graphics.h"

// Used in various contexts, like with entity positions in the dungeon
struct position {
    s16 x;
    s16 y;
};

// Used to indicate the pixel position of an entity. Values are shifted 8 bits to the left, so they
// are probably decimal numbers instead.
struct pixel_position {
    u32 x;
    u32 y;
};

// Entity type. This is used to tag generic entity pointers.
enum entity_type {
    ENTITY_NOTHING = 0,
    ENTITY_MONSTER = 1,
    ENTITY_TRAP = 2,
    ENTITY_ITEM = 3,
    ENTITY_HIDDEN_STAIRS = 5,
    // Used when a temporary instance of this struct is created to pass it to some
    // function that requires it as a parameter
    ENTITY_TEMPORARY = 6,
};

// Generic entity data
struct entity {
    enum entity_type type;                  // 0x0
    struct position pos;                    // 0x4
    struct position prev_pos;               // 0x8
    struct pixel_position pixel_pos;        // 0xC
    struct pixel_position pixel_pos_mirror; // 0x14: Monsters only?
    // 0x1C: Graphical parameter for evelation above the ground. Last byte behaves weirdly.
    s32 elevation;
    u8 is_visible; // 0x20: For traps/hidden stairs
    u8 field_0x21;
    // 0x22: If true, the sprite will be shown with a certain degree of transparency
    u8 transparent;
    // 0x23: Seems to be the animation frame counter for the 10-frame "shuffle" animation that
    // plays at the end of a walk sequence
    u8 end_walk_anim_frame;
    u8 field_0x24;
    u8 room_idx; // 0x25: Index of the room a monster is in. 0xFF for hall
    // 0x26: Unique index for each monster that spawns. Starts at 0xA for the leader, and each
    // subsequent monster to spawn is assigned the next number (0xB, 0xC, ...)
    u16 spawn_genid;
    u8 field_0x28;
    u8 field_0x29;
    u8 field_0x2a;
    u8 field_0x2b;
    struct animation_control anim_ctrl;
    u16 sprite_index; // 0xA8
    u8 field_0xaa;
    u8 field_0xab;
    u8 field_0xac;
    u8 field_0xad;
    u8 animation_group_id;        // 0xAE
    u8 animation_group_id_mirror; // 0xAF
    u8 animation_id;              // 0xB0
    u8 animation_id_mirror0;      // 0xB1
    u8 field_0xb2;
    u8 field_0xb3;
    void* info; // 0xB4: Points to info struct for monster/item/trap
};

#endif //PMDSKY_DUNGEON_MODE_H