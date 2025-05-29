#ifndef PMDSKY_DUNGEON_H
#define PMDSKY_DUNGEON_H

#include "dungeon_mode.h"
#include "enums.h"
#include "item.h"

#define MAX_TEAM_MEMBERS 4
#define DUNGEON_MAX_POKEMON 20
#define DUNGEON_MAX_SIZE_X 56
#define DUNGEON_MAX_SIZE_Y 32

enum TerrainType
{
    // These 3 seem to indicate the 'main' type of the terrain. See helper functions for how they're set.
    TERRAIN_TYPE_WALL = 0, // x0 When neither TERRAIN_TYPE_NORMAL nor TERRAIN_TYPE_SECONDARY are set
    TERRAIN_TYPE_NORMAL = 1 << 0, // x1
    TERRAIN_TYPE_SECONDARY = 1 << 1, // Water or lava depending on the dungeon. x2
    TERRAIN_TYPE_IMPASSABLE_WALL = 1 << 4, // x10
};

// Dungeon state
struct dungeon {
    u8 field_0x0; // 0x0: Initialized to 0x0.
    // 0x1: Set to true with mission_destination_info::target_enemy_is_defeated. Used to ensure
    // the mission complete message only shows once (ie: "Yes! Knocked out challenger
    // [string:1]!". Set to false after the message is shown.
    bool8 target_enemy_defeated_message;
    // 0x2: Set to true when the hidden outlaw mission item is dropped. Appears to be used to check
    // if the message "Huh?[K] [item:] was dropped![P]Yes![K][string:1] was the outlaw!" should
    // be shown when target_enemy_defeated_message is true.
    bool8 hidden_outlaw_defeated_message;
    // 0x3: If true and there's an active mission on the floor, the message
    // "You've reached a destination floor! But where is the target pokémon..." will be displayed.
    bool8 target_monster_not_found_flag;
    u8 field_0x4;
    bool8 stepped_on_stairs; // 0x5: True if the leader just stepped on the stairs.
    // 0x6: If equal to 1 or 2, the floor will be advanced at the end of the turn,
    // unless the leader fainted. 2 is used for the leader falling through a pitfall
    // trap.
    u8 end_floor_flag;
    // 0x7: If set in tandem with either end_floor_flag or end_floor_no_death_check_flag,
    // a quicksave will occur instead of a floor advance.
    bool8 quicksave_flag;
    // 0x8: The floor will be advanced at the end of the turn. Set when quicksaving.
    bool8 end_floor_no_death_check_flag;
    // 0x9: If this is 0x0 (maybe false), appears to not initialize certain parts of the dungeon.
    // Possibly a boolean for when loading from a quicksave or resuming after being rescued?
    u8 field_0x9;
    u8 field_0xa;
    u8 field_0xb;
    u8 field_0xc; // 0xC: Initialized to 0x0
    u8 field_0xd; // 0xD: Initialized to 0x0
    // 0xE: If true, artificial weather abilities will be activated on this turn.
    // Set to false by TryActivateArtificialWeatherAbilities
    bool8 activate_artificial_weather_flag;
    // 0xF: True if an enemy has defeated an ally on this turn and should evolve as a result
    // May also have a niche usage if an enemy gets enough experience to level up through
    // something like the Joy Ribbon?
    bool8 should_enemy_evolve;
    u8 field_0x10; // 0x10: Initialized to 0x0.
    // 0x11: True if the leader isn't doing anything right now. False if it's currently performing
    // an action (such as walking or attacking)
    bool8 no_action_in_progress;
    bool8 iq_disabled;                 // 0x12: IQ skills won't work in the dungeon.
    bool8 regular_attack_reveal_traps; // 0x13: Regular attacks will reveal traps.
    // 0x14: If > 0, you get kicked out of the dungeon, usually because an important team member
    // (such as your client) fainted.
    enum forced_loss_reason forced_loss_reason;
    // 0x18: Appears to be set to 1 when using the escape orb and set to 2 when completing
    // a mission. dungeon::end_floor_no_death_check_flag gets set whenever this is changed.
    u32 successful_exit_tracker;
    // 0x1C: Increased once per frame until 0x64. Resets to 0 when the leader acts.
    u8 field_0x1c;
    u8 field_0x1d;
    // 0x1E: Number of floors completed? (Guess). Initialized to 0.
    // If this is a floor tracker, odd it is not a u16 like the others.
    u8 number_completed_floors;
    // 0x1F: Turn counter, Speed Boost triggers every 250 turns, then the counter is reset.
    u8 speed_boost_counter;
    // 0x20: Total amount of floors summed by all the previous dungeons in its group
    u16 number_preceding_floors;
    // 0x22: Total amount of floors passed including those in its group? (Guess)
    // Set to dungeon::number_preceding_floors + dungeon::number_completed_floors
    u16 total_floors_completed;
    u8 field_0x24;
    u8 field_0x25;
    u8 field_0x26;
    u8 field_0x27;
    u8 field_0x28;
    u8 field_0x29;
    u8 field_0x2a;
    u8 field_0x2b;
    u8 field_0x2c;
    u8 field_0x2d;
    u8 field_0x2e;
    u8 field_0x2f;
    u8 field_0x30;
    u8 field_0x31;
    u8 field_0x32;
    u8 field_0x33;
    u8 field_0x34;
    u8 field_0x35;
    u8 field_0x36;
    u8 field_0x37;
    u8 field_0x38;
    u8 field_0x39;
    u8 field_0x3a;
    u8 field_0x3b;
    u8 field_0x3c;
    u8 field_0x3d;
    u8 field_0x3e;
    u8 field_0x3f;
    u8 field_0x40;
    u8 field_0x41;
    u8 field_0x42;
    u8 field_0x43;
    u8 field_0x44;
    u8 field_0x45;
    u8 field_0x46;
    u8 field_0x47;
    u8 field_0x48;
    u8 field_0x49;
    u8 field_0x4a;
    u8 field_0x4b;
    u8 field_0x4c;
    u8 field_0x4d;
    u8 field_0x4e;
    u8 field_0x4f;
    u8 field_0x50;
    u8 field_0x51;
    u8 field_0x52;
    u8 field_0x53;
    u8 field_0x54;
    u8 field_0x55;
    u8 field_0x56;
    u8 field_0x57;
    u8 field_0x58;
    u8 field_0x59;
    u8 field_0x5a;
    u8 field_0x5b;
    u8 field_0x5c;
    u8 field_0x5d;
    u8 field_0x5e;
    u8 field_0x5f;
    u8 field_0x60;
    u8 field_0x61;
    u8 field_0x62;
    u8 field_0x63;
    u8 field_0x64;
    u8 field_0x65;
    u8 field_0x66;
    u8 field_0x67;
    u8 field_0x68;
    u8 field_0x69;
    u8 field_0x6a;
    u8 field_0x6b;
    u8 field_0x6c;
    u8 field_0x6d;
    u8 field_0x6e;
    u8 field_0x6f;
    u8 field_0x70;
    u8 field_0x71;
    u8 field_0x72;
    u8 field_0x73;
    u8 field_0x74;
    u8 field_0x75;
    u8 field_0x76;
    u8 field_0x77;
    u8 field_0x78;
    u8 field_0x79;
    u8 field_0x7a;
    u8 field_0x7b;
    u8 field_0x7c;
    u8 field_0x7d;
    u8 field_0x7e;
    u8 field_0x7f;
    u8 field_0x80;
    u8 field_0x81;
    u8 field_0x82;
    u8 field_0x83;
    u8 field_0x84;
    u8 field_0x85;
    u8 field_0x86;
    u8 field_0x87;
    u8 field_0x88;
    u8 field_0x89;
    u8 field_0x8a;
    u8 field_0x8b;
    u8 field_0x8c;
    u8 field_0x8d;
    u8 field_0x8e;
    u8 field_0x8f;
    u8 field_0x90;
    u8 field_0x91;
    u8 field_0x92;
    u8 field_0x93;
    u8 field_0x94;
    u8 field_0x95;
    u8 field_0x96;
    u8 field_0x97;
    u8 field_0x98;
    u8 field_0x99;
    u8 field_0x9a;
    u8 field_0x9b;
    u8 field_0x9c;
    u8 field_0x9d;
    u8 field_0x9e;
    u8 field_0x9f;
    u8 field_0xa0;
    u8 field_0xa1;
    u8 field_0xa2;
    u8 field_0xa3;
    u8 field_0xa4;
    u8 field_0xa5;
    u8 field_0xa6;
    u8 field_0xa7;
    u8 field_0xa8;
    u8 field_0xa9;
    u8 field_0xaa;
    u8 field_0xab;
    u8 field_0xac;
    u8 field_0xad;
    u8 field_0xae;
    u8 field_0xaf;
    u8 field_0xb0;
    u8 field_0xb1;
    u8 field_0xb2;
    u8 field_0xb3;
    u8 field_0xb4;
    u8 field_0xb5;
    u8 field_0xb6;
    u8 field_0xb7;
    u8 field_0xb8;
    u8 field_0xb9;
    u8 field_0xba;
    u8 field_0xbb;
    u8 field_0xbc;
    u8 field_0xbd;
    u8 field_0xbe;
    u8 field_0xbf;
    u8 field_0xc0;
    u8 field_0xc1;
    u8 field_0xc2;
    u8 field_0xc3;
    // 0xC4: Pointer to the entity that is taking its turn right now
    struct entity* current_active_entity;
    // 0xC8: Pointer to the monster that will become the leader of the team after changing leaders
    struct entity* new_leader;
    // 0xCC: Entity struct of the item that was just thrown or dropped
    struct entity thrown_item;
    // 0x184: Info about the most recent damage calculation. Reset with each call to CalcDamage
    struct damage_calc_diag last_damage_calc;
    // 0x1D8: Somehow related to executing a monster's actions (including leader).
    // Initialized to 0xFFFF
    u16 field_0x1d8;
    // 0x1DA: Somehow related to executing the leader's actions. Also maybe when leader opens
    // some menus? Initialized to 0xFFFF
    u16 field_0x1da;
    u16 field_0x1dc; // 0x1DC: Initialized to 0xFFFF
    u16 field_0x1de; // 0x1DE: Initialized to 0xFFFF
    // 0x1E0: Color table. Used to apply a tint to the colors shown on screen.
    // Changes depending on the current weather.
    struct rgba color_table[256];
    // 0x5E0: Data for Kecleon shopkeeper spawns. It's weird that there's room for more than one;
    // it seems like only the first entry should ever be filled
    struct spawned_shopkeeper_data shopkeeper_spawns[8];
    // 0x610: Number of valid shopkeeper spawns
    int shopkeeper_spawn_count;
    u32 field_0x614;
    // 0x618: Something related to animiations?  Could be ID?
    u32 unk1_animation1_value;
    u32 unk2_animation1_value;
    u32 unk3_animation1_value;
    struct entity* animation1_entity; // 0x624: Monster pointer for the animation?
    // 0x628: Something related to animiations?  Could be ID?
    u32 unk1_animation2_value;
    u32 unk2_animation2_value;
    u32 unk3_animation2_value;
    struct entity* animation2_entity; // 0x634: Monster pointer for the animation?
    // 0x638: Something related to animiations? Could be ID?
    u32 unk1_animation3_value;
    u32 unk2_animation3_value;
    u32 unk3_animation3_value;
    struct entity* animation3_entity; // 0x644: Monster pointer for the animation?
    // 0x648: Some type of monster name related to fainting. Used for the partner, escort or
    // accompanying monster, but may be be changed when any monster faints (but might not be
    // used for them).
    char unk_fainted_monster_name[10];
    u8 field_0x652;
    u8 field_0x653;
    u8 field_0x654;
    u8 field_0x655;
    u8 field_0x656;
    u8 field_0x657;
    u8 field_0x658;
    u8 field_0x659;
    u8 field_0x65a;
    u8 field_0x65b;
    u8 field_0x65c;
    u8 field_0x65d;
    u8 field_0x65e;
    u8 field_0x65f;
    u8 field_0x660;
    u8 field_0x661;
    u8 field_0x662;
    u8 field_0x663;
    u8 field_0x664;
    u8 field_0x665;
    u8 field_0x666;
    u8 field_0x667;
    u8 field_0x668;
    u8 field_0x669;
    u8 field_0x66a;
    u8 field_0x66b;
    u8 field_0x66c;
    u8 field_0x66d;
    u8 field_0x66e;
    u8 field_0x66f;
    u8 field_0x670;
    u8 field_0x671;
    u8 field_0x672;
    u8 field_0x673;
    u8 field_0x674;
    u8 field_0x675;
    u8 field_0x676;
    u8 field_0x677;
    u8 field_0x678;
    u8 field_0x679;
    u8 field_0x67a;
    u8 field_0x67b;
    u8 field_0x67c;
    u8 field_0x67d;
    u8 field_0x67e;
    u8 field_0x67f;
    u8 field_0x680;
    u8 field_0x681;
    u8 field_0x682;
    u8 field_0x683;
    u8 field_0x684;
    u8 field_0x685;
    u8 field_0x686;
    u8 field_0x687;
    u8 field_0x688;
    u8 field_0x689;
    u8 field_0x68a;
    u8 field_0x68b;
    u8 field_0x68c;
    u8 field_0x68d;
    u8 field_0x68e;
    u8 field_0x68f;
    u8 field_0x690;
    u8 field_0x691;
    u8 field_0x692;
    u8 field_0x693;
    u8 field_0x694;
    u8 field_0x695;
    u8 field_0x696;
    u8 field_0x697;
    u8 field_0x698;
    u8 field_0x699;
    u8 field_0x69a;
    u8 field_0x69b;
    u8 field_0x69c;
    u8 field_0x69d;
    u8 field_0x69e;
    u8 field_0x69f;
    u8 field_0x6a0;
    u8 field_0x6a1;
    u8 field_0x6a2;
    u8 field_0x6a3;
    u8 field_0x6a4;
    u8 field_0x6a5;
    u8 field_0x6a6;
    u8 field_0x6a7;
    u8 field_0x6a8;
    u8 field_0x6a9;
    u8 field_0x6aa;
    u8 field_0x6ab;
    u8 field_0x6ac;
    u8 field_0x6ad;
    u8 field_0x6ae;
    u8 field_0x6af;
    u8 field_0x6b0;
    u8 field_0x6b1;
    u8 field_0x6b2;
    u8 field_0x6b3;
    u8 field_0x6b4;
    u8 field_0x6b5;
    u8 field_0x6b6;
    u8 field_0x6b7;
    u8 field_0x6b8;
    u8 field_0x6b9;
    u8 field_0x6ba;
    u8 field_0x6bb;
    u8 field_0x6bc;
    u8 field_0x6bd;
    u8 field_0x6be;
    u8 field_0x6bf;
    u8 field_0x6c0;
    u8 field_0x6c1;
    u8 field_0x6c2;
    u8 field_0x6c3;
    u8 field_0x6c4;
    u8 field_0x6c5;
    u8 field_0x6c6;
    u8 field_0x6c7;
    u8 field_0x6c8;
    u8 field_0x6c9;
    u8 field_0x6ca;
    u8 field_0x6cb;
    u8 field_0x6cc;
    u8 field_0x6cd;
    u8 field_0x6ce;
    u8 field_0x6cf;
    u8 field_0x6d0;
    u8 field_0x6d1;
    u8 field_0x6d2;
    u8 field_0x6d3;
    u8 field_0x6d4;
    u8 field_0x6d5;
    u8 field_0x6d6;
    u8 field_0x6d7;
    u8 field_0x6d8;
    u8 field_0x6d9;
    u8 field_0x6da;
    u8 field_0x6db;
    u8 field_0x6dc;
    u8 field_0x6dd;
    u8 field_0x6de;
    u8 field_0x6df;
    u8 field_0x6e0;
    u8 field_0x6e1;
    u8 field_0x6e2;
    u8 field_0x6e3;
    u8 field_0x6e4;
    u8 field_0x6e5;
    u8 field_0x6e6;
    u8 field_0x6e7;
    u8 field_0x6e8;
    u8 field_0x6e9;
    u8 field_0x6ea;
    u8 field_0x6eb;
    u8 field_0x6ec;
    u8 field_0x6ed;
    u8 field_0x6ee;
    u8 field_0x6ef;
    u8 field_0x6f0;
    u8 field_0x6f1;
    u8 field_0x6f2;
    u8 field_0x6f3;
    u8 field_0x6f4;
    u8 field_0x6f5;
    u8 field_0x6f6;
    u8 field_0x6f7;
    u8 field_0x6f8;
    u8 field_0x6f9;
    u8 field_0x6fa;
    u8 field_0x6fb;
    u8 field_0x6fc;
    u8 field_0x6fd;
    u8 field_0x6fe;
    u8 field_0x6ff;
    u8 field_0x700;
    u8 field_0x701;
    u8 field_0x702;
    u8 field_0x703;
    u8 field_0x704;
    u8 field_0x705;
    u8 field_0x706;
    u8 field_0x707;
    u8 field_0x708;
    u8 field_0x709;
    u8 field_0x70a;
    u8 field_0x70b;
    u8 field_0x70c;
    u8 field_0x70d;
    u8 field_0x70e;
    u8 field_0x70f;
    u8 field_0x710;
    u8 field_0x711;
    u8 field_0x712;
    u8 field_0x713;
    u8 field_0x714;
    u8 field_0x715;
    u8 field_0x716;
    u8 field_0x717;
    u8 field_0x718;
    u8 field_0x719;
    u8 field_0x71a;
    u8 field_0x71b;
    u8 field_0x71c;
    u8 field_0x71d;
    u8 field_0x71e;
    u8 field_0x71f;
    u8 field_0x720;
    u8 field_0x721;
    u8 field_0x722;
    u8 field_0x723;
    u8 field_0x724;
    u8 field_0x725;
    u8 field_0x726;
    u8 field_0x727;
    u8 field_0x728;
    u8 field_0x729;
    u8 field_0x72a;
    u8 field_0x72b;
    u8 field_0x72c;
    u8 field_0x72d;
    u8 field_0x72e;
    u8 field_0x72f;
    u8 field_0x730;
    u8 field_0x731;
    u8 field_0x732;
    u8 field_0x733;
    u8 field_0x734;
    u8 field_0x735;
    u8 field_0x736;
    u8 field_0x737;
    u8 field_0x738;
    u8 field_0x739;
    u8 field_0x73a;
    u8 field_0x73b;
    u8 field_0x73c;
    u8 field_0x73d;
    u8 field_0x73e;
    u8 field_0x73f;
    u8 field_0x740;
    u8 field_0x741;
    u8 field_0x742;
    u8 field_0x743;
    u8 field_0x744;
    u8 field_0x745;
    u8 field_0x746;
    u8 field_0x747;
    // 0x748: Current dungeon ID. Is actually a dungeon_floor_pair struct that also contains
    // the floor number.
    enum dungeon_id id;
    u8 floor;                      // 0x749: Current floor number
    enum dungeon_group_id group_id; // 0x74A: Same for different segments of a dungeon
    u8 field_0x74b;
    // 0x74C: Used as an input to GetDungeonMode, and uses output to determine if the
    // override fixed room should be loaded?
    u16 field_0x74c;
    u8 field_0x74e;
    u8 field_0x74f;
    // 0x750: A ldr instruction is used at this address? Maybe used for something else before
    // the rescue floor number is set?
    u8 field_0x750;
    u8 rescue_floor; // 0x751: Floor number where the rescue point is, if applicable
    u8 field_0x752;
    u8 field_0x753;
    // 0x754: Should also be prng_pressed_23_bit? dungeon_init::prng_preseed_23_bit gets copied
    // here, but might not be used?
    u32 prng_preseed_23_bit;
    // 0x758: Whether the current floor should continue or end and why
    enum floor_loop_status floor_loop_status;
    bool8 recruiting_enabled; // 0x759: Recruitment is allowed in this dungeon
    // 0x75A: If this is 0, the game wont use GetMonsterEvoStatus when gathering information for
    // the monster's summary (in stuff like the team menu).
    u8 field_0x75a;
    // 0x75B: When the dungeon is initialized this value gets forced to true. Likely because this
    // effect seems incomplete. When false the game will stop items from being added to the bag
    // but monsters are still alloweed to hold onto items normally. However, it does not seem to
    // properly add items picked up by team members to the treasure bag (making it impossible to
    // remove through the item menu). Additionally, items already in the bag can be used normally?
    bool8 bag_enabled;
    bool8 nonstory_flag;      // 0x75C: Allows leader changing and continuing without the partner
    bool8 send_home_disabled; // 0x75D: Sending teammates home is not allowed in this dungeon
    // 0x75E: Disables sending home/leader changing, lose if partner faints. Set for dungeons
    // between DUNGEON_HIDDEN_LAND and DUNGEON_TEMPORAL_PINNACLE.
    bool8 hidden_land_flag;
    // 0x75F: If true, the message log won't be shown and the yellow beam animation won't
    // appear over team members after the leader faints. It's enabled for dungeons where you don't
    // get penalized for fainting, but it's not used to perform that check.
    bool8 skip_faint_animation_flag;
    // 0x760: Info about the next mission destination floor, if applicable
    struct mission_destination_info mission_destination;
    u8 field_0x77c;
    u8 field_0x77d;
    // 0x77E: Appears to track if the player has already been healed by Mime Jr. to change
    // the dialogue. Initialized to 0 using MemZero?
    bool8 bazaar_mime_jr_heal;
    u8 field_0x77f;
    // 0x780: Controls when a monster at a certain speed stage is able to act.
    // Increased by 1-4 each turn, depending on the team leader's speed level:
    // At normal speed, this will tick up by 4 each turn (can act when x % 4 == 3)
    // At +1 speed, ticks up by 2 each turn (can act when x % 2 == 1)
    // At +2 speed, ticks up by 1 or 2 each turn (can act when x % 4 != 0)
    // At +3 speed, ticks up by 1 each turn (an act every tick)
    // The counter is increased modulo 24, goes from 0x00 to 0x17 then starts over
    u16 fractional_turn;
    u16 enemy_spawn_counter; // 0x782: Counts from 0-35, spawns happen at 0
    s16 wind_turns;           // 0x784: Countdown to the wind blowing you out of the dungeon
    u16 enemy_density;       // 0x786: If 0, prevents the enemy_spawn_counter for increasing
    // 0x788: The genid of the next monster to be spawned. Ticks up with each spawn.
    u16 next_spawn_genid;
    u8 field_0x78a; // 0x78A: Initialized to 0x0.
    // 0x78B: True if the leader is running. Causes the leader's action for the next turn
    // to be set to action::ACTION_WALK until it hits an obstacle.
    bool8 leader_running;
    // 0x78C: Likely related to the actions of the leader because it is set to 0 in
    // SetLeaderAction and this value gets bitwise or'd with 0x78B and then saved back to here.
    u8 field_0x78c;
    // 0x78D: This flag is set by the move 0x189 ("HP Gauge") which is the
    // effect of the Identify Orb. If true, monsters not in the team that are
    // holding an item will be marked by a blue exclamation mark icon.
    bool8 identify_orb_flag;
    bool8 pass_turn;        // 0x78E: True if the leader has chosen to pass its turn
    bool8 drought_orb_flag; // 0x78F: True if a drought orb has been used.
    bool8 thief_alert;      // 0x790: If you've stolen from Kecleon (actual dungeon state)
    // 0x791: If you've stolen from Kecleon (triggers music and other events?)
    bool8 thief_alert_event;
    // 0x792: Can only be 0,1,2,3,4. Controls when to play certain special music tracks 0x7C
    // (1), 0x7D (2), 0xA8 (3), 0xA9 (4). Used by the Gone Pebbble to play track 0xA8,
    // challenge letter missions to play track 0x7C and dungeon failure to play 0xA9?
    u8 unk_music_flag;
    bool8 monster_house_triggered; // 0x793: You Entered a Monster House (actual dungeon state)
    // 0x794: You entered a Monster House (triggers music and other events?)
    bool8 monster_house_triggered_event;
    u8 field_0x795;
    // 0x796: Seems to often be 0x3E7 (999)? Somehow related to controlling or managing the
    // playing music?
    u16 field_0x796;
    enum dungeon_objective dungeon_objective; // 0x798: Objective of the current dungeon
    // 0x799: Determines which message to display when the leader's belly reaches 0. Goes up
    // to 0x9 (9), but only displays a unique message for 0x1, 0x2, and 0x3.
    u8 leader_hunger_message_tracker;
    // 0x79A: Keeps track of which animation/message to display as the turn limit ticks down. This
    // ensures that even if the number of turns given to a player is less than the number where an
    // animation would play, it will still play.
    u8 turn_limit_warning_tracker;
    // 0x79B: Number of times you can be rescued in this dungeon
    s8 rescue_attempts_left;
    u32 prng_seed;                  // 0x79C: The dungeon PRNG seed, if set
    u32 rescue_prng_preseed_23_bit; // 0x7A0: The 23 bit dungeon PRNG preseed for rescues?
    u16 field_0x7a4;              // 0x7A4: Initialized to 0x63.
    u16 field_0x7a6;              // 0x7A6: Initialized to 0x63.
    // 0x7A8: Holds some data for a monster id to loads its sprite. If this value is non-zero,
    // it gets loaded after loading the dungeon floor monster spawn entries. Maybe for monsters
    // that need a specific item to spawn?
    enum monster_id some_monster_sprite_to_load;
    u8 some_monster_level; // 0x7AA: The level for dungeon::some_monster_sprite_to_load?
    u8 field_0x7ab;
    // 0x7AC: Second number in the default LCG sequence, used for computing the actual dungeon PRNG
    // seed
    u32 prng_preseed;
    u8 field_0x7b0;
    u8 field_0x7b1;
    u8 field_0x7b2;
    u8 field_0x7b3;
    u8 field_0x7b4;
    u8 field_0x7b5;
    u8 field_0x7b6;
    u8 field_0x7b7;
    u8 field_0x7b8;
    u8 field_0x7b9;
    u8 field_0x7ba;
    u8 field_0x7bb;
    // 0x7BC: The amount of poke the items being bought are worth (By the player)?
    u32 poke_buy_kecleon_shop;
    // 0x7C0: The amount of poke the items being sold are worth (By the player)?
    u32 poke_sold_kecleon_shop;
    // 0x7C4: Uncertain what this tracks? This is definitely related to
    // dungeon::poke_buy_kecleon_shop. Sometimes subtract dungeon::poke_buy_kecleon_shop from
    // this, set this to dungeon::poke_buy_kecleon_shop, and sometimes compared to
    // dungeon::poke_buy_kecleon_shop.
    u32 unk_poke_kecleon_shop_tracker;
    // 0x7C8: Leader standing on a Kecleon shop tile?
    bool8 leader_standing_in_kecleon_shop;
    // 0x7C9: You entered a Kecleon Shop (triggers music and maybe more?)
    bool8 standing_in_kecleon_shop;
    u8 field_0x7ca;
    u8 field_0x7cb;
    // 0x7CC: Controls which mappa file (Time/Darkness/Sky) to load for a dungeon. When time and
    // darkness are selected their respective mappa files are loaded, the hidden stairs type
    // will always return 0, treasure boxes will generate with only exclusive items that exist
    // in time/darkness, use a multiple of 0x28 (40) for poke. If sky is selected, causes
    // waza_p2.bin to be loaded over waza_p.bin. Because waza_p.bin is initally loaded into
    // the move table and the check to load waza_p2.bin is later, waza_p2.bin can be deleted
    // without causing the game to crash as the data from waza_p.bin is still loaded because
    // it's not overwritten by loading waza_p2.bin
    enum game_id dungeon_game_version_id;
    // 0x7D0: Maybe a pointer to a spawn list or related to a spawn list?
    // Possibly a 0x8 long array of a struct-like object? Each entry is 4 bytes, but maybe the
    // last byte is unused??
    u8 field_0x7d0;
    u8 field_0x7d1;
    u8 field_0x7d2;
    u8 field_0x7d3;
    u8 field_0x7d4;
    u8 field_0x7d5;
    u8 field_0x7d6;
    u8 field_0x7d7;
    u8 field_0x7d8;
    u8 field_0x7d9;
    u8 field_0x7da;
    u8 field_0x7db;
    u8 field_0x7dc;
    u8 field_0x7dd;
    u8 field_0x7de;
    u8 field_0x7df;
    u8 field_0x7e0;
    u8 field_0x7e1;
    u8 field_0x7e2;
    u8 field_0x7e3;
    u8 field_0x7e4;
    u8 field_0x7e5;
    u8 field_0x7e6;
    u8 field_0x7e7;
    u8 field_0x7e8;
    u8 field_0x7e9;
    u8 field_0x7ea;
    u8 field_0x7eb;
    u8 field_0x7ec;
    u8 field_0x7ed;
    u8 field_0x7ee;
    u8 field_0x7ef;
    // 0x7F0: Somehow related to dungeon::0x7D0?
    u16 field_0x7f0;
    // 0x7F2: May always just be a copy of dungeon::some_monster_sprite_to_load, but may also
    // have another purpose.
    enum monster_id some_monster_sprite;
    struct monster monsters[20]; // 0x7F4: Info for all the monsters currently in the dungeon
    // 0x34F4: Array that contains the spawn stats for enemies, which are only calculated
    // once at the start of the floor.
    // Since the enemy spawn list of a floor can only have a maximum of 16 entries,
    // the remaining 48 are unused.
    struct enemy_spawn_stats enemy_spawn_stats[64];
    // 0x3974: Monsters that can be spawned on the floor.
    // Read when spawning enemies, at initialization the one at 0x2C964 is used.
    // The number of valid entries is stored in monster_spawn_table_length.
    // The last 2 entries of the table are always Kecleon (0x17F) and the dummy (0x229).
    struct monster_spawn_entry spawn_entries[16];
    u8 field_0x39f4;
    u8 field_0x39f5;
    u8 field_0x39f6;
    u8 field_0x39f7;
    u8 field_0x39f8;
    u8 field_0x39f9;
    u8 field_0x39fa;
    u8 field_0x39fb;
    u8 field_0x39fc;
    u8 field_0x39fd;
    u8 field_0x39fe;
    u8 field_0x39ff;
    u8 field_0x3a00;
    u8 field_0x3a01;
    u8 field_0x3a02;
    u8 field_0x3a03;
    u8 field_0x3a04;
    u8 field_0x3a05;
    u8 field_0x3a06;
    u8 field_0x3a07;
    u8 field_0x3a08;
    u8 field_0x3a09;
    u8 field_0x3a0a;
    u8 field_0x3a0b;
    u8 field_0x3a0c;
    u8 field_0x3a0d;
    u8 field_0x3a0e;
    u8 field_0x3a0f;
    u8 field_0x3a10;
    u8 field_0x3a11;
    u8 field_0x3a12;
    u8 field_0x3a13;
    u8 field_0x3a14;
    u8 field_0x3a15;
    u8 field_0x3a16;
    u8 field_0x3a17;
    u8 field_0x3a18;
    u8 field_0x3a19;
    u8 field_0x3a1a;
    u8 field_0x3a1b;
    u8 field_0x3a1c;
    u8 field_0x3a1d;
    u8 field_0x3a1e;
    u8 field_0x3a1f;
    u8 field_0x3a20;
    u8 field_0x3a21;
    u8 field_0x3a22;
    u8 field_0x3a23;
    u8 field_0x3a24;
    u8 field_0x3a25;
    u8 field_0x3a26;
    u8 field_0x3a27;
    u8 field_0x3a28;
    u8 field_0x3a29;
    u8 field_0x3a2a;
    u8 field_0x3a2b;
    u8 field_0x3a2c;
    u8 field_0x3a2d;
    u8 field_0x3a2e;
    u8 field_0x3a2f;
    u8 field_0x3a30;
    u8 field_0x3a31;
    u8 field_0x3a32;
    u8 field_0x3a33;
    u8 field_0x3a34;
    u8 field_0x3a35;
    u8 field_0x3a36;
    u8 field_0x3a37;
    u8 field_0x3a38;
    u8 field_0x3a39;
    u8 field_0x3a3a;
    u8 field_0x3a3b;
    u8 field_0x3a3c;
    u8 field_0x3a3d;
    u8 field_0x3a3e;
    u8 field_0x3a3f;
    u8 field_0x3a40;
    u8 field_0x3a41;
    u8 field_0x3a42;
    u8 field_0x3a43;
    u8 field_0x3a44;
    u8 field_0x3a45;
    u8 field_0x3a46;
    u8 field_0x3a47;
    u8 field_0x3a48;
    u8 field_0x3a49;
    u8 field_0x3a4a;
    u8 field_0x3a4b;
    u8 field_0x3a4c;
    u8 field_0x3a4d;
    u8 field_0x3a4e;
    u8 field_0x3a4f;
    u8 field_0x3a50;
    u8 field_0x3a51;
    u8 field_0x3a52;
    u8 field_0x3a53;
    u8 field_0x3a54;
    u8 field_0x3a55;
    u8 field_0x3a56;
    u8 field_0x3a57;
    u8 field_0x3a58;
    u8 field_0x3a59;
    u8 field_0x3a5a;
    u8 field_0x3a5b;
    u8 field_0x3a5c;
    u8 field_0x3a5d;
    u8 field_0x3a5e;
    u8 field_0x3a5f;
    u8 field_0x3a60;
    u8 field_0x3a61;
    u8 field_0x3a62;
    u8 field_0x3a63;
    u8 field_0x3a64;
    u8 field_0x3a65;
    u8 field_0x3a66;
    u8 field_0x3a67;
    u8 field_0x3a68;
    u8 field_0x3a69;
    u8 field_0x3a6a;
    u8 field_0x3a6b;
    u8 field_0x3a6c;
    u8 field_0x3a6d;
    u8 field_0x3a6e;
    u8 field_0x3a6f;
    u8 field_0x3a70;
    u8 field_0x3a71;
    u8 field_0x3a72;
    u8 field_0x3a73;
    u8 field_0x3a74;
    u8 field_0x3a75;
    u8 field_0x3a76;
    u8 field_0x3a77;
    u8 field_0x3a78;
    u8 field_0x3a79;
    u8 field_0x3a7a;
    u8 field_0x3a7b;
    u8 field_0x3a7c;
    u8 field_0x3a7d;
    u8 field_0x3a7e;
    u8 field_0x3a7f;
    u8 field_0x3a80;
    u8 field_0x3a81;
    u8 field_0x3a82;
    u8 field_0x3a83;
    u8 field_0x3a84;
    u8 field_0x3a85;
    u8 field_0x3a86;
    u8 field_0x3a87;
    u8 field_0x3a88;
    u8 field_0x3a89;
    u8 field_0x3a8a;
    u8 field_0x3a8b;
    u8 field_0x3a8c;
    u8 field_0x3a8d;
    u8 field_0x3a8e;
    u8 field_0x3a8f;
    u8 field_0x3a90;
    u8 field_0x3a91;
    u8 field_0x3a92;
    u8 field_0x3a93;
    u8 field_0x3a94;
    u8 field_0x3a95;
    u8 field_0x3a96;
    u8 field_0x3a97;
    u8 field_0x3a98;
    u8 field_0x3a99;
    u8 field_0x3a9a;
    u8 field_0x3a9b;
    u8 field_0x3a9c;
    u8 field_0x3a9d;
    u8 field_0x3a9e;
    u8 field_0x3a9f;
    u8 field_0x3aa0;
    u8 field_0x3aa1;
    u8 field_0x3aa2;
    u8 field_0x3aa3;
    u8 field_0x3aa4;
    u8 field_0x3aa5;
    u8 field_0x3aa6;
    u8 field_0x3aa7;
    u8 field_0x3aa8;
    u8 field_0x3aa9;
    u8 field_0x3aaa;
    u8 field_0x3aab;
    u8 field_0x3aac;
    u8 field_0x3aad;
    u8 field_0x3aae;
    u8 field_0x3aaf;
    u8 field_0x3ab0;
    u8 field_0x3ab1;
    u8 field_0x3ab2;
    u8 field_0x3ab3;
    u8 field_0x3ab4;
    u8 field_0x3ab5;
    u8 field_0x3ab6;
    u8 field_0x3ab7;
    u8 field_0x3ab8;
    u8 field_0x3ab9;
    u8 field_0x3aba;
    u8 field_0x3abb;
    u8 field_0x3abc;
    u8 field_0x3abd;
    u8 field_0x3abe;
    u8 field_0x3abf;
    u8 field_0x3ac0;
    u8 field_0x3ac1;
    u8 field_0x3ac2;
    u8 field_0x3ac3;
    u8 field_0x3ac4;
    u8 field_0x3ac5;
    u8 field_0x3ac6;
    u8 field_0x3ac7;
    u8 field_0x3ac8;
    u8 field_0x3ac9;
    u8 field_0x3aca;
    u8 field_0x3acb;
    u8 field_0x3acc;
    u8 field_0x3acd;
    u8 field_0x3ace;
    u8 field_0x3acf;
    u8 field_0x3ad0;
    u8 field_0x3ad1;
    u8 field_0x3ad2;
    u8 field_0x3ad3;
    u8 field_0x3ad4;
    u8 field_0x3ad5;
    u8 field_0x3ad6;
    u8 field_0x3ad7;
    u8 field_0x3ad8;
    u8 field_0x3ad9;
    u8 field_0x3ada;
    u8 field_0x3adb;
    u8 field_0x3adc;
    u8 field_0x3add;
    u8 field_0x3ade;
    u8 field_0x3adf;
    u8 field_0x3ae0;
    u8 field_0x3ae1;
    u8 field_0x3ae2;
    u8 field_0x3ae3;
    u8 field_0x3ae4;
    u8 field_0x3ae5;
    u8 field_0x3ae6;
    u8 field_0x3ae7;
    u8 field_0x3ae8;
    u8 field_0x3ae9;
    u8 field_0x3aea;
    u8 field_0x3aeb;
    u8 field_0x3aec;
    u8 field_0x3aed;
    u8 field_0x3aee;
    u8 field_0x3aef;
    u8 field_0x3af0;
    u8 field_0x3af1;
    u8 field_0x3af2;
    u8 field_0x3af3;
    u8 field_0x3af4;
    u8 field_0x3af5;
    u8 field_0x3af6;
    u8 field_0x3af7;
    u8 field_0x3af8;
    u8 field_0x3af9;
    u8 field_0x3afa;
    u8 field_0x3afb;
    u8 field_0x3afc;
    u8 field_0x3afd;
    u8 field_0x3afe;
    u8 field_0x3aff;
    u8 field_0x3b00;
    u8 field_0x3b01;
    u8 field_0x3b02;
    u8 field_0x3b03;
    u8 field_0x3b04;
    u8 field_0x3b05;
    u8 field_0x3b06;
    u8 field_0x3b07;
    u8 field_0x3b08;
    u8 field_0x3b09;
    u8 field_0x3b0a;
    u8 field_0x3b0b;
    u8 field_0x3b0c;
    u8 field_0x3b0d;
    u8 field_0x3b0e;
    u8 field_0x3b0f;
    u8 field_0x3b10;
    u8 field_0x3b11;
    u8 field_0x3b12;
    u8 field_0x3b13;
    u8 field_0x3b14;
    u8 field_0x3b15;
    u8 field_0x3b16;
    u8 field_0x3b17;
    u8 field_0x3b18;
    u8 field_0x3b19;
    u8 field_0x3b1a;
    u8 field_0x3b1b;
    u8 field_0x3b1c;
    u8 field_0x3b1d;
    u8 field_0x3b1e;
    // TODO Something is omitted from the dungeon struct in JP, but it is not known what is missing.
    // For the time being, take out these unknown fields from JP to allow JP usage of this struct to match.
    // As more functions are decomped, move this conditional up the struct until we find where the actual difference is in the struct.
#ifndef JAPAN
    u8 field_0x3b1f;
    u8 field_0x3b20;
    u8 field_0x3b21;
    u8 field_0x3b22;
    u8 field_0x3b23;
    u8 field_0x3b24;
    u8 field_0x3b25;
    u8 field_0x3b26;
    u8 field_0x3b27;
    u8 field_0x3b28;
    u8 field_0x3b29;
    u8 field_0x3b2a;
    u8 field_0x3b2b;
    u8 field_0x3b2c;
    u8 field_0x3b2d;
    u8 field_0x3b2e;
    u8 field_0x3b2f;
    u8 field_0x3b30;
    u8 field_0x3b31;
    u8 field_0x3b32;
    u8 field_0x3b33;
    u8 field_0x3b34;
    u8 field_0x3b35;
    u8 field_0x3b36;
    u8 field_0x3b37;
    u8 field_0x3b38;
    u8 field_0x3b39;
    u8 field_0x3b3a;
    u8 field_0x3b3b;
    u8 field_0x3b3c;
    u8 field_0x3b3d;
    u8 field_0x3b3e;
    u8 field_0x3b3f;
    u8 field_0x3b40;
    u8 field_0x3b41;
    u8 field_0x3b42;
    u8 field_0x3b43;
    u8 field_0x3b44;
    u8 field_0x3b45;
    u8 field_0x3b46;
    u8 field_0x3b47;
    u8 field_0x3b48;
    u8 field_0x3b49;
    u8 field_0x3b4a;
    u8 field_0x3b4b;
    u8 field_0x3b4c;
    u8 field_0x3b4d;
    u8 field_0x3b4e;
    u8 field_0x3b4f;
    u8 field_0x3b50;
    u8 field_0x3b51;
    u8 field_0x3b52;
    u8 field_0x3b53;
    u8 field_0x3b54;
    u8 field_0x3b55;
    u8 field_0x3b56;
    u8 field_0x3b57;
    u8 field_0x3b58;
    u8 field_0x3b59;
    u8 field_0x3b5a;
    u8 field_0x3b5b;
    u8 field_0x3b5c;
    u8 field_0x3b5d;
    u8 field_0x3b5e;
    u8 field_0x3b5f;
    u8 field_0x3b60;
    u8 field_0x3b61;
    u8 field_0x3b62;
    u8 field_0x3b63;
    u8 field_0x3b64;
    u8 field_0x3b65;
    u8 field_0x3b66;
    u8 field_0x3b67;
    u8 field_0x3b68;
    u8 field_0x3b69;
    u8 field_0x3b6a;
    u8 field_0x3b6b;
    u8 field_0x3b6c;
    u8 field_0x3b6d;
    u8 field_0x3b6e;
    u8 field_0x3b6f;
    u8 field_0x3b70;
    u8 field_0x3b71;
    u8 field_0x3b72;
    u8 field_0x3b73;
#endif
    // 0x3B74: Unknown array, likely one entry per monster species. This might be related to
    // the IQ skill Exp. Go-Getter so the AI knows which monsters to prioritize.
    u8 unknown_array_0x3B74[600];
    // 0x3DCC: Appears to be a table that holds the statuses::statuses_unique_id value for
    // the monsters. Maybe just for convenience to avoid loading it from every monster?
    u32 monster_unique_id[20];
    // 0x3E1C: Appears to be be an index inside or length for
    // dungeon::active_monsters_unique_statuses_ids.
    u32 unique_id_index;
    // 0x3E20: Number of valid monster spawn entries (see spawn_entries).
    int monster_spawn_entries_length;
    u8 field_0x3e24;
    u8 field_0x3e25;
    u8 field_0x3e26;
    u8 field_0x3e27;
    // 0x3E28: Related in some way to the spawn entries on the floor. Does something about them
    // if false, then set to true.
    bool8 unk_spawn_entry_id_check;
    u8 field_0x3e29;
    u8 field_0x3e2a;
    u8 field_0x3e2b;
    // 0x3E2C: Appears to be a counter that is saved into statuses::unique_id so that every
    // monster has a different id for tracking statuses such as Leech Seed and Destiny Bond, and the
    // abilities Storm Drain and Lightning Rod. Initialized to 0x400 (1024)
    u32 monster_unique_id_counter;
    // 0x3E30: Appears to to be a counter that is used for both attacker and defender to figure
    // out which pair of wrapper and wrapped are connected. This number is saved into
    // statuses::wrap_pair_unique_id. Initialized to 0xA (10)
    u32 monster_unique_wrap_counter;
    bool8 plus_is_active[2];  // 0x3E34: A monster on the {enemy, team} side has the ability Plus
    bool8 minus_is_active[2]; // 0x3E36: A monster on the {enemy, team} side has the ability Minus
    // 0x3E38: If true, a monster on the floor is a decoy.
    bool8 decoy_is_active;
    // 0x3E39: If true, a monster with id 0x97 (Mew) cannot be spawned on the floor.
    bool8 mew_cannot_spawn;
    // 0x3E3A: Holds the monster ID for the Deoxys form randomly selected for this floor.
    enum monster_id deoxys_floor_id;
    // 0x3E3C: Gets set to true in ChangeShayminForme. Seems to also control which sprite to
    // load for a Shaymin on the team?
    bool8 shaymin_sky_form_loaded;
    u8 field_0x3e3d;
    u8 field_0x3e3e;
    u8 field_0x3e3f;
    struct item items[64]; // 0x3E40: Info for all the items on the ground
    u16 n_items;      // 0x3FC0: Number of active items in the above items array
    u8 field_0x3fc2;
    u8 field_0x3fc3;
    struct trap traps[64];                   // 0x3FC4: Info for all the traps on the floor
    struct dungeon_generation_info gen_info; // 0x40C4: Stuff involved with dungeon generation
    u8 field_0xccfc;
    u8 field_0xccfd;
    u8 field_0xccfe;
    u8 field_0xccff;
    u8 field_0xcd00;
    u8 field_0xcd01;
    u8 field_0xcd02;
    u8 field_0xcd03;
    u8 field_0xcd04;
    u8 field_0xcd05;
    u8 field_0xcd06;
    u8 field_0xcd07;
    u8 field_0xcd08;
    u8 field_0xcd09;
    u8 field_0xcd0a;
    u8 field_0xcd0b;
    // 0xCD0C: Appears to be an array for the team. Likely only the first 4 entries are used.
    // Possibly related to dungeon_generation_info::individual_team_spawn_positions? Possibly the
    // direction to spawn each team member in?
    enum direction_id unk_team_direction_array[8];
    // Min x of the generated Kecleon shop, if it exists. This reflects the original generation, and
    // is not updated if some shop tiles are deleted by later steps in floor generation
    int kecleon_shop_min_x; // 0xCD14: inclusive
    int kecleon_shop_min_y; // 0xCD18: inclusive
    int kecleon_shop_max_x; // 0xCD1C: inclusive
    int kecleon_shop_max_y; // 0xCD20: inclusive
    // Coordinates for a non full floor fixed room? Uncertain if max values are inclusive.
    int fixed_room_min_x; // 0xCD24: inclusive
    int fixed_room_min_y; // 0xCD28: inclusive
    int fixed_room_max_x; // 0xCD2C: inclusive?
    int fixed_room_max_y; // 0xCD30: inclusive?
    // 0xCD34: Width of the generated fixed room?
    u16 fixed_room_width;
    // 0xCD36: Height of the generated fixed room?
    u16 fixed_room_height;
    enum weather_id weather; // 0xCD38: current weather
    // 0xCD39: Default weather on the floor that will be reverted to if the current weather is
    // artificial and ends
    enum weather_id natural_weather;
    // 0xCD3A: Turns left for each weather type in enum weather_id (except WEATHER_RANDOM). If
    // multiple of these are nonzero, the one with the highest number of turns left is chosen.
    // Ties are broken in enum order
    u16 weather_turns[8];
    // 0xCD4A: Turns left for artificial permaweather from weather-setting abilities like Drought,
    // Sand Stream, Drizzle, and Snow Warning; one counter for each weather type in enum weather_id
    // (except WEATHER_RANDOM). Any nonzero value triggers that weather condition (it's usually set
    // to 1 or 0). If the weather's source is removed, this value becomes the normal number of turns
    // left for that weather condition. Priority in the event of multiple nonzero counters is the
    // same as with weather_turns.
    u16 artificial_permaweather_turns[8];
    // 0xCD5A: For damaging weather conditions like sandstorm. Counts down from 9-0, damage on 9
    u8 weather_damage_counter;
    u8 mud_sport_turns;   // 0xCD5B: Number of turns left for the Mud Sport condition
    u8 water_sport_turns; // 0xCD5C: Number of turns left for the Water Sport condition
    bool8 nullify_weather;      // 0xCD5D: Cloud Nine/Air Lock is in effect
    u8 field_0xcd5e;
    u8 field_0xcd5f;
    // 0xCD60: Seems to be tile data for tiles within fixed rooms
    struct tile fixed_room_tiles[8][8];
    u8 field_0xd260;
    u8 field_0xd261;
    u8 field_0xd262;
    u8 field_0xd263;
    u8 field_0xd264;
    u8 field_0xd265;
    u8 field_0xd266;
    u8 field_0xd267;
    u8 field_0xd268;
    u8 field_0xd269;
    u8 field_0xd26a;
    u8 field_0xd26b;
    u8 field_0xd26c;
    u8 field_0xd26d;
    u8 field_0xd26e;
    u8 field_0xd26f;
    u8 field_0xd270;
    u8 field_0xd271;
    u8 field_0xd272;
    u8 field_0xd273;
    u8 field_0xd274;
    u8 field_0xd275;
    u8 field_0xd276;
    u8 field_0xd277;
    u8 field_0xd278;
    u8 field_0xd279;
    u8 field_0xd27a;
    u8 field_0xd27b;
    u8 field_0xd27c;
    u8 field_0xd27d;
    u8 field_0xd27e;
    u8 field_0xd27f;
    u8 field_0xd280;
    u8 field_0xd281;
    u8 field_0xd282;
    u8 field_0xd283;
    u8 field_0xd284;
    u8 field_0xd285;
    u8 field_0xd286;
    u8 field_0xd287;
    u8 field_0xd288;
    u8 field_0xd289;
    u8 field_0xd28a;
    u8 field_0xd28b;
    u8 field_0xd28c;
    u8 field_0xd28d;
    u8 field_0xd28e;
    u8 field_0xd28f;
    u8 field_0xd290;
    u8 field_0xd291;
    u8 field_0xd292;
    u8 field_0xd293;
    u8 field_0xd294;
    u8 field_0xd295;
    u8 field_0xd296;
    u8 field_0xd297;
    u8 field_0xd298;
    u8 field_0xd299;
    u8 field_0xd29a;
    u8 field_0xd29b;
    u8 field_0xd29c;
    u8 field_0xd29d;
    u8 field_0xd29e;
    u8 field_0xd29f;
    u8 field_0xd2a0;
    u8 field_0xd2a1;
    u8 field_0xd2a2;
    u8 field_0xd2a3;
    u8 field_0xd2a4;
    u8 field_0xd2a5;
    u8 field_0xd2a6;
    u8 field_0xd2a7;
    u8 field_0xd2a8;
    u8 field_0xd2a9;
    u8 field_0xd2aa;
    u8 field_0xd2ab;
    u8 field_0xd2ac;
    u8 field_0xd2ad;
    u8 field_0xd2ae;
    u8 field_0xd2af;
    u8 field_0xd2b0;
    u8 field_0xd2b1;
    u8 field_0xd2b2;
    u8 field_0xd2b3;
    u8 field_0xd2b4;
    u8 field_0xd2b5;
    u8 field_0xd2b6;
    u8 field_0xd2b7;
    u8 field_0xd2b8;
    u8 field_0xd2b9;
    u8 field_0xd2ba;
    u8 field_0xd2bb;
    u8 field_0xd2bc;
    u8 field_0xd2bd;
    u8 field_0xd2be;
    u8 field_0xd2bf;
    u8 field_0xd2c0;
    u8 field_0xd2c1;
    u8 field_0xd2c2;
    u8 field_0xd2c3;
    u8 field_0xd2c4;
    u8 field_0xd2c5;
    u8 field_0xd2c6;
    u8 field_0xd2c7;
    u8 field_0xd2c8;
    u8 field_0xd2c9;
    u8 field_0xd2ca;
    u8 field_0xd2cb;
    u8 field_0xd2cc;
    u8 field_0xd2cd;
    u8 field_0xd2ce;
    u8 field_0xd2cf;
    u8 field_0xd2d0;
    u8 field_0xd2d1;
    u8 field_0xd2d2;
    u8 field_0xd2d3;
    u8 field_0xd2d4;
    u8 field_0xd2d5;
    u8 field_0xd2d6;
    u8 field_0xd2d7;
    u8 field_0xd2d8;
    u8 field_0xd2d9;
    u8 field_0xd2da;
    u8 field_0xd2db;
    u8 field_0xd2dc;
    u8 field_0xd2dd;
    u8 field_0xd2de;
    u8 field_0xd2df;
    // 0xD2E0: Appears to keep track of what tiles are the fixed room tiles when generating
    // a fixed room that isn't the whole floor.
    u8 fixed_room_room_index;
    u8 field_0xd2e1;
    u8 field_0xd2e2;
    u8 field_0xd2e3;
    // 0xD2E4: This is an array of pointers that point to the actual tile structs within the
    // dungeon struct
    struct tile* tile_ptrs[32][56];
    u8 n_rooms;        // 0xEEE4: Number of rooms on the current floor
    u8 field_0xeee5; // Uninitialized, likely padding
    u8 field_0xeee6; // Uninitialized, likely padding
    u8 field_0xeee7; // Uninitialized, likely padding
    // 0xEEE8: Array of structs that contain data about the rooms on the current floor
    struct room_data room_data[32];
    // 0xF268: Array that counts the amount of elements on each row of natural_junction_list
    u16 natural_junction_list_counts[32];
    // 0xF2A8: Matrix that stores the positions of up to 32 natural junctions
    // for each room on the floor. Each row represents a room.
    struct position natural_junction_list[32][32];
    // 0x102A8: Buffer to store some file after being decompressed.
    // The file that gets loaded depends on the tileset ID of the dungeon.
    u8 unknown_file_buffer_0x102A8[7200];
    // 0x11EC8: Matrix related to tile graphics.
    // Skipping the code that initializes it at the start of the dungeon causes all tiles
    // to be shown as black squares.
    u16 unknown_tile_matrix[9][34];
    // 0x1212C: Unknown matrix, probably related to unknown_tile_matrix
    // since they get initialized together.
    u16 unknown_matrix_0x1212C[9][3];
    // 0x12162: Buffer to store some AT4PX file after being decompressed
    // This is somehow related to tile::texture_id and tile variations?

