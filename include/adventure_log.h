#ifndef PMDSKY_ADVENTURE_LOG_H
#define PMDSKY_ADVENTURE_LOG_H

#include "dungeon.h"

// The adventure log structure.
struct adventure_log {
    u32 completion_flags[4];            // 0x0
    u32 nb_dungeons_cleared;            // 0x10
    u32 nb_friend_rescues;              // 0x14
    u32 nb_evolutions;                  // 0x18
    u32 nb_eggs_hatched;                // 0x1C
    u32 successful_steals;              // 0x20: Unused in Sky
    u32 nb_faints;                      // 0x24
    u32 nb_victories_on_one_floor;      // 0x28
    u32 pokemon_joined_counter;         // 0x2C
    u32 pokemon_battled_counter;        // 0x30
    u32 moves_learned_counter;          // 0x34
    u32 nb_big_treasure_wins;           // 0x38
    u32 nb_recycled;                    // 0x3C
    u32 nb_gifts_sent;                  // 0x40
    u32 pokemon_joined_flags[37];       // 0x44
    u32 pokemon_battled_flags[37];      // 0xD8
    u32 moves_learned_flags[17];        // 0x16C
    u32 items_acquired_flags[44];       // 0x1B0
    u32 special_challenge_flags;        // 0x260
    u32 sentry_duty_game_points[5];     // 0x264
    struct dungeon_floor_pair current_floor; // 0x278
    u16 padding;                        // 0x27A
};

#endif //PMDSKY_ADVENTURE_LOG_H
