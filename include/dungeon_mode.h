#ifndef PMDSKY_DUNGEON_MODE_H
#define PMDSKY_DUNGEON_MODE_H

#include "util.h"
#include "enums.h"
#include "graphics.h"
#include "dungeon_mode_common.h"

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

// Dungeon data
struct dungeon {
    u8 PAD1[1864];
    u8 dungeon;  // 0x748
    u8 floor;    // 0x749
    u8 PAD2[74554];
#ifndef JAPAN
    u8 PAD3[164];
#endif
    struct entity* party_members[4]; // 0x12B28
    // Possibly more stuff
};

// Item info
struct item {
    // 0x0: flags: 1-byte bitfield
    u8 flags_0x0;
    /* bool f_exists : 1;  // Validity flag */
    /* bool f_in_shop : 1; // In a Kecleon Shop */
    /* bool f_unpaid : 1;  // Picked up from a Kecleon Shop but not paid for yet */
    /* bool f_sticky : 1;  // Sticky */
    /* bool f_set : 1;     // Usable by L+R */
    /* bool flag_unk5 : 1; */
    /* // For stolen items to recover from outlaws (has red X)? Could be for other items for other */
    /* // types of missions? (Uncertain) */
    /* bool f_unk_mission_item1 : 1; */
    /* // For stolen items to recover from outlaws (has red X)? Could be for other items for other */
    /* // types of missions? (Uncertain) Definitely used temporarily when sorting the items in */
    /* // storage. */
    /* bool f_unk_mission_item2 : 1; */
    // 0x1: For bag items. 0 for none, 1 if held by the leader, 2 for the second party member, etc.
    u8 held_by;
    // 0x2: Only for stackable items. Will be 0 if unapplicable. For Poké, this is an "amount code"
    // rather than the literal amount (see MONEY_QUANTITY_TABLE)
    u16 quantity;
    enum item_id id; // 0x4
};

// Monster stat modifier info
struct monster_stat_modifiers {
    // Stages go from 0-20 inclusive, with normal being 10
    s16 offensive_stages[2];  // 0x0: {atk, sp_atk}
    s16 defensive_stages[2];  // 0x4: {def, sp_def}
    s16 hit_chance_stages[2]; // 0x8: {accuracy, evasion}
    s16 flash_fire_boost;     // 0xC: can be 0, 1, or 2
    undefined field_0xe;
    undefined field_0xf;
    // Some moves like Screech affect the damage calculation differently than, e.g., Leer
    // 0x10: binary fixed-point (8 fraction bits), {atk, sp_atk}; from Charm, Memento, etc.
    fx32_8 offensive_multipliers[2];
    // 0x18: binary fixed-point (8 fraction bits), {def, sp_def}; from Screech, etc.
    fx32_8 defensive_multipliers[2];
};