    // TODO Something is omitted from the dungeon struct in JP, but it is not known what is missing.
    // For the time being, take some bytes out of this array to allow JP usage of this struct to match.
    u8 unknown_file_buffer_0x12162[2352];
    // 0x12A92: Unknown array, probably related to unknown_tile_matrix
    // since they get initialized together.
    u16 unknown_array_0x12A92[9];
    // 0x12AA4: Pointer to data about the fixed room such as width and height. Gets set after
    // loading the data for a fixed room when generating a floor. Gets set back to null when
    // done generating a floor.
    u8* unk_fixed_room_pointer;
    // 0x12AA8: This flag is set by the move 0x191 ("Trapper") which is the effect
    // of the Trapper Orb. If true, the game will try to spawn a trap.
    bool8 trapper_orb_flag;
    u8 field_0x12aa9; // Likely padding
    // 0x12AAA: Location to spawn the trap by trapper_orb_flag.
    struct position trapper_orb_trap_pos;
    // 0x12AAE: Trap ID to spawn the trap by trapper_orb_flag. Notably, the game
    // will always set this to 0x19, but could work with other values.
    enum trap_id traper_orb_trap_id;
    // 0x12AAF: Alignment to spawn the trap by trapper_orb_flag.
    u8 trapper_orb_trap_team;
    u8 field_0x12ab0;
    u8 field_0x12ab1;
    u8 field_0x12ab2;
    u8 field_0x12ab3;
    u8 field_0x12ab4;
    u8 field_0x12ab5;
    u8 field_0x12ab6;
    u8 field_0x12ab7;
    u8 field_0x12ab8;
    u8 field_0x12ab9;
    u8 field_0x12aba;
    u8 field_0x12abb;
    u8 field_0x12abc;
    u8 field_0x12abd;
    u8 field_0x12abe;
    u8 field_0x12abf;
    u8 field_0x12ac0;
    u8 field_0x12ac1;
    u8 field_0x12ac2;
    u8 field_0x12ac3;
    u8 field_0x12ac4;
    u8 field_0x12ac5;
    u8 field_0x12ac6;
    u8 field_0x12ac7;
    u8 field_0x12ac8;
    u8 field_0x12ac9;
    u8 field_0x12aca;
    u8 field_0x12acb;
    u8 field_0x12acc;
    u8 field_0x12acd;
    u8 field_0x12ace;
    u8 field_0x12acf;
    u8 field_0x12ad0;
    u8 field_0x12ad1;
    u8 field_0x12ad2;
    u8 field_0x12ad3;
    u8 field_0x12ad4;
    u8 field_0x12ad5;
    u8 field_0x12ad6;
    u8 field_0x12ad7;
    u8 field_0x12ad8;
    u8 field_0x12ad9;
    u8 field_0x12ada;
    u8 field_0x12adb;
    u8 field_0x12adc;
    u8 field_0x12add;
    u8 field_0x12ade;
    u8 field_0x12adf;
    u8 field_0x12ae0;
    u8 field_0x12ae1;
    u8 field_0x12ae2;
    u8 field_0x12ae3;
    u8 field_0x12ae4;
    u8 field_0x12ae5;
    u8 field_0x12ae6;
    u8 field_0x12ae7;
    u8 field_0x12ae8;
    u8 field_0x12ae9;
    u8 field_0x12aea;
    u8 field_0x12aeb;
    u8 field_0x12aec;
    u8 field_0x12aed;
    u8 field_0x12aee;
    u8 field_0x12aef;
    u8 field_0x12af0;
    u8 field_0x12af1;
    u8 field_0x12af2;
    u8 field_0x12af3;
    u8 field_0x12af4;
    u8 field_0x12af5;
    u8 field_0x12af6;
    u8 field_0x12af7;
    // 0x12AF8: The amount of items "sniffed" by the Acute Sniffer iq skill when a floor starts.
    u16 acute_sniffer_item_count;
    // 0x12AFA: Number of normal item spawns. Does not include monster held items and additional
    // items in walls or Monster Houses
    u16 n_normal_item_spawns;
    bool8 gravity; // 0x12AFC: Gravity is in effect
    u8 field_0x12afd;
    // 0x12AFE: Victories on one floor counter.
    s16 victory_counter;
    u8 field_0x12b00;
    u8 field_0x12b01;
    u8 field_0x12b02;
    u8 field_0x12b03;
    u8 field_0x12b04;
    u8 field_0x12b05;
    u8 field_0x12b06;
    u8 field_0x12b07;
    u8 field_0x12b08;
    u8 field_0x12b09;
    u8 field_0x12b0a;
    u8 field_0x12b0b;
    u8 field_0x12b0c;
    u8 field_0x12b0d;
    u8 field_0x12b0e;
    u8 field_0x12b0f;
    u8 field_0x12b10;
    u8 field_0x12b11;
    u8 field_0x12b12;
    u8 field_0x12b13;
    u8 field_0x12b14;
    u8 field_0x12b15;
    u8 field_0x12b16;
    u8 field_0x12b17;
    u8 field_0x12b18;
    u8 field_0x12b19;
    u8 field_0x12b1a;
    u8 field_0x12b1b;
    u8 field_0x12b1c;
    u8 field_0x12b1d;
    u8 field_0x12b1e;
    u8 field_0x12b1f;
    // 0x12B20: Probably counts how many sprites or monster entries the fixed room wants
    // loaded.
    u32 fixed_room_monster_sprite_counter;
    // 0x12B24: Whether or not the kecleon shop spawn chance be boosted for the floor
    bool8 boost_kecleon_shop_spawn_chance;
    // 0x12B25: Whether or not the hidden stairs spawn chance be boosted for the floor
    // (by 20%; see HIDDEN_STAIRS_SPAWN_CHANCE_MULTIPLIER)
    bool8 boost_hidden_stairs_spawn_chance;
    u8 field_0x12b26;
    u8 field_0x12b27;

