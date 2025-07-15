#ifndef PMDSKY_COMMON_H
#define PMDSKY_COMMON_H

#include "item.h"
#include "move.h"

struct ground_move {
    // 0x0: flags: 1-byte bitfield
    // See move::flags0 for details
    u8 f_exists : 1;
    u8 f_subsequent_in_link_chain : 1;
    u8 f_enabled_for_ai : 1;
    u8 f_set : 1;
    u8 f_last_used : 1; // unconfirmed, but probably the same as struct move
    u8 f_disabled : 1;
    u8 flags_unk6 : 2;

    u8 field_0x1;  // Probably padding since it doesn't get initialized
    u16 id; // 0x2
    u8 ginseng;      // 0x4: Ginseng boost
    u16 field_0x5;  // Probably padding since it doesn't get initialized
};

struct ground_monster {
    u8 is_valid;            // 0x0: True if the entry is valid
    s8 level;               // 0x1: Monster level
    u8 joined_at;           // 0x2
    u8 joined_at_floor;     // 0x3: See struct monster::joined_at_floor
    u16 id;                 // 0x4: Monster ID
    s8 level_at_first_evo;  // 0x6: Level upon first evolution, or 0 if not applicable
    s8 level_at_second_evo; // 0x7: Level upon second evolution, or 0 if not applicable
    u16 iq;                 // 0x8
    u16 max_hp;             // 0xA
    u8 offensive_stats[2];  // 0xC: {atk, sp_atk}
    u8 defensive_stats[2];  // 0xE: {def, sp_def}
    s32 exp;                // 0x10
    // 0x14: Bitvector that keeps track of which IQ skills the monster has enabled.
    // See enum iq_skill_id for the meaning of each bit.
    u32 iq_skill_flags[3];
    u8 tactic;     // 0x20
    u8 field_0x21;
    struct ground_move moves[4]; // 0x22
    char name[10];               // 0x3A: Display name of the monster
};

// Stores information about active team members, including those from special episodes.
// A lot of the fields seem to be analogous to fields on struct monster.
struct team_member {
    // 0x0: flags: 1-byte bitfield
    u8 f_is_valid : 1;
    u8 flags_unk1 : 7;

    u8 is_leader;                // 0x1
    u8 level;                 // 0x2
    u8 joined_at; // 0x3
    u8 joined_at_floor;       // 0x4
    u8 field_0x5;
    u16 iq;          // 0x6
    s16 member_index; // 0x8: Index in the list of all team members (not just the active ones)
    s16 team_index;   // 0xA: In order by team lineup
    u16 id;    // 0xC
    u16 current_hp;        // 0xE
    u16 max_hp;            // 0x10
    u8 offensive_stats[2]; // 0x12: {atk, sp_atk}
    u8 defensive_stats[2]; // 0x14: {def, sp_def}
    u8 field_0x16;
    u8 field_0x17;
    s32 exp;              // 0x18
    struct move moves[4]; // 0x1C
    u8 field_0x3C;
    u8 field_0x3D;
    struct item held_item;         // 0x3E
    s16 belly;                 // 0x44: Integer part
    s16 belly_thousandths;     // 0x46
    s16 max_belly;             // 0x48: Integer part
    s16 max_belly_thousandths; // 0x4A
    // 0x4C: Bitvector that keeps track of which IQ skills the monster has enabled.
    // See enum iq_skill_id for the meaning of each bit.
    u32 iq_skill_flags[3];
    u8 tactic; // 0x58
    u8 field_0x59;
    s16 hidden_power_base_power;    // 0x5A
    u8 hidden_power_type; // 0x5C
    u8 field_0x5D;               // Gets copied to monster->field_0x47.
    char name[10];                      // 0x5E: Display name of the monster
};

#endif
