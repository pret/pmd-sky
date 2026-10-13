#ifndef PMDSKY_DUNGEON_INIT
#define PMDSKY_DUNGEON_INIT

#include "common.h"
#include "dungeon_location_seed.h"
#include "util.h"
#include "item.h"

// Unknown struct used during dungeon initialisation
struct unk {
    u8 padding[4];
    u8 unk4;
};

// Unknown struct included in the dungeon_init struct
struct unk_dungeon_init {
    u8 unk0[232];
};

// A struct used to init certain values in the dungeon struct when entering dungeon mode.
// Gets initialized in ground mode.
struct dungeon_init {
    u8 id; // 0x0: Copied into dungeon::id
    u8 floor;          // 0x1: Copied into dungeon::floor
    // Copied into dungeon::dungeon_idx, might be related to the dungeon being conquered or
    // the fixed room overrides.
    s16 dungeon_idx; // 0x2 index of the dungeon. The index maps to the id in DUNGEON_SWAP_ID_TABLE
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
    // 0xD: Copied into dungeon::dungeon_objective.
    s8 dungeon_objective;
    s8 field_0xE;
    bool8 has_guest_pokemon; // 0xF: If true, a guest pokémon will be added to your team
    bool8 send_help_item;    // 0x10: If true, you recive an item at the start of the dungeon
    bool8 show_rescues_left; // 0x11: If true, you get a message saying how many rescue chances you
                             // have left
    s8 field_0x12;
    u8 field_0x13;
    // 0x14: Copied as an eight-byte block into dungeon::rescue_location_seed.
    // For rescues, the seed at 0x18 also initializes the active dungeon::rescue_prng_preseed_23_bit.
    dungeon_location_seed rescue_location_seed;
    // 0x1C: Array containing the list of quest pokémon that will join the team in the dungeon
    // (max 2)
    struct ground_monster guest_pokemon[2];
    // 0xA4: Item information for the help item, copied into the entity info of the item entity
    struct item help_item;
    u8 field_0xAA;
    u8 field_0xAB;
    // 0xAC: Controls which version of the dungeon to load. Gets copied into
    // dungeon::dungeon_game_version_id. Uncertain when the game decides to load the
    // Time/Darkness version of dungeons.
    enum game_id dungeon_game_version_id;
    s32 field_0xB0;
    u8 field_0xB4; // Gets set to dungeon::id during dungeon init
    u8 field_0xB5; // Gets set to dungeon::floor during dungeon init
    u8 field_0xB6;
    u8 field_0xB7;
    // 0xB8: Output location and seed populated by RunDungeon on failure when
    // field_0xB0 is set to -2. Contains the current dungeon ID, floor, and
    // rescue PRNG preseed (at 0xBC); the two remaining bytes are cleared.
    dungeon_location_seed result_location_seed;
    // 0xC0: Used as a base address at [EU]0x22E0A4C
    struct unk_dungeon_init field_0xC0;
    u8 field_0x1A8;
    // Probably padding, these bytes aren't accessed by the funtion that inits this struct
    u8 field_0x1A9;
    u8 field_0x1AA;
    u8 field_0x1AB;
};

void sub_0204E974(s8 arg0);
void InitDungeonInit(struct dungeon_init* dg_init, s16 dungeon_idx);
s32 IsNoLossPenaltyDungeon(s16 dungeon_id);
void sub_0204F024(s32 value);
s8 sub_0204F034(void);

#endif //PMDSKY_DUNGEON_INIT