// Monster statuses
// Many fields are indexes that select from a group of status conditions. These fields are named
// by the FIRST status in the list (when the index is 1, since 0 usually means no status). For other
// statuses in the group, see the subsequent enum values in enum status_id after the first status.
struct statuses {
    bool roost;
    // 0x1: The typing in entity::types before the flying type is removed for statuses::roost
    // and restored to entity::types after statuses::roost ends.
    enum type_id original_types[2];
    // 0x3: The move id to be used if statuses::bide is 1.
    u8 bide_move_id;
    undefined field_0x4;
    undefined field_0x5;
    undefined field_0x6;
    // 0x7: Unique number given to the monster when spawning to differentiate it from other
    // monsters and to properly keep track of a monster. Likely used because a monster could be
    // spawned into the same slot as an old monster and using a pointer alone could cause some
    // issues. Used for Leech Seed, Destiny Bond, Storm Drain, Lightning Rod (probably more).
    u32 unique_id;
    // 0xB: Unique number between the wrapped and wrapping target to connect them.
    u32 wrap_pair_unique_id;
    // 0xF: Tracks the damage taken to deal when bide status ends. Max 0x3E7 (999).
    u32 bide_damage_tally;
    enum monster_behavior monster_behavior : 8; // 0x13
    u8 sleep;                              // 0x14: STATUS_SLEEP if 1
    u8 sleep_turns; // 0x15: Turns left for the status in statuses::sleep
    u8 burn;        // 0x16: STATUS_BURN if 1
    u8 burn_turns;  // 0x17: Turns left for the status in statuses::burn
    // 0x18: Turns left until residual damage for the status in statuses::burn, if applicable
    u8 burn_damage_countdown;
    // 0x19: The number of times the statuses::burn_damage_countdown has reached 0. Only used
    // when badly poisoned. Determines how much damage the badly poisoned status condition
    // will deal. There is no noticable difference because the table this value is looked up
    // on is filled with 0x6
    u8 badly_poisoned_damage_count;
    undefined field_0x1a;
    u8 freeze; // 0x1B: STATUS_FROZEN if 1
    undefined field_0x1c;
    undefined field_0x1d;
    undefined field_0x1e;
    // 0x1F: Controls the animation that plays when taking damage from the constriction status.
    // For some reason this is initalized to 0x22 (34)? Which is the animation used by
    // the exclusive item Nether Veil.
    u32 constriction_animation;
    u8 freeze_turns; // 0x23: Turns left for the status in statuses::freeze
    // 0x24: Turns left until residual damage for the status in statuses::freeze, if applicable
    u8 freeze_damage_countdown;
    undefined field_0x25;
    undefined field_0x26;
    u8 cringe;         // 0x27: STATUS_CRINGE if 1
    u8 cringe_turns;   // 0x28: Turns left for the status in statuses::cringe
    u8 bide;           // 0x29: STATUS_BIDE if 1
    u8 bide_turns;     // 0x2A: Turns left for the status in statuses::bide
    u8 bide_move_slot; // 0x2B: Slot in the user's move list
    u8 reflect;        // 0x2C: STATUS_REFLECT if 1
    u8 reflect_turns;  // 0x2D: Turns left for the status in statuses::reflect
    // 0x2E: Turns left until residual healing for the status in statuses::reflect, if applicable
    u8 reflect_damage_countdown;
    u8 curse; // 0x2F: STATUS_CURSED if 1
    // 0x30: Set to monster::is_not_team_member of the attacker (the one causing the decoy status).
    u8 curse_applier_non_team_member_flag;
    // 0x31: Set to 1 on a Pokemon when inflicted with the Decoy status.
    undefined unk_decoy_tracker;
    u8 curse_turns; // 0x32: Turns left for the status in statuses::curse
    // 0x33: Turns left until residual damage for the status in statuses::curse, if applicable
    u8 curse_damage_countdown;
    undefined field_0x34;
    undefined field_0x35;
    undefined field_0x36;
    u8 leech_seed; // 0x37: STATUS_LEECH_SEED if 1
    undefined field_0x38;
    undefined field_0x39;
    undefined field_0x3a;
    // 0x3B: Used to track the statuses::statuses_unique_id of the relevant monster for
    // statuses like Leech Seed and Destiny Bond.
    u32 statuses_applier_id;
    // 0x3F: Index into entity_table_hdr::monster_slot_ptrs in the dungeon that the user
    // (drainer) is held.
    u8 leech_seed_source_monster_index;
    u8 leech_seed_turns; // 0x40: Turns left for the status in statuses::leech_seed
    // 0x41: Turns left until residual damage for the status in statuses::leech_seed, if applicable.
    // Behaves weirdly without an afflictor
    u8 leech_seed_damage_countdown;
    undefined field_0x42;
    u8 sure_shot;         // 0x43: STATUS_SURE_SHOT if 1
    u8 sure_shot_turns;   // 0x44: Turns left for the status in statuses::sure_shot
    u8 long_toss;         // 0x45: STATUS_LONG_TOSS if 1
    u8 invisible;         // 0x46: STATUS_INVISIBLE if 1
    u8 invisible_turns;   // 0x47: Turns left for the status in statuses::invisible
    u8 blinded;           // 0x48: STATUS_BLINKER if 1
    u8 blinded_turns;     // 0x49: Turns left for the status in statuses::blinded
    u8 muzzled;           // 0x4A: STATUS_MUZZLED if 1
    u8 muzzled_turns;     // 0x4B: Turns left for the status in statuses::muzzled
    u8 miracle_eye;       // 0x4C: STATUS_MIRACLE_EYE if 1
    u8 miracle_eye_turns; // 0x4D: Turns left for the status in statuses::miracle_eye
    u8 magnet_rise;       // 0x4E: STATUS_MAGNET_RISE if 1
    u8 magnet_rise_turns; // 0x4F: Turns left for the status in statuses::magnet_rise
    bool power_ears;           // 0x50: STATUS_POWER_EARS
    bool scanning;             // 0x51: STATUS_SCANNING
    bool stair_spotter;        // 0x52: STATUS_STAIR_SPOTTER
    // 0x53: Set when initally spawning a team member with the ability Pickup.
    bool pickup_flag;
    bool grudge;       // 0x54: STATUS_GRUDGE
    bool exposed;      // 0x55: STATUS_EXPOSED (Foresight/Odor Sleuth)
    bool type_changed; // 0x56: Flag for if the monster's type has been changed
    bool boss_flag;    // 0x57: Seems to be true for boss monsters
    // 0x58: Appears to be a flag for when a monster increasces their speed. Maybe only used
    // by the RunLeaderTurn function to know if the leader has changed their speed stage partway
    // through the function?
    undefined unk_sped_up_tracker;
    // 0x59: Maybe related to being a team member and new recruit? Set to 1 in TryRecruit
    // and 0 in SpawnTeam. Also checked in EnemyEvolution to be 0 before evolving. Maybe to
    // prevent a recently recruited ally from evolving after and or to add a monster to the
    // assembly after the completion of a dungeon?
    undefined field_0x59;
#ifndef JAPAN
    // 0x5A: Possibly a flag while in action. Could also be a flag to cause the burn from
    // lava, heal a burn from water, and decrease hunger in the walls.
    bool in_action;
#endif
    // 0x5B: STATUS_TERRIFIED, interestingly, appears to use 0x1 for the Foe-Fear Orb but
    // 0x2 for the ability Stench. The distinction only seems to exist for the game to use
    // a special message for when terrified from stench ends.
    u8 terrified;
    u8 terrified_turns;   // 0x5C: Turns left for the terrified status
    u8 perish_song_turns; // 0x5D: Turns left before Perish Song takes effect
    // 0x5E: Increases progressively while the No-Slip Cap is held. Capped at 0x13
    // Used to calculate the chance of an item becoming sticky, resets to 0 when that happens
    u8 no_slip_cap_counter;
    // 0x5F: Determines how much experience the monster will reward after being defeated
    // 0 = 0.5x, 1 = 1.0x, 2 = 1.5x
    u8 exp_yield;
    // 0x60: Appears to be set when the held item of the monster is going to be used?
    bool unk_item_use_action;
    // 0x61: Is initalized to 0x63 (99). Changing it from this value causes the monster to
    // begin rendering differently? For example, it causes entity::0xB3 to be 1 and forces
    // entity::0x28 to be 0.
    undefined field_0x61;
    // 0x62: Flag for two-turn moves that haven't concluded yet. This is also a graphical flag.
    // A value of 1 mean "high up" (Fly/Bounce). A value of 2 means some other condition like
    // Dig, Shadow Force, etc. Other values are treated as invalid. Also used for the move
    // Seismic Toss when throwing up the target.
    u8 two_turn_move_invincible;
    // 0x63: Related to handling AI when a decoy is present on the floor?
    // Seems to only be 0, 1, 2
    undefined decoy_ai_tracker;
#ifndef JAPAN
    undefined field_0x64;
    undefined field_0x65;
    undefined field_0x66;
#endif
    // 0x67: 1 means normal. 0 means half speed. 2, 3, and 4 mean 2x, 3x, and 4x speed.
    int speed_stage;
    // Each counter ticks down to 0 turn by turn. The current speed_stage is calculated as:
    // min(max({# nonzero speed_up_counters} - {# nonzero speed_down_counters}, 0), 4)
    u8 speed_up_counters[5];   // 0x6B
    u8 speed_down_counters[5]; // 0x70
    u8 stockpile_stage;        // 0x75: Goes from 0-3. STATUS_STOCKPILING if nonzero
};

