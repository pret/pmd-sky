#ifndef PMDSKY_FIXED_ROOM_DATA_H
#define PMDSKY_FIXED_ROOM_DATA_H

#include "dungeon_mode.h"

// Entry in the fixed room properties table
struct fixed_room_properties_entry {
    // 0x0: If MUSIC_NONE_0x0, the music will be taken from the mappa file for the floor
    u16 music;
    u8 field_0x2;
    u8 field_0x3;
    bool8 illuminated;           // 0x4: Floor will be fully illuminated (darkness level 0)
    bool8 enable_lategame_traps; // 0x5: Allows Summon, Pitfall, and Pokémon traps to work
    // 0x6: Monsters can use moves on this floor. Does not affect the regular attack.
    // If false, NPCs won't use any moves at all (not even the regular attack)
    bool8 moves_enabled;
    bool8 orbs_allowed; // 0x7: Orbs can be used. Ignored for IDs past FIXED_SEALED_CHAMBER.
    // 0x8: Warping, being blown away, and leaping are allowed on this floor.
    // Ignored for IDs past FIXED_SEALED_CHAMBER.
    bool8 tile_jumps_allowed;
    // 0x9: Trawl Orbs work on this floor. Ignored for IDs past FIXED_SEALED_CHAMBER.
    bool8 trawl_orbs_allowed;
    // 0xA: This floor will be exited immediately after all enemies have been defeated.
    // If false, the fixed room must have stairs placed somewhere to be considered valid.
    bool8 exit_after_enemies_defeated;
    u8 field_0xb;
};

extern struct fixed_room_properties_entry FIXED_ROOM_PROPERTIES_TABLE[];

// Checks if moves (excluding the regular attack) are usable in the given fixed room.
bool8 AreMovesEnabled(enum fixed_room_id fixed_room_id);

#endif //PMDSKY_FIXED_ROOM_DATA_H