    //struct entity_table entity_table; // 0x12B28: Table of all entities in the dungeon
    // The pointers point into the entities array
    // 0x12B28 / 0x0: A list of all monster pointers, whether they're used or not
    union {
        struct entity* party_members[MAX_TEAM_MEMBERS];
        struct entity* monster_slot_ptrs[DUNGEON_MAX_POKEMON];
    };
    // 0x12B78 / 0x50: Null-terminated array of pointers to actually active monsters
    struct entity* active_monster_ptrs[DUNGEON_MAX_POKEMON];
    struct entity* item_ptrs[64];     // 0x12BC8 / 0xA0
    struct entity* trap_ptrs[64];     // 0x12CC8 / 0x1A0
    struct entity* hidden_stairs_ptr; // 0x12DC8 / 0x2A0
    struct entity entities[149];    // 0x12DCC / 0x2A4 : All the entities in a dungeon

    // 0x198E4: An ally monster related to storm drain/lightning rod and maybe other checks?
    struct entity* unk_ally_monster1;
    u32 unk_ally_monster_unique_id1; // 0x198E8: statuses::unique_id from that monster?
    // 0x198EC: An ally monster related to storm drain/lightning rod and maybe other checks?
    struct entity* unk_ally_monster2;
    u32 unk_ally_monster_unique_id2; // 0x198F0: statuses::unique_id from that monster?
    // 0x198F4: An enemy monster related to storm drain/lightning rod and maybe other checks?
    struct entity* unk_enemy_monster1;
    u32 unk_enemy_monster_unique_id1; // 0x198F8: statuses::unique_id from that monster?
    // 0x198FC: An enemy monster related to storm drain/lightning rod and maybe other checks?
    struct entity* unk_enemy_monster2;
    u32 unk_enemy_monster_unique_id2; // 0x19900: statuses::unique_id from that monster?
    // 0x19904: Pointer to the monster that will snatch the effect of a move.
    struct entity* snatch_monster;
    // 0x19908: Pointer to the entity to be spawned by the effect of Illuminate
    struct entity* illuminate_spawn_entity;
    // 0x1990C: Stores statuses::unique_id for the monster pointed to by dungeon::snatch_monster.
    u32 snatch_status_unique_id;
    // 0x19910: Spawn genid of the monster to be spawned by the effect of Illuminate
    u16 illuminate_spawn_genid;
    u8 field_0x19912;
    u8 field_0x19913;
    // 0x19914: List that matches monster IDs with their sprite index on this floor
    enum monster_id sprite_indexes[1155];
    u8 field_0x1a21a;
    u8 field_0x1a21b;
    // 0x1A21C: Data about the map, the camera and the touchscreen numbers
    struct display_data display_data;
    struct minimap_display_data minimap_display_data; // 0x1A264: Data used to display the minimap
    // 0x286B0: Initialized to 0xFF, then set to a copy of dungeon::group_id
    enum dungeon_group_id group_id_copy;
    // 0x286B1: Initialized to 0xFF, then set to a copy of dungeon::0x74B
    u8 field_0x286b1;
    struct floor_properties floor_properties; // 0x286B2: Properties about the current floor
    // 0x286D2: Maybe a 0x10 long array?
    u16 field_0x286d2;
    u16 field_0x286d4;
    u16 field_0x286d6;
    u16 field_0x286d8;
    u16 field_0x286da;
    u16 field_0x286dc;
    u16 field_0x286de;
    u16 field_0x286e0;
    u16 field_0x286e2;
    u16 field_0x286e4;
    u16 field_0x286e6;
    u16 field_0x286e8;
    u16 field_0x286ea;
    u16 field_0x286ec;
    u16 field_0x286ee;
    u16 field_0x286f0;
    // 0x286F2: Spawn weights for regular items. It's the unrolled form of this floor's regular
    // item spawn list.
    // It has enough space to hold 1416 entries (1400 items + 16 categories), but only the
    // first 0x16C slots are used since spawn lists can't encode item IDs larger than that.
    u16 regular_item_weights[1416];
    // 0x29202: Spawn weights for Kecleon shop items. Same format as regular_item_weights.
    u16 kecleon_item_weights[1416];
    // 0x29D12: Spawn weights for monster house items. Same format as regular_item_weights.
    u16 monster_house_item_weights[1416];
    // 0x2A822: Spawn weights for buried items. Same format as regular_item_weights.
    u16 buried_item_weights[1416];
    // 0x2B332: Spawn weights for bazaar grab bag items. Same format as regular_item_weights.
    u16 grab_bag_item_weights[1416];
    // 0x2BE42: Spawn weights for secret room items in treasure boxes.
    // Same format as regular_item_weights? For some reason the weights for the secret rooms
    // are of a different length than the other item weight lists before it. The trap weights
    // appear to overlap what would be entries 1400-1415.
    u16 secret_room_item_weights[1400];
    // 0x2C932: Spawn weights for traps.
    u16 trap_weights[25];
    // 0x2C964: List of spawn entries on this floor
    // This is used during initialization, enemies are spawned using the copy at 0x3974
    struct monster_spawn_entry spawn_entries_master[16];
    // 0x2C9E4: The total number of spawn entries loaded or to be loaded?
    u16 number_sprites_loaded;
    // 0x2C9E6: Highest level among all the enemies that spawn on this floor
    u16 highest_enemy_level;
    // 0x2C9E8: ID of an item guaranteed to spawn on the floor, if applicable
    // (e.g., certain mission types)
    enum item_id guaranteed_item_id;
    // 0x2C9EA: List of the indices in the complete monster spawn table for this floor that were
    // chosen to spawn on it. It gets rerandomized at the start of each new floor.
    u16 spawn_table_entries_chosen[16];
    u8 field_0x2ca0a;
    u8 field_0x2ca0b;
    // 0x2CA0C: Holds the name for the entity that caused the faint. The exact size is a guess.
    // Likely larger because of entities like the Explosion Trap.
    char fainted_monster_cause_entity_name[10];
    u8 field_0x2ca16;
    u8 field_0x2ca17;
    u8 field_0x2ca18;
    u8 field_0x2ca19;
    u8 field_0x2ca1a;
    u8 field_0x2ca1b;
    u8 field_0x2ca1c;
    u8 field_0x2ca1d;
    u8 field_0x2ca1e;
    u8 field_0x2ca1f;
    u8 field_0x2ca20;
    u8 field_0x2ca21;
    u8 field_0x2ca22;
    u8 field_0x2ca23;
    u8 field_0x2ca24;
    u8 field_0x2ca25;
    u8 field_0x2ca26;
    u8 field_0x2ca27;
    u8 field_0x2ca28;
    u8 field_0x2ca29;
    // 0x2CA2A: Holds the name for the monster that fainted. The exact size is a guess.
    char fainted_monster_name[10];
    u8 field_0x2ca34;
    u8 field_0x2ca35;
    u8 field_0x2ca36;
    u8 field_0x2ca37;
    u8 field_0x2ca38;
    u8 field_0x2ca39;
    u8 field_0x2ca3a;
    u8 field_0x2ca3b;
    u8 field_0x2ca3c;
    u8 field_0x2ca3d;
    u8 field_0x2ca3e;
    u8 field_0x2ca3f;
    u8 field_0x2ca40;
    u8 field_0x2ca41;
    u8 field_0x2ca42;
    u8 field_0x2ca43;
    u8 field_0x2ca44;
    u8 field_0x2ca45;
    u8 field_0x2ca46;
    u8 field_0x2ca47;
    // 0x2CA48: A monster name that is copied from dungeon::unk_fainted_monster_name. Maybe for
    // situations where the player loses because the partner, escort, or accompanying monster
    // fainted? Another poossible use is when leaving a dungeon after a mission? Exact size is
    // a guess.
    char loss_related_monster_name[10];
    u8 field_0x2ca52;
    u8 field_0x2ca53;
    u8 field_0x2ca54;
    u8 field_0x2ca55;
    u8 field_0x2ca56;
    u8 field_0x2ca57;
    u8 field_0x2ca58;
    u8 field_0x2ca59;
    u8 field_0x2ca5a;
    u8 field_0x2ca5b;
    u8 field_0x2ca5c;
    u8 field_0x2ca5d;
    u8 field_0x2ca5e;
    u8 field_0x2ca5f;
    u8 field_0x2ca60;
    u8 field_0x2ca61;
    u8 field_0x2ca62;
    u8 field_0x2ca63;
    u8 field_0x2ca64;
    u8 field_0x2ca65;
    // 0x02CA66: The cause of the mission over. Identical to the damage source in HandleFaint,
    // but can be set to some non-damage related reasons manually by the game. IE: "cleared the
    // dungeon." and "succeeded in the rescue mission."
    union damage_source fainted_monster_dungeon_end_reason;
    enum dungeon_id fainted_id; // 0x2CA68: Copied from dungeon::id, upon fainting.
    u8 fainted_floor;          // 0x2CA69: Copied from dungeon::floor, upon fainting.
    // 0x2CA6A: Copy of the fainted monster's held item.
    struct item fainted_monster_held_item;
    int fainted_monster_exp; // 0x2CA70: Copy of fainted monster's experience.
    // 0x2CA74: Copy of the fainted monster's ACTUAL max hp (monster::max_hp_stat +
    // monster::max_hp_boost)
    s16 fainted_monster_max_hp;
    // 0x2CA76: Copy of the fainted monster's offensive stats.
    u8 fainted_monster_offensive_stats[2];
    // 0x2CA78: Copy of the fainted monster's defenive stats.
    u8 fainted_monster_defensive_stats[2];
    u8 fainted_monster_level; // 0x2CA7A: Copy of fainted monster's level.
    u8 field_0x2ca7b;
    // 0x2CA7C: This is a monster summary related to the menu when leaving a dungeon. When
    // succesfully exiting a dungeon it is the leader. May be other allies when they faint?
    struct monster_summary getout_monster_summary;
    // 0x2CAF4: One more than the maximum number of floors in the current dungeon
    u8 n_floors_plus_one;
    u8 field_0x2caf5;
    u8 field_0x2caf6;
    u8 field_0x2caf7;
    // 0x2CAF8: Related to playing dungeon music? Initialized to 0x4.
    u32 field_0x2caf8;
    // Related to playing dungeon music?
    u8 field_0x2cafc;
    u8 field_0x2cafd;
    u8 field_0x2cafe;
    u8 field_0x2caff;
    // Related to playing dungeon music?
    u16 field_0x2cb00;
    // Related to playing dungeon music?
    u16 field_0x2cb02;
    // 0x2CB04: Related to playing dungeon music?
    u16 field_0x2cb04;
    // 0x2CB06: Current Dunegon Music ID
    enum music_id dungeon_music_playing_id;
    u8 field_0x2cb08;
    u8 field_0x2cb09;
    u8 field_0x2cb0a;
    u8 field_0x2cb0b;
    u8 field_0x2cb0c;
    u8 field_0x2cb0d;
    u8 field_0x2cb0e;
    u8 field_0x2cb0f;
    // 0x2CB10: Somehow related to display_data::hallucinating and seems to maybe control
    // the sleeping animations when the camera is pointed away from a hallucinating monster?
    // Initialized to 0x1.
    bool8 unk_camera_tracker;
    u8 field_0x2cb11;
    u8 field_0x2cb12;
    u8 field_0x2cb13;
};

#endif // PMDSKY_DUNGEON_H
