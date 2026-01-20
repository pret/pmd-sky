#ifndef PMDSKY_MONSTER_DATA_TABLE_PTR_H
#define PMDSKY_MONSTER_DATA_TABLE_PTR_H

#include "enums.h"

extern struct monster_data_table *MONSTER_DATA_TABLE_PTR;

struct monster_data_table_entry {
    u16 entity_id;                    // 0x0: A entity-unique ID to identify the entity in both of its 2 entries. Seems to match pokedex number.
    u16 unk_0x2;                      // 0x2: Unknown. Pokemon with the same category string have the same value in here.
    s16 pokedex_number;               // 0x4: The national Pokedex number, as displayed in Chimecho Assembly.
    s16 base_movement_speed;          // 0x6: The base movement speed in dungeons.
    s16 pre_evolution_idx;            // 0x8: The pre-evolution of the monster.
    u16 evolution_method;             // 0xA: The evolution method required to evolve to this Pokemon from the pre-evo specified in PreEvoIndex. Null if unused.
    u16 evolution_param_1;            // 0xC: The first parameter for the evolution method. Null if unused.
    u16 evolution_param_2;            // 0xE: The second parameter for the evolution method. Null if unused.
    u16 sprite_index;                 // 0x10: The index of the entity's sprite. It's the index inside the three Pokemon sprite files inside the "/MONSTER/" directory!
    u8 gender;                        // 0x12: Gender of this particular entity entry.
    u8 body_size;                     // 0x13: The body size of the Pokemon. Used when determining how many Pokemon fits in the party.
    enum type_id types[2];            // 0x14: The Pokemon's types.
    enum mobility_type movement_type; // 0x16: This decides what terrains the entity can move over, and whether its hovering or not.
    u8 iq_group;                      // 0x17: The IQ group the Pokemon belongs to.
    enum ability_id abilities[2];     // 0x18: The Pokemon's abilities.
    u8 flags;                         // 0x1A: Stores bitflags. Bits 0-3: Unknown. Bit 4: If false, the Pokemon can't move inside of dungeons. Bit 5: If false, the Pokemon can't throw items. Bit 6: If false, the Pokemon can't evolve at Luminous Spring, even if it has an evolution. Bit 7: If true, the Pokemon requires a special item to spawn.
    u8 unk_0x1b;                      // 0x1B: Unknown. Possibly more flags?
    u16 exp_yield;                    // 0x1C: The Exp yield.
    s16 recruit_rate_1;               // 0x1E: Another recruit rate, this one is usually closer to 0 when RecruitRate1 and RecruitRate2 are different!
    u16 base_hp;                      // 0x20: The HP the Pokemon has at lvl 1.
    s16 recruit_rate_2;               // 0x22: Recruit rate.
    u8 base_atk[2];                   // 0x24: The attack stat of the Pokemon at lvl 1, followed by the special attack stat of the Pokemon at lvl 1.
    u8 base_def[2];                   // 0x26: The defense stat of the Pokemon at lvl 1, followed by the special defense stat of the Pokemon at lvl 1.
    u16 weight;                       // 0x28: The weight tier for weight based damages.
    u16 size;                         // 0x2A: The size tier for size based damages.
    s8 unk_0x2c;                      // 0x2C: Unknown. Most of the time 0xA.
    s8 unk_0x2d;                      // 0x2D: Unknown. Most of the time 0xA.
    u8 shadow_size;                   // 0x2E: The size of the Pokemon's shadow.
    u8 spawn_asleep_chance;           // 0x2F: The percent chance that a Pokemon will spawn asleep. Most of the time 0x8.
    u8 hp_regeneration;               // 0x30: The rate at which a Pokemon regenerates HP. Always 0x64.
    s8 spawn_threshold;               // 0x31: 
    s16 base_form_idx;                // 0x32: The base evolutionary stage of the Pokemon. Seems to always be between 0 and 600.
    s16 exclusive_item_1;             // 0x34: The first 1-star exclusive item for this Pokemon. Null if NA.
    s16 exclusive_item_2;             // 0x36: The second 1-star exclusive item for this Pokemon. Null if NA.
    s16 exclusive_item_3;             // 0x38: The 2-star exclusive item for this Pokemon. Null if NA.
    s16 exclusive_item_4;             // 0x3A: The 3-star exclusive item for this Pokemon. Null if NA.
    s16 unk_0x3c;                     // 0x3C: Unknown.
    s16 unk_0x3e;                     // 0x3E: Unknown. Often 0xF.
    s16 unk_0x40;                     // 0x40: Unknown.
    s16 unk_0x42;                     // 0x42: Unknown.
};

// The monster.md file without the header. This is what MONSTER_DATA_TABLE_PTR points to, though the
// full monster_file_contents struct is loaded in RAM.
struct monster_data_table {
    struct monster_data_table_entry entries[MONSTER_RESERVE_45 + 1];
};

// Format of the monster.md file.
struct monster_file_contents {
    char magic_number[4];            // 0x0: The string "MD\0\0".
    u32 nb_entries;                  // 0x4: The number of entries in the body of the table.
    struct monster_data_table table; // 0x8: The main contents of the data table.
};

#endif //PMDSKY_MONSTER_DATA_TABLE_PTR_H
