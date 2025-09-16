#ifndef PMDSKY_MOVE_DATA_H
#define PMDSKY_MOVE_DATA_H

#include "util.h"

// Move target (i.e., who does a move affect when used?)
// In the move data, this is the lower 4 bits of the joint Range + Target bitfield
enum move_target
{
    TARGET_ENEMIES = 0,
    TARGET_PARTY = 1, // including the user
    TARGET_ALL = 2,   // including the user
    TARGET_USER = 3,
    TARGET_ENEMIES_AFTER_CHARGING = 4, // in some sense the user while charging, then enemies
    TARGET_ALL_EXCEPT_USER = 5,
    TARGET_TEAMMATES = 6, // excluding the user
    TARGET_SPECIAL = 15,  // for weird moves
};

// Move range.
// In the move data, this is the upper 4 bits of the joint Range + Target bitfield
enum move_range
{
    RANGE_FRONT = 0,              // 1 tile in front
    RANGE_FRONT_AND_SIDES = 0x10, // also cuts corners
    RANGE_NEARBY = 0x20,          // the 8 surrounding tiles
    RANGE_ROOM = 0x30,            // the whole room
    RANGE_FRONT_2 = 0x40,  // 2 tiles in front, also cuts corners but the AI doesn't account for that
    RANGE_FRONT_10 = 0x50, // 10 tiles in front
    RANGE_FLOOR = 0x60,    // the whole floor
    // Depends on the move:
    // - if the target is the user, then the range is also just the user
    // - if the target is enemies after charging, the range is front or front with corner cutting,
    //   depending on the move
    RANGE_USER = 0x70,
    RANGE_FRONT_WITH_CORNER_CUTTING = 0x80, // same as RANGE_FRONT but cuts corners
    // same as RANGE_FRONT_2 but the AI accounts for corner-cutting
    RANGE_FRONT_2_WITH_CORNER_CUTTING = 0x90,
    RANGE_SPECIAL = 15, // for weird moves
};

// Conditions checked by the AI to determine when a move should be used
// It does not affect how the move works
enum move_ai_condition
{
    AI_CONDITION_NONE = 0,
    // The AI will consider a target elegible wirh a chance equal to the
    // move's "ai_condition_random_chance" value
    AI_CONDITION_RANDOM = 0x100,
    AI_CONDITION_HP_25 = 0x200,           // Target has HP <= 25%
    AI_CONDITION_STATUS = 0x300,          // Target has a negative status condition
    AI_CONDITION_ASLEEP = 0x400,          // Target is asleep, napping or in a nightmare
    AI_CONDITION_HP_25_OR_STATUS = 0x500, // Target has HP <= 25% or a negative status condition
    AI_CONDITION_GHOST = 0x600,           // Target is ghost-type and not exposed
};

enum accuracy_type
{
    // Accuracy used for all moves.
    ACCURACY_1,
    // Multiplied with the global accuracy for offensive moves (i.e., not status moves).
    ACCURACY_2,
    // Used by the AI to determine how often to use Spikes.
    // Values exist for all other moves, though they seem to be unused.
    ACCURACY_AI_CONDITION_RANDOM_CHANCE,
    NUM_ACCURACY_TYPES
};

#define MOVE_RANGE_STRING_USER 19

// Data for a single move
struct move_data
{
    u16 base_power;      // 0x0
    enum type_id type;   // 0x2
    u8 category;         // 0x3
    u16 target_range[2]; // 0x4
    u8 pp;               // 0x8
    u8 ai_weight; // 0x9: Possibly. Weight for AI's random move selection
    // There are multiple accuracy values. These are define with the accuracy_type enum.
    /* 0xE */ u8 accuracy[NUM_ACCURACY_TYPES];
    u8 strikes;                    // 0xD: Number of times the move hits (i.e. for multi-hit moves)
    u8 max_ginseng_boost;          // 0xE: Maximum possible Ginseng boost for this move
    u8 crit_chance;                // 0xF: The base critical hit chance
    bool8 reflected_by_magic_coat; // 0x10
    bool8 can_be_snatched;         // 0x11
    bool8 fails_while_muzzled;     // 0x12
    // 0x13: Seems to be used by the AI with Status Checker for using moves against frozen monsters
    bool8 ai_can_use_against_frozen;
    bool8 usable_while_taunted; // 0x14
    // 0x15: Index in the string files of the range string to be displayed in the move info screen
    u8 range_string_idx;
    u16 id; // 0x16
    // 0x18: Index in the string files of the message string to be displayed in the dungeon message
    // log when a move is used. E.g., the default (0) is "[User] used [move]!"
    u16 message_string_idx;
};

// The move data table, as contained within /BALANCE/waza_p.bin, and when loaded into memory.
struct move_data_table
{
    struct move_data moves[559]; // 0x8
};

struct move_data_table_outer
{
    u8 fill0[8];
    struct move_data_table *moves;
};

#endif //PMDSKY_MOVE_DATA_H