// A bitfield where every bit controls one of the icons that can appear on top of a monster's sprite
// to represent status effects. If multiple bits are set, the shown icon cycles through them.
struct status_icon_flags {
    bool f_sleepless : 1; // Blue eye blinking yellow
    bool f_burn : 1;      // Red flame
    bool f_poison : 1;    // White skull
    bool f_toxic : 1;     // Purple skull
    bool f_confused : 1;  // Yellow birds
    bool f_cowering : 1;  // 2 green lines in circle (same as whiffer)
    bool f_taunt : 1;     // Fist icon
    bool f_encore : 1;    // Blue exclamation mark (same as low HP)
    // Blue shield with white sparks. Also for counter, mini counter, mist,
    // metal burst, aqua ring, and lucky chant
    bool f_reflect : 1;
    bool f_safeguard : 1;            // Pink shield. Also for mirror coat
    bool f_light_screen : 1;         // Golden shield. Also for magic coat
    bool f_protect : 1;              // Green shield. Also for mirror move and vital throw
    bool f_endure : 1;               // Blue shield with red sparks
    bool f_low_hp : 1;               // Blue exclamation mark (same as encore)
    bool f_curse : 1;                // Red skull
    bool f_embargo : 1;              // Yellow exclamation mark. Also for gastro acid and snatch
    bool f_sure_shot : 1;            // Blue sword blinking yellow
    bool f_whiffer : 1;              // 2 green lines in circle (same as cowering)
    bool f_set_damage : 1;           // Blue sword blinking red
    bool f_focus_energy : 1;         // Red sword blinking yellow
    bool f_blinded : 1;              // Blue eye with an X
    bool f_cross_eyed : 1;           // Blue question mark
    bool f_eyedrops : 1;             // Blue eye blinking yellow with a circular wave
    bool f_muzzled : 1;              // Blinking red cross
    bool f_grudge : 1;               // Purple shield
    bool f_exposed : 1;              // Blue eye blinking red with a circular wave
    bool f_sleep : 1;                // Red Z's
    bool f_lowered_stat : 1;         // Yellow arrow pointing down
    bool f_heal_block : 1;           // Blinking green cross
    bool f_miracle_eye : 1;          // Blinking orange cross
    bool f_red_exclamation_mark : 1; // Probably unused
    bool f_magnet_rise : 1;          // Purple arrow pointing up

    // The following 4 bytes appear to have a different meaning, maybe they are intended to
    // represent icons that are always displayed and do not cycle (inferred from the difference
    // between the ice block and the other icons). Except for the first bit, the others do not
    // seem to have an effect, but the code stores the full 4 bytes as a bitwise OR of some of the
    // flags (see UpdateStatusIconBitfield).
    bool f_freeze : 1; // Ice block
    u8 flags_unk2 : 7;
    undefined field_0x5;
    undefined field_0x6;
    undefined field_0x7;
};

// Stores a parameter for an action taken by a monster
struct action_parameter {
    // 0x0: Metadata for the action.
    // E.g., this is the monster index when taking an action on a monster, the move index when
    // using a move or a union item_index value when using an item.
    u8 action_use_idx;
    undefined field_0x1;
    struct position item_pos; // 0x2: Position of the item to use when using an item on the floor
};

// Contains data used to describe an action taken by a monster.
struct action_data {
    enum action action_id;      // 0x0: Action ID
    enum direction_id direction : 8; // 0x2: Direction in which the action will be performed
    undefined field_0x3;
    struct action_parameter action_parameters[2]; // 0x4: Parameters for the action
    s16 field_0x10;
    s16 field_0x12;
};

// Monster info
struct monster {
    // 0x0: flags: 2-byte bitfield
    // If true, the AI will skip this monster's turn. There's also an unresearched
    // check related to constriction that reads this flag
    u16 flags_0x0;
    //bool f_ai_unk : 1;
    //bool f_ai_skip_turn : 1; // If true, the AI will skip this monster's turn and reset the flag.
    //u16 flags_unk2 : 3;
    //bool f_swapping_places : 1; // Swapping places with another monster
    //u16 flags_unk6 : 3;
    //bool f_walking : 1; // Walking (but not dashing)
    //u16 flags_unk10 : 5;
    //bool f_swapping_places_petrified_ally : 1; // Swapping places with a petrified ally

