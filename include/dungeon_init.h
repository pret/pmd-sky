#ifndef PMDSKY_DUNGEON_INIT
#define PMDSKY_DUNGEON_INIT

#include "common.h"
#include "util.h"

// Unknown struct included in the dungeon_init struct
struct unk_dungeon_init {
    u8 unk0[232];
};

// A struct used to init certain values in the dungeon struct when entering dungeon mode.
// Gets initialized in ground mode.
struct dungeon_init {
    u8 id; // 0x0: Copied into dungeon::id
    u8 floor;          // 0x1: Copied into dungeon::floor
    // Copied into dungeon::field_0x74C, might be related to the dungeon being conquered or
    // the fixed room overrides.
    u16 dungeon_idx; // 0x2 index of the dungeon. The index maps to the id in DUNGEON_SWAP_ID_TABLE
    u8 field_0x4;
    bool8 nonstory_flag;      // 0x5: Copied into dungeon::nonstory_flag
    bool8 recruiting_enabled; // 0x6: Copied into dungeon::recruiting_enabled
    // 0x7: If true, dungeon::recruiting_enabled gets set to false. Overrides recruiting_enabled.
    bool8 force_disable_recruiting;
    // 0x8 Pokemon show up in potential recruits, (inferred by assignment from performance progress flag 6)
    // Copied into dungeon::field_0x75A
    bool8 show_potential_recruits;
    // 0x9: Whether team name is shown, (inferred by assignment from performance progress flag 1)
    // Copied into dungeon::field_0x75B, but the value is immediately overwritten with TRUE.
    bool8 show_team_name;
    bool8 send_home_disabled;        // 0xA: Copied into dungeon::send_home_disabled
    bool8 hidden_land_flag;          // 0xB: Copied into dungeon::hidden_land_flag
    bool8 skip_faint_animation_flag; // 0xC: Copied into dungeon::skip_faint_animation_flag
    // 0xD: Copied into dungeon::dungeon_objective. Read as a signed byte (?).
    /* struct dungeon_objective_8 */ u8 dungeon_objective;
    s8 field_0xE;
    bool8 has_guest_pokemon; // 0xF: If true, a guest pokémon will be added to your team
    bool8 send_help_item;    // 0x10: If true, you recive an item at the start of the dungeon
    bool8 show_rescues_left; // 0x11: If true, you get a message saying how many rescue chances you
                             // have left
    s8 field_0x12;
    u8 field_0x13;
    // 0x14
    // [EU]0x22DF920 loads this as a word
    // [EU]0x22DFBAC loads this as a signed byte
    // ???
    u32 field_0x14; // Copied into dungeon::field_0x750
    // 0x18: The dungeon PRNG preseed? Copied into dungeon::prng_preseed_23_bit and
    // dungeon::rescue_prng_preseed_23_bit.
    u32 prng_preseed_23_bit;
    // 0x1C: Array containing the list of quest pokémon that will join the team in the dungeon
    // (max 2)
    struct ground_monster guest_pokemon[2];
    // 0xA4: Used as a base address at [EU]0x22E0354 and [EU]0x22E03AC.
    // It's probably a separate struct.
    u8 field_0xA4;
    u8 field_0xA5;
    u8 field_0xA6;
    u8 field_0xA7;
    // 0xA8: ID of the item to give to the player if send_help_item is true
    /* struct item_id_16 */ u16 help_item;
    u8 field_0xAA;
    u8 field_0xAB;
    // 0xAC: Controls which version of the dungeon to load. Gets copied into
    // dungeon::dungeon_game_version_id. Uncertain when the game decides to load the
    // Time/Darkness version of dungeons.
    enum game_id dungeon_game_version_id;
    u32 field_0xB0;
    u8 field_0xB4; // Gets set to dungeon::id during dungeon init
    u8 field_0xB5; // Gets set to dungeon::floor during dungeon init
    u8 field_0xB6;
    u8 field_0xB7;
    // 0xB8: Used as a base address at [EU]0x22E0ABC.
    // It's probably a separate struct.
    u8 field_0xB8; // Gets set to dungeon::id during dungeon init
    u8 field_0xB9; // Gets set to dungeon::floor during dungeon init
    u8 field_0xBA;
    u8 field_0xBB;
    u32 field_0xBC;
    // 0xC0: Used as a base address at [EU]0x22E0A4C
    struct unk_dungeon_init field_0xC0;
    u8 field_0x1A8;
    // Probably padding, these bytes aren't accessed by the funtion that inits this struct
    u8 field_0x1A9;
    u8 field_0x1AA;
    u8 field_0x1AB;
};

void InitDungeonInit(struct dungeon_init* dg_init, s16 dungeon_idx);

#endif //PMDSKY_DUNGEON_INIT