    enum monster_id id : 16;          // 0x2:
    enum monster_id apparent_id : 16; // 0x4: What's outwardly displayed if Transformed
    bool is_not_team_member; // 0x6: true for enemies and allied NPCs that aren't on the team
    bool is_team_leader;     // 0x7
    // 0x8: An ally is an NPC that isn't a normal team member, e.g. for story boss battles
    bool is_ally;
    enum shopkeeper_mode shopkeeper : 8; // 0x9
    u8 level;                       // 0xA
    undefined field_0xb;
    s16 team_index;  // 0xC: In order by team lineup
    s16 iq;          // 0xE
    s16 hp;          // 0x10: Current HP
    s16 max_hp_stat; // 0x12: Add to max_hp_boost for the actual max HP
    undefined field_0x14;
    undefined field_0x15;
    s16 max_hp_boost; // 0x16: From Life Seeds, Sitrus Berries, etc.
    undefined field_0x18;
    undefined field_0x19;
    u8 offensive_stats[2]; // 0x1A: {atk, sp_atk}
    u8 defensive_stats[2]; // 0x1C: {def, sp_def}
    u8 field_0x1e;
    u8 field_0x1f;
    s32 exp;                                      // 0x20: Total Exp. Points
    struct monster_stat_modifiers stat_modifiers; // 0x24
    s16 hidden_power_base_power;              // 0x44
    enum type_id hidden_power_type : 8;           // 0x46
    undefined field_0x47;
    enum dungeon_id joined_at : 8; // 0x48: Also used as a unique identifier for special monsters
    u8 joined_at_floor;       // 0x49: Floor number of recruitment. 0 for special recruits
    struct action_data action;     // 0x4A: Determines the action the monster will take on this turn
    enum type_id types[2];     // 0x5E
    enum ability_id abilities[2]; // 0x60
    struct item held_item;            // 0x62
    // 0x68: Previous held item. Used for whenever taking the X-Ray Specs or Y-Ray Specs on or off
    // in order to update the camera and minimap. Changed to held_item.id after checking.
    enum item_id previous_held_item_id;
    // Previous position data is used by the AI
    struct position prev_pos;  // 0x6A: Position 1 turn ago
    struct position prev_pos2; // 0x6E: Position 2 turns ago
    struct position prev_pos3; // 0x72: Position 3 turns ago
    struct position prev_pos4; // 0x76: Position 4 turns ago
    undefined field_0x7a;
    undefined field_0x7b;
    enum ai_objective ai_objective : 8; // 0x7C
    bool ai_not_next_to_target;         // 0x7D: This NPC monster is not next to its current target
    bool ai_targeting_enemy;            // 0x7E: This NPC monster is targeting an enemy monster
    bool ai_turning_around;             // 0x7F: This NPC monster has decided to turn around
    // 0x80: entity::spawn_genid of the entity currently being targeted
    u16 ai_target_spawn_genid;
    undefined field_0x82;
    undefined field_0x83;
    struct entity* ai_target; // 0x84: Current or most recent AI target
    undefined field_0x88;
    undefined field_0x89;
    undefined field_0x8a;
    undefined field_0x8b;
    struct position ai_target_pos; // 0x8C: Position of the entity currently being targeted
    // 0x90: Work array while updating skills in the menu. Same meaning as iq_skill_flags.
    u32 iq_skill_menu_flags[3];
    // 0x9C: First 9 bytes contain bitfield data; the rest is presumably padding.
    // Bitvector. See enum iq_skill_id for the meaning of each bit.
    u32 iq_skill_flags[3];
    enum tactic_id tactic : 8; // 0xA8

    //struct statuses statuses;  // 0xA9 / Need to be inline for alignment
    bool roost;
    // 0xAA / 0x1: The typing in entity::types before the flying type is removed for statuses::roost
    // and restored to entity::types after statuses::roost ends.
    enum type_id original_types[2];
    // 0xAC / 0x3: The move id to be used if statuses::bide is 1.
    u8 bide_move_id;
    undefined field_0xad;
    undefined field_0xae;
    undefined field_0xaf;
    // 0xB0 / 0x7: Unique number given to the monster when spawning to differentiate it from other
    // monsters and to properly keep track of a monster. Likely used because a monster could be
    // spawned into the same slot as an old monster and using a pointer alone could cause some
    // issues. Used for Leech Seed, Destiny Bond, Storm Drain, Lightning Rod (probably more).
    u32 unique_id;
    // 0xB4 / 0xB: Unique number between the wrapped and wrapping target to connect them.
    u32 wrap_pair_unique_id;
    // 0xB8 / 0xF: Tracks the damage taken to deal when bide status ends. Max 0x3E7 (999).
    u32 bide_damage_tally;
    enum monster_behavior monster_behavior : 8; // 0xBC / 0x13
    u8 sleep;                              // 0xBD / 0x14: STATUS_SLEEP if 1
    u8 sleep_turns; // 0xBE / 0x15: Turns left for the status in statuses::sleep
    u8 burn;        // 0xBF / 0x16: STATUS_BURN if 1
    u8 burn_turns;  // 0xC0 / 0x17: Turns left for the status in statuses::burn
    // 0xC1 / 0x18: Turns left until residual damage for the status in statuses::burn, if applicable
    u8 burn_damage_countdown;
    // 0xC2 / 0x19: The number of times the statuses::burn_damage_countdown has reached 0. Only used
    // when badly poisoned. Determines how much damage the badly poisoned status condition
    // will deal. There is no noticable difference because the table this value is looked up
    // on is filled with 0x6
    u8 badly_poisoned_damage_count;
    undefined field_0xc3;
    u8 freeze; // 0xc4 / 0x1B: STATUS_FROZEN if 1
    undefined field_0xc5;
    undefined field_0xc6;
    undefined field_0xc7;
    // 0xC8 / 0x1F: Controls the animation that plays when taking damage from the constriction status.
    // For some reason this is initalized to 0x22 (34)? Which is the animation used by
    // the exclusive item Nether Veil.
    u32 constriction_animation;
    u8 freeze_turns; // 0xCC / 0x23: Turns left for the status in statuses::freeze
    // 0xCD / 0x24: Turns left until residual damage for the status in statuses::freeze, if applicable
    u8 freeze_damage_countdown;
    undefined field_0xCE;
    undefined field_0xCF;
    u8 cringe;         // 0xD0 / 0x27: STATUS_CRINGE if 1
    u8 cringe_turns;   // 0xD1 / 0x28: Turns left for the status in statuses::cringe
    u8 bide;           // 0xD2 / 0x29: STATUS_BIDE if 1
    u8 bide_turns;     // 0xD3 / 0x2A: Turns left for the status in statuses::bide
    u8 bide_move_slot; // 0xD4 / 0x2B: Slot in the user's move list
    u8 reflect;        // 0xD5 / 0x2C: STATUS_REFLECT if 1
    u8 reflect_turns;  // 0xD6 / 0x2D: Turns left for the status in statuses::reflect
    // 0xD7 / 0x2E: Turns left until residual healing for the status in statuses::reflect, if applicable
    u8 reflect_damage_countdown;
    u8 curse; // 0xD8 / 0x2F: STATUS_CURSED if 1
    // 0xD9 / 0x30: Set to monster::is_not_team_member of the attacker (the one causing the decoy status).
    u8 curse_applier_non_team_member_flag;
    // 0xDA / 0x31: Set to 1 on a Pokemon when inflicted with the Decoy status.
    undefined unk_decoy_tracker;
    u8 curse_turns; // 0xDB / 0x32: Turns left for the status in statuses::curse
    // 0xDC / 0x33: Turns left until residual damage for the status in statuses::curse, if applicable
    u8 curse_damage_countdown;
    undefined field_0xdd;
    undefined field_0xde;
    undefined field_0xdf;
    u8 leech_seed; // 0xE0 / 0x37: STATUS_LEECH_SEED if 1
    undefined field_0xe1;
    undefined field_0xe2;
    undefined field_0xe3;
    // 0xE4 / 0x3B: Used to track the statuses::statuses_unique_id of the relevant monster for
    // statuses like Leech Seed and Destiny Bond.
    u32 statuses_applier_id;
    // 0xE8 / 0x3F: Index into entity_table_hdr::monster_slot_ptrs in the dungeon that the user
    // (drainer) is held.
    u8 leech_seed_source_monster_index;
    u8 leech_seed_turns; // 0xE9 / 0x40: Turns left for the status in statuses::leech_seed
    // 0xEA / 0x41: Turns left until residual damage for the status in statuses::leech_seed, if applicable.
    // Behaves weirdly without an afflictor
    u8 leech_seed_damage_countdown;
    undefined field_0xEB;
    u8 sure_shot;         // 0xEC / 0x43: STATUS_SURE_SHOT if 1
    u8 sure_shot_turns;   // 0xED / 0x44: Turns left for the status in statuses::sure_shot
    u8 long_toss;         // 0xEE / 0x45: STATUS_LONG_TOSS if 1
    u8 invisible;         // 0xEF / 0x46: STATUS_INVISIBLE if 1
    u8 invisible_turns;   // 0xF0 / 0x47: Turns left for the status in statuses::invisible
    u8 blinded;           // 0xF1 / 0x48: STATUS_BLINKER if 1
    u8 blinded_turns;     // 0xF2 / 0x49: Turns left for the status in statuses::blinded
    u8 muzzled;           // 0xF3 / 0x4A: STATUS_MUZZLED if 1
    u8 muzzled_turns;     // 0xF4 / 0x4B: Turns left for the status in statuses::muzzled
    u8 miracle_eye;       // 0xF5 / 0x4C: STATUS_MIRACLE_EYE if 1
    u8 miracle_eye_turns; // 0xF6 / 0x4D: Turns left for the status in statuses::miracle_eye
    u8 magnet_rise;       // 0xF7 / 0x4E: STATUS_MAGNET_RISE if 1
    u8 magnet_rise_turns; // 0xF8 / 0x4F: Turns left for the status in statuses::magnet_rise
    bool power_ears;           // 0xF9 / 0x50: STATUS_POWER_EARS
    bool scanning;             // 0xFA / 0x51: STATUS_SCANNING
    bool stair_spotter;        // 0xFB / 0x52: STATUS_STAIR_SPOTTER
    // 0xFC / 0x53: Set when initally spawning a team member with the ability Pickup.
    bool pickup_flag;
    bool grudge;       // 0xFD / 0x54: STATUS_GRUDGE
    bool exposed;      // 0xFE / 0x55: STATUS_EXPOSED (Foresight/Odor Sleuth)
    bool type_changed; // 0xFF / 0x56: Flag for if the monster's type has been changed
    bool boss_flag;    // 0x100 / 0x57: Seems to be true for boss monsters
    // 0x101 / 0x58: Appears to be a flag for when a monster increasces their speed. Maybe only used
    // by the RunLeaderTurn function to know if the leader has changed their speed stage partway
    // through the function?
    undefined unk_sped_up_tracker;
    // 0x102 / 0x59: Maybe related to being a team member and new recruit? Set to 1 in TryRecruit
    // and 0 in SpawnTeam. Also checked in EnemyEvolution to be 0 before evolving. Maybe to
    // prevent a recently recruited ally from evolving after and or to add a monster to the
    // assembly after the completion of a dungeon?
    undefined field_0x102;
#ifndef JAPAN
    // 0x103 / 0x5A: Possibly a flag while in action. Could also be a flag to cause the burn from
    // lava, heal a burn from water, and decrease hunger in the walls.
    bool in_action;
#endif
    // 0x104 / 0x5B: STATUS_TERRIFIED, interestingly, appears to use 0x1 for the Foe-Fear Orb but
    // 0x2 for the ability Stench. The distinction only seems to exist for the game to use
    // a special message for when terrified from stench ends.
    u8 terrified;
    u8 terrified_turns;   // 0x105 / 0x5C: Turns left for the terrified status
    u8 perish_song_turns; // 0x106 / 0x5D: Turns left before Perish Song takes effect
    // 0x107 / 0x5E: Increases progressively while the No-Slip Cap is held. Capped at 0x13
    // Used to calculate the chance of an item becoming sticky, resets to 0 when that happens
    u8 no_slip_cap_counter;
    // 0x108 / 0x5F: Determines how much experience the monster will reward after being defeated
    // 0 = 0.5x, 1 = 1.0x, 2 = 1.5x
    u8 exp_yield;
    // 0x109 / 0x60: Appears to be set when the held item of the monster is going to be used?
    bool unk_item_use_action;
    // 0x10A / 0x61: Is initalized to 0x63 (99). Changing it from this value causes the monster to
    // begin rendering differently? For example, it causes entity::0xB3 to be 1 and forces
    // entity::0x28 to be 0.
    undefined field_0x10a;
    // 0x10B / 0x62: Flag for two-turn moves that haven't concluded yet. This is also a graphical flag.
    // A value of 1 mean "high up" (Fly/Bounce). A value of 2 means some other condition like
    // Dig, Shadow Force, etc. Other values are treated as invalid. Also used for the move
    // Seismic Toss when throwing up the target.
    u8 two_turn_move_invincible;
    // 0x10C / 0x63: Related to handling AI when a decoy is present on the floor?
    // Seems to only be 0, 1, 2
    undefined decoy_ai_tracker;
#ifndef JAPAN
    undefined field_0x10d;
    undefined field_0x10e;
    undefined field_0x10f;
#endif
    // 0x110 / 0x67: 1 means normal. 0 means half speed. 2, 3, and 4 mean 2x, 3x, and 4x speed.
    int speed_stage;
    // Each counter ticks down to 0 turn by turn. The current speed_stage is calculated as:
    // min(max({# nonzero speed_up_counters} - {# nonzero speed_down_counters}, 0), 4)
    u8 speed_up_counters[5];   // 0x114 / 0x6B
    u8 speed_down_counters[5]; // 0x119 / 0x70
    u8 stockpile_stage;        // 0x11E / 0x75: Goes from 0-3. STATUS_STOCKPILING if nonzero


    undefined field_0x11f;
    // 0x120: If zero, when the monster is standing in a room, the AI will make it head towards a
    // random exit. If nonzero, the monster will instead move in a random direction every turn.
    int random_movement;
    struct move moves[4]; // 0x124
    u8 move_flags;   // 0x144: 1-byte bitfield
    undefined field_0x145;
    struct fixed_point belly;         // 0x146
    struct fixed_point max_belly;     // 0x14A:
    // 0x14E: If true and the monster is an ally, the AI will skip it. False for enemies.
    bool ai_ally_skip;
    bool ai_next_to_target; // 0x14F: This NPC monster is next to its current target
    // 0x150: Set if monster::is_team_leader is true and belly is empty.
    bool famished;
    undefined field_0x151;
    // 0x152: Seems to be true if the monster has already acted this turn: attacked, used an item,
    // or seemingly anything other than moving/resting. Also true when the monster faints.
    bool already_acted;
    // 0x153: True if this enemy should evolve. It is not enough to set this flag to evolve
    // an enemy monster. You also need to set dungeon::should_enemy_evolve.
    bool should_evolve;
    // 0x154: True if using a charged move. Changed together with statuses::bide.
    bool using_charged_move;
    // 0x155: True if the target attacked a Pokemon that has STATUS_GRUDGE.
    bool hit_grudge_monster;
    undefined field_0x156; // 0 when the monster faints
    undefined field_0x157;
    // 0x158: General-purpose bitflags tracking different bits of volatile state.
    // Together with prev_state_bitflags, this is typically used to determine whether
    // to log a message on a state change.
    u16 state_flags;
    // 0x15A: The previous value of state_bitflags before the last update
    u16 prev_state_flags;
    // 0x15C: Appears to control if flash fire should activate.
    bool apply_flash_fire_boost;
    // 0x15D: Appears to be a counter for how many times rollout has hit. Likely to be able to
    // determine how much extra damage consecutive rollout hits should deal.
    u8 rollout_hit_counter;
    // 0x15E: If true, the monster is warped after completing its move.
    bool memento_warp_flag;
    // 0x15F: If true, the monster's special attack is dropped after the completing its move.
    bool overheat_special_attack_drop_flag;
    // 0x160: If true, the monster's shadow is drawn. This value is initalized to 1 for every
    // monster except Diglett and Dugtrio.
    bool display_shadow;
    // 0x161: If true, prevents giving items to this monster. Might have a broader meaning,
    // such as whether the monster is a guest pokémon.
    bool cannot_give_items;
    // 0x162: Related to using a move and either missing or fainting. Set to 1 right before
    // the function for a move is called and set to 0 (sometimes) in ApplyDamage. Gets set
    // when the monster faints sometimes with field 0x156. When false, causes random
    // outcomes with the monster to fail.
    bool field_0x162;
    // 0x163: Related to controlling the number of attacks per move use. Possibly to account
    // for two-turn moves?
    bool field_0x163;
    bool took_damage_flag; // 0x164: Set after the monster took damage.
    // 0x165: Appears to be some sort of validity check? Where 0 is valid and 1 is invalid.
    // HandleFaint sets this number to 1. Also set to 1 if IsMonsterIdInNormalRange is false.
    bool field_0x165;
    // 0x166: Set after the monster attacks (true if the attack missed, false otherwise). If true
    // when the monster attacks, Practice Swinger will activate.
    bool practice_swinger_flag;
    // 0x167: Set to true when the monster receives a critical hit. If true when the monster
    // attacks, Anger Point will activate. Set to false after the monster attacks.
    bool anger_point_flag;
    undefined field_0x168;
    undefined field_0x169;
    // 0x16A: When not DIR_NONE, monster will turn in the specified direction and
    // its AI will be forced to target the tile next to it in that direction.
    // Used to prevent bosses from turning towards team members the moment the boss fight
    // starts (which would override their intended starting facing direction).
    enum direction_id force_turn : 8;
    undefined field_0x16b;
    undefined field_0x16c;
    undefined field_0x16d;
    undefined field_0x16e;
    undefined field_0x16f;
    // 0x170: Set to make the monster disappear when using the move U-turn.
    bool uturn_hide_monster_flag;
    // 0x171: Some kind of visual flag? Gets set to 0 temporarily when changing Shaymin form
    // or when using the Gone Pebble? Also hardcoded to be set to 0 for monsters that generally
    // tend to float? Otherwise 1?
    bool field_0x171;
    // 0x172: Set when the leader and falling through a pitfall trap.
    bool pitfall_trap_flag_0x172;
    // 0x173: Some kind of visual flag?
    bool field_0x173;
    // 0x174: Set when the leader and falling through a pitfall trap.
    bool pitfall_trap_flag_0x174;
    undefined field_0x175;
    undefined field_0x176;
    // 0x177: Appears to be the direction for using sleep talk? Set to DIR_NONE when awake.
    enum direction_id sleep_talk_direction : 8;
    // 0x178: Appears to be the direction for using snore? Set to DIR_NONE when awake.
    enum direction_id snore_direction : 8;
    // 0x179: Seems to be set to 4 when the monster initally throws something and probably
    // related to direction somehow. Checked in a loop for every monster.
    u8 field_0x179;
    // 0x17A: Somehow related to sprite size?
    undefined field_0x17a;
    // 0x17B: Somehow related to sprite size?
    undefined field_0x17b;
    undefined field_0x17c;
    undefined field_0x17d;
    struct position target_pos; // 0x17E: The AI's target's position on screen
    struct position pixel_pos;  // 0x182: The monster's graphical position on screen?
    undefined field_0x186;
    undefined field_0x187;
    undefined field_0x188;
    undefined field_0x189;
    undefined field_0x18a;
    undefined field_0x18b;
    // 0x18C: Bitflags that cause non-damaging exclusive items to trigger on the
    // attacker after they have completed their move. For example, the Eclipse Robe
    // (Darkrai exclusive item) may afflict attacking enemies with the nightmare
    // status condition. (Only uses first 21 bits).
    u32 exclusive_item_trigger_bitflags;
    // 0x190: Appears to be related to the item name of the exclusive item that
    // caused the effect to trigger.
    s16 field_0x190;
    // 0x192: Bitflags that cause non-damaging abilities to trigger on the attacker
    // after they have completed their move. Abilites like magnet pull, cute charm,
    // static, and flame body. (Only uses first 11 bits). One exception is the move
    // Rapid Spin which sets one of the flags for the user.
    u16 contact_ability_trigger_bitflags;
    undefined field_0x194;
    undefined field_0x195;
    undefined field_0x196;
    undefined field_0x197;
    undefined field_0x198;
    undefined field_0x199;
    undefined field_0x19a;
    undefined field_0x19b;
    struct position pos; // 0x19C: Mirror of the position on the entity struct
    undefined field_0x1a0;
    undefined field_0x1a1;
    undefined field_0x1a2;
    undefined field_0x1a3;
    undefined field_0x1a4;
    undefined field_0x1a5;
    undefined field_0x1a6;
    undefined field_0x1a7;
    undefined field_0x1a8;
    undefined field_0x1a9;
    undefined field_0x1aa;
    undefined field_0x1ab;
    undefined field_0x1ac;
    undefined field_0x1ad;
    undefined field_0x1ae;
    undefined field_0x1af;
    undefined field_0x1b0;
    undefined field_0x1b1;
    undefined field_0x1b2;
    undefined field_0x1b3;
    u16 walk_anim_frames_left; // 0x1B4: Number of frames left in walking animation?
    undefined field_0x1b6;
    undefined field_0x1b7;
    undefined field_0x1b8;
    undefined field_0x1b9;
    undefined field_0x1ba;
    undefined field_0x1bb;
    undefined field_0x1bc;
    undefined field_0x1bd;
    undefined field_0x1be;
    undefined field_0x1bf;
    undefined field_0x1c0;
    undefined field_0x1c1;
    undefined field_0x1c2;
    undefined field_0x1c3;
    undefined field_0x1c4;
    undefined field_0x1c5;
    undefined field_0x1c6;
    undefined field_0x1c7;
    undefined field_0x1c8;
    undefined field_0x1c9;
    undefined field_0x1ca;
    undefined field_0x1cb;
    undefined field_0x1cc;
    undefined field_0x1cd;
    undefined field_0x1ce;
    undefined field_0x1cf;
    undefined field_0x1d0;
    undefined field_0x1d1;
    undefined field_0x1d2;
    undefined field_0x1d3;
    undefined field_0x1d4;
    undefined field_0x1d5;
    undefined field_0x1d6;
    undefined field_0x1d7;
    undefined field_0x1d8;
    undefined field_0x1d9;
    undefined field_0x1da;
    undefined field_0x1db;
    undefined field_0x1dc;
    undefined field_0x1dd;
    undefined field_0x1de;
    undefined field_0x1df;
    undefined field_0x1e0;
    undefined field_0x1e1;
    undefined field_0x1e2;
    undefined field_0x1e3;
    undefined field_0x1e4;
    undefined field_0x1e5;
    undefined field_0x1e6;
    undefined field_0x1e7;
    undefined field_0x1e8;
    undefined field_0x1e9;
    undefined field_0x1ea;
    undefined field_0x1eb;
    undefined field_0x1ec;
    undefined field_0x1ed;
    undefined field_0x1ee;
    undefined field_0x1ef;
    undefined field_0x1f0;
    undefined field_0x1f1;
    undefined field_0x1f2;
    undefined field_0x1f3;
    undefined field_0x1f4;
    undefined field_0x1f5;
    undefined field_0x1f6;
    undefined field_0x1f7;
    undefined field_0x1f8;
    undefined field_0x1f9;
    undefined field_0x1fa;
    undefined field_0x1fb;
    undefined field_0x1fc;
    undefined field_0x1fd;
    undefined field_0x1fe;
    undefined field_0x1ff;
    undefined field_0x200;
    undefined field_0x201;
    undefined field_0x202;
    undefined field_0x203;
    undefined field_0x204;
    undefined field_0x205;
    undefined field_0x206;
    undefined field_0x207;
    undefined field_0x208;
    undefined field_0x209;
    undefined field_0x20a;
    undefined field_0x20b;
    undefined field_0x20c;
    undefined field_0x20d;
    undefined field_0x20e;
    undefined field_0x20f;
    u8 hp_fractional; // 0x210: 200 * fractional_part(HP)
    undefined field_0x211;
    undefined field_0x212;
    undefined field_0x213;
    // 0x214: Somehow related to gaining exp through a joy ribbon. Set to 0 after
    // gaining or losing a level. Also checked and set to 0 when an enemy evolves.
    // Maybe for a specific scenario of leveling up with exp from a joy ribbon?
    u32 unk_exp_tracker;
    // 0x218: Status icons displayed on top of the monster's sprite
    struct status_icon_flags status_icons;
    // 0x220: Seems to be related in some way to shadow size and being a water tileset. So
    // probably controls when the ripple effect when standing on water.
    u8 water_shadow_ripple_tracker;
    // 0x221: Set if the current move being used was copied by Me First
    bool me_first_flag;
    undefined field_0x222;
    undefined field_0x223;
    // Stat boosts from exclusive items with EXCLUSIVE_EFF_STAT_BOOST
    u8 exclusive_item_offense_boosts[2]; // 0x224: {atk, sp_atk}
    u8 exclusive_item_defense_boosts[2]; // 0x226: {def, sp_def}
    // 0x228: Bitvector. See enum exclusive_item_effect_id for the meaning of each bit
    u32 exclusive_item_effect_flags[5];
    // 0x23C: Initialized to 0. Probably menu related only, seems to be set to true through the
    // menu.
    bool field_0x23c;
    // 0x23F: When reviving a monster, temporarily set to true. Probably a visual indicator
    // of some kind?
    bool unk_revive_visual_tracker;
    // 0x23E: Gets set to 0 before using an attack and gets set to 1 in LevelUp. Seems to stop
    // the rest of the attacks (ie from Swift Swim) from continuing. Possibly to avoid the
    // the monster leveling up and trying to use a move that was just overwritten by a new move?
    undefined field_0x23e;
    // 0x23F: Gets set to 1 when the move used won't use up any PP. Used to check if the
    // monster should lose extra PP from the ability Pressure.
    bool should_not_lose_pp;
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
    ENTITY_PAD = 0xffffffff, // To Force on 32 bits
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

// Used in menus and the post-dungeon summary.
struct monster_summary {
    enum monster_id id; // 0x0
    u8 monster_name[10];   // 0x2
    undefined field_0xC;
    undefined field_0xD;
    undefined field_0xE;
    undefined field_0xF;
    undefined field_0x10;
    undefined field_0x11;
    undefined field_0x12;
    undefined field_0x13;
    undefined field_0x14;
    undefined field_0x15;
    enum type_id types[2];        // 0x16
    enum ability_id abilities[2]; // 0x18
    enum dungeon_id joined_at;    // 0x1A
    u8 joined_at_floor;          // 0x1B
    struct item held_item;            // 0x1C
    undefined field_0x22;
    undefined field_0x23;
    s32 hp;                    // 0x24: Current HP
    s32 max_hp;                // 0x28: Actual max HP (hp + hp boost)
    u32 level;                // 0x2C
    s32 exp;                       // 0x30
    u8 offensive_stats[2];    // 0x34: {atk, sp_atk}
    u8 defensive_stats[2];    // 0x36: {def, sp_def}
    bool is_team_leader;           // 0x38
    u8 attack_boost;          // 0x39: from things like Power Band, Munch Belt
    u8 special_attack_boost;  // 0x3A
    u8 defense_boost;         // 0x3B
    u8 special_defense_boost; // 0x3C
    undefined field_0x3D;
    s16 iq; // 0x3E
    undefined field_0x40;
    undefined field_0x41;
    // 0x42: Level upon first evolution. Set to 0 in dungeon mode.
    u8 level_at_first_evo;
    // 0x43: Level upon first evolution. Set to 0 in dungeon mode.
    u8 level_at_second_evo;
    // 0x44: Evolution status. In ground_mode, accounts for luminous spring being unlocked.
    u8 evo_status;
    bool inflicted_with_gastro_acid; // 0x45
    undefined field_0x46;
    undefined field_0x47;
    u32 iq_skill_flags[3]; // 0x48
    enum tactic_id tactic;  // 0x54
    undefined field_0x55;
    undefined field_0x56;
    undefined field_0x57;
    // 0x58: Appears to be a list of all the currently inflicted statues in their enum form. The
    // last entry (30th) appears to always be STATUS_NONE to serve as a terminator for the list.
    // While in ground mode, it's always filled with STATUS_NONE.
    enum status_id active_statuses[30];
    undefined2 _padding_0x76;
};


#endif //PMDSKY_DUNGEON_MODE_H
