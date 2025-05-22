#ifndef PMDSKY_DUNGEON_MODE_H
#define PMDSKY_DUNGEON_MODE_H

#include "direction.h"
#include "enums.h"
#include "item.h"
#include "move.h"
#include "graphics.h"
#include "util.h"

#define NUM_PICKED_IQ_SKILLS 3
#define MAX_MON_MOVES 4
#define MAX_SPEED_STAGE 4
#define NUM_SPEED_COUNTERS 5

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

// Monster stat modifier info
struct monster_stat_modifiers {
    // Stages go from 0-20 inclusive, with normal being 10
    s16 offensive_stages[2];  // 0x0: {atk, sp_atk}
    s16 defensive_stages[2];  // 0x4: {def, sp_def}
    s16 hit_chance_stages[2]; // 0x8: {accuracy, evasion}
    s16 flash_fire_boost;     // 0xC: can be 0, 1, or 2
    u8 field_0xe;
    u8 field_0xf;
    // Some moves like Screech affect the damage calculation differently than, e.g., Leer
    // 0x10: binary fixed-point (8 fraction bits), {atk, sp_atk}; from Charm, Memento, etc.
    fx32_8 offensive_multipliers[2];
    // 0x18: binary fixed-point (8 fraction bits), {def, sp_def}; from Screech, etc.
    fx32_8 defensive_multipliers[2];
};

// A bitfield where every bit controls one of the icons that can appear on top of a monster's sprite
// to represent status effects. If multiple bits are set, the shown icon cycles through them.
struct status_icon_flags {
    bool8 f_sleepless : 1; // Blue eye blinking yellow
    bool8 f_burn : 1;      // Red flame
    bool8 f_poison : 1;    // White skull
    bool8 f_toxic : 1;     // Purple skull
    bool8 f_confused : 1;  // Yellow birds
    bool8 f_cowering : 1;  // 2 green lines in circle (same as whiffer)
    bool8 f_taunt : 1;     // Fist icon
    bool8 f_encore : 1;    // Blue exclamation mark (same as low HP)
    // Blue shield with white sparks. Also for counter, mini counter, mist,
    // metal burst, aqua ring, and lucky chant
    bool8 f_reflect : 1;
    bool8 f_safeguard : 1;            // Pink shield. Also for mirror coat
    bool8 f_light_screen : 1;         // Golden shield. Also for magic coat
    bool8 f_protect : 1;              // Green shield. Also for mirror move and vital throw
    bool8 f_endure : 1;               // Blue shield with red sparks
    bool8 f_low_hp : 1;               // Blue exclamation mark (same as encore)
    bool8 f_curse : 1;                // Red skull
    bool8 f_embargo : 1;              // Yellow exclamation mark. Also for gastro acid and snatch
    bool8 f_sure_shot : 1;            // Blue sword blinking yellow
    bool8 f_whiffer : 1;              // 2 green lines in circle (same as cowering)
    bool8 f_set_damage : 1;           // Blue sword blinking red
    bool8 f_focus_energy : 1;         // Red sword blinking yellow
    bool8 f_blinded : 1;              // Blue eye with an X
    bool8 f_cross_eyed : 1;           // Blue question mark
    bool8 f_eyedrops : 1;             // Blue eye blinking yellow with a circular wave
    bool8 f_muzzled : 1;              // Blinking red cross
    bool8 f_grudge : 1;               // Purple shield
    bool8 f_exposed : 1;              // Blue eye blinking red with a circular wave
    bool8 f_sleep : 1;                // Red Z's
    bool8 f_lowered_stat : 1;         // Yellow arrow pointing down
    bool8 f_heal_block : 1;           // Blinking green cross
    bool8 f_miracle_eye : 1;          // Blinking orange cross
    bool8 f_red_exclamation_mark : 1; // Probably unused
    bool8 f_magnet_rise : 1;          // Purple arrow pointing up

    // The following 4 bytes appear to have a different meaning, maybe they are intended to
    // represent icons that are always displayed and do not cycle (inferred from the difference
    // between the ice block and the other icons). Except for the first bit, the others do not
    // seem to have an effect, but the code stores the full 4 bytes as a bitwise OR of some of the
    // flags (see UpdateStatusIconBitfield).
    bool8 f_freeze : 1; // Ice block
    u8 flags_unk2 : 7;
    u8 field_0x5;
    u8 field_0x6;
    u8 field_0x7;
};

// Stores a parameter for an action taken by a monster
struct action_parameter {
    // 0x0: Metadata for the action.
    // E.g., this is the monster index when taking an action on a monster, the move index when
    // using a move or a union item_index value when using an item.
    u8 action_use_idx;
    struct position item_pos; // 0x2: Position of the item to use when using an item on the floor
};

// Contains data used to describe an action taken by a monster.
struct action_data {
    enum action action_id;      // 0x0: Action ID
    u8 direction; // 0x2: Direction in which the action will be performed
    u8 field_0x3;
    struct action_parameter action_parameters[2]; // 0x4: Parameters for the action
    // 0x10: Position of the target that the Pokémon wants throw an item at.
    struct position item_target_position;
};

struct sleep_class_status {
    // 0x0: If non-zero, the corresponding status in status_sleep_id is active.
    enum status_sleep_id sleep;
    u8 sleep_turns; // 0x1: Turns left for the status in statuses::sleep
};

struct burn_class_status
{
    enum status_burn_id burn; // 0x0: STATUS_BURN if 1
    u8 burn_turns; // 0x1: Turns left for the status in statuses::burn
    // 0x2: Turns left until residual damage for the status in statuses::burn, if applicable
    u8 burn_damage_countdown;
    // 0x3: The number of times the statuses::burn_damage_countdown has reached 0. Only used
    // when badly poisoned. Determines how much damage the badly poisoned status condition
    // will deal. There is no noticable difference because the table this value is looked up
    // on is filled with 0x6
    u8 badly_poisoned_damage_count;
};

struct frozen_class_status {
    // 0x0: If non-zero, the corresponding status in status_frozen_id is active.
    enum status_frozen_id freeze;
    // 0x4: Controls the animation that plays when taking damage from the constriction status.
    // For some reason this is initalized to 0x22 (34)? Which is the animation used by
    // the exclusive item Nether Veil.
    u32 constriction_animation;
    u8 freeze_turns; // 0x8: Turns left for the status in statuses::freeze
    // 0x9: Turns left until residual damage for the status in statuses::freeze, if applicable
    u8 freeze_damage_countdown;
};

struct cringe_class_status {
    // 0x0: If non-zero, the corresponding status in status_cringe_id is active.
    enum status_cringe_id cringe;
    u8 cringe_turns;   // 0x1: Turns left for the status in statuses::cringe
};

struct bide_class_status {
    // 0x0: If non-zero, the corresponding status in status_two_turn_id is active.
    enum status_two_turn_id bide;
    u8 bide_turns;     // 0x1: Turns left for the status in statuses::bide
    u8 bide_move_slot; // 0x2: Slot in the user's move list
};

struct reflect_class_status {
    enum status_reflect_id reflect;        // 0x0: STATUS_REFLECT if 1
    u8 reflect_turns;  // 0x1: Turns left for the status in statuses::reflect
    // 0x2: Turns left until residual healing for the status in statuses::reflect, if applicable
    u8 reflect_damage_countdown;
};

struct curse_class_status {
    // 0x0: If non-zero, the corresponding status in status_curse_id is active.
    enum status_curse_id curse;
    // 0x1: Set to monster::is_not_team_member of the attacker (the one causing the decoy status).
    u8 curse_applier_non_team_member_flag;
    // 0x2: Set to 1 on a Pokemon when inflicted with the Decoy status.
    u8 dec;
    u8 curse_turns; // 0x3: Turns left for the status in statuses::curse
    // 0x4: Turns left until residual damage for the status in statuses::curse, if applicable
    u8 curse_damage_countdown;
};

struct leech_seed_class_status {
    enum status_leech_seed_id leech_seed; // 0x0: STATUS_LEECH_SEED if 1
    // 0x4: Used to track the statuses::statuses_unique_id of the relevant monster for
    // statuses like Leech Seed and Destiny Bond.
    u32 statuses_applier_id;
    // 0x8: Index into entity_table_hdr::monster_slot_ptrs in the dungeon that the user
    // (drainer) is held.
    u8 leech_seed_source_monster_index;
    u8 leech_seed_turns; // 0x9: Turns left for the status in statuses::leech_seed
    // 0xA: Turns left until residual damage for the status in statuses::leech_seed, if applicable.
    // Behaves weirdly without an afflictor
    u8 leech_seed_damage_countdown;
};

struct sure_shot_class_status {
    enum status_sure_shot_id sure_shot;         // 0x0: STATUS_SURE_SHOT if 1
    u8 sure_shot_turns;   // 0x1: Turns left for the status in statuses::sure_shot
};

struct long_toss_class_status {
    enum status_long_toss_id status; // 0x0: STATUS_LONG_TOSS if 1
};

struct invisible_class_status
{
    enum status_invisible_id status; // 0x0: STATUS_INVISIBLE if 1
    u8 turns; // 0x1: Turns left for the status in statuses::invisible
};

struct blinker_class_status {
    enum status_blinker_id blinded;           // 0x0: STATUS_BLINKER if 1
    u8 blinded_turns;     // 0x1: Turns left for the status in statuses::blinded
};

struct iq_skill_flags
{
    u32 flags[NUM_PICKED_IQ_SKILLS]; /* 0x0 */
};

struct moves
{
    struct move moves[MAX_MON_MOVES]; // 0x0
    u8 struggle_move_flags; // 0x18
};

// Monster info
struct monster {
    // 0x0: flags: 2-byte bitfield
    u16 flags;

    s16 id;          // 0x2:
    s16 apparent_id; // 0x4: What's outwardly displayed if Transformed
    bool8 is_not_team_member; // 0x6: true for enemies and allied NPCs that aren't on the team
    bool8 is_team_leader;     // 0x7
    // 0x8: An ally is an NPC that isn't a normal team member, e.g. for story boss battles
    bool8 is_ally;
    enum shopkeeper_mode shopkeeper; // 0x9
    u8 level;                       // 0xA
    u8 field_0xb;
    s16 team_index;  // 0xC: In order by team lineup
    s16 iq;          // 0xE
    s16 hp;          // 0x10: Current HP
    s16 max_hp_stat; // 0x12: Add to max_hp_boost for the actual max HP
    u8 field_0x14;
    u8 field_0x15;
    s16 max_hp_boost; // 0x16: From Life Seeds, Sitrus Berries, etc.
    u8 field_0x18;
    u8 field_0x19;
    u8 offensive_stats[2]; // 0x1A: {atk, sp_atk}
    u8 defensive_stats[2]; // 0x1C: {def, sp_def}
    u8 field_0x1e;
    u8 field_0x1f;
    s32 exp;                                      // 0x20: Total Exp. Points
    struct monster_stat_modifiers stat_modifiers; // 0x24
    s16 hidden_power_base_power;              // 0x44
    enum type_id hidden_power_type : 8;           // 0x46
    u8 field_0x47;
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
    u8 field_0x7a;
    u8 field_0x7b;
    enum ai_objective ai_objective : 8; // 0x7C
    bool8 ai_not_next_to_target;         // 0x7D: This NPC monster is not next to its current target
    bool8 ai_targeting_enemy;            // 0x7E: This NPC monster is targeting an enemy monster
    bool8 ai_turning_around;             // 0x7F: This NPC monster has decided to turn around
    // 0x80: entity::spawn_genid of the entity currently being targeted
    u16 ai_target_spawn_genid;
    u8 field_0x82;
    u8 field_0x83;
    struct entity* ai_target; // 0x84: Current or most recent AI target
    u8 field_0x88;
    u8 field_0x89;
    u8 field_0x8a;
    u8 field_0x8b;
    struct position ai_target_pos; // 0x8C: Position of the entity currently being targeted
    // 0x90: Work array while updating skills in the menu. Same meaning as iq_skill_flags.
    struct iq_skill_flags iq_skill_menu_flags;
    // 0x9C: First 9 bytes contain bitfield data; the rest is presumably padding.
    // Bitvector. See enum iq_skill_id for the meaning of each bit.
    struct iq_skill_flags iq_skill_flags;
    enum tactic_id tactic; // 0xA8

    // 0xA9
    bool8 roost;
    // 0xAA: The typing in entity::types before the flying type is removed for statuses::roost
    // and restored to entity::types after statuses::roost ends.
    enum type_id original_types[2];
    // 0xAC: The move id to be used if statuses::bide is 1.
    u8 bide_move_id;
    u8 field_0xad;
    u8 field_0xae;
    u8 field_0xaf;
    // 0xB0: Unique number given to the monster when spawning to differentiate it from other
    // monsters and to properly keep track of a monster. Likely used because a monster could be
    // spawned into the same slot as an old monster and using a pointer alone could cause some
    // issues. Used for Leech Seed, Destiny Bond, Storm Drain, Lightning Rod (probably more).
    u32 unique_id;
    // 0xB4: Unique number between the wrapped and wrapping target to connect them.
    u32 wrap_pair_unique_id;
    // 0xB8: Tracks the damage taken to deal when bide status ends. Max 0x3E7 (999).
    u32 bide_damage_tally;
    enum monster_behavior monster_behavior : 8; // 0xBC
    struct sleep_class_status sleep_class_status; // 0xBD
    struct burn_class_status burn_class_status; // 0xBF
    struct frozen_class_status frozen_class_status; // 0xC4
    struct cringe_class_status cringe_class_status; // 0xD0
    struct bide_class_status bide_class_status; // 0xD2
    struct reflect_class_status reflect_class_status; // 0xD5
    struct curse_class_status curse_class_status; // 0xD8
    struct leech_seed_class_status leech_seed_class_status; // 0xE0
    struct sure_shot_class_status sure_shot_class_status; // 0xEC
    struct long_toss_class_status long_toss_class_status; // 0xEE
    struct invisible_class_status invisible_class_status; // 0xEF
    struct blinker_class_status blinker_class_status; // 0xF1
    u8 muzzled;           // 0xF3: STATUS_MUZZLED if 1
    u8 muzzled_turns;     // 0xF4: Turns left for the status in statuses::muzzled
    u8 miracle_eye;       // 0xF5: STATUS_MIRACLE_EYE if 1
    u8 miracle_eye_turns; // 0xF6: Turns left for the status in statuses::miracle_eye
    u8 magnet_rise;       // 0xF7: STATUS_MAGNET_RISE if 1
    u8 magnet_rise_turns; // 0xF8: Turns left for the status in statuses::magnet_rise
    bool8 power_ears;           // 0xF9: STATUS_POWER_EARS
    bool8 scanning;             // 0xFA: STATUS_SCANNING
    bool8 stair_spotter;        // 0xFB: STATUS_STAIR_SPOTTER
    // 0xFC: Set when initally spawning a team member with the ability Pickup.
    bool8 pickup_flag;
    bool8 grudge;       // 0xFD: STATUS_GRUDGE
    bool8 exposed;      // 0xFE: STATUS_EXPOSED (Foresight/Odor Sleuth)
    bool8 type_changed; // 0xFF: Flag for if the monster's type has been changed
    bool8 boss_flag;    // 0x100: Seems to be true for boss monsters
    // 0x101: Appears to be a flag for when a monster increasces their speed. Maybe only used
    // by the RunLeaderTurn function to know if the leader has changed their speed stage partway
    // through the function?
    u8 unk_sped_up_tracker;
    // 0x102: Maybe related to being a team member and new recruit? Set to 1 in TryRecruit
    // and 0 in SpawnTeam. Also checked in EnemyEvolution to be 0 before evolving. Maybe to
    // prevent a recently recruited ally from evolving after and or to add a monster to the
    // assembly after the completion of a dungeon?
    u8 field_0x102;
#ifndef JAPAN
    // 0x103: Possibly a flag while in action. Could also be a flag to cause the burn from
    // lava, heal a burn from water, and decrease hunger in the walls.
    bool8 in_action;
#endif
    // 0x104: STATUS_TERRIFIED, interestingly, appears to use 0x1 for the Foe-Fear Orb but
    // 0x2 for the ability Stench. The distinction only seems to exist for the game to use
    // a special message for when terrified from stench ends.
    u8 terrified;
    u8 terrified_turns;   // 0x105: Turns left for the terrified status
    u8 perish_song_turns; // 0x106: Turns left before Perish Song takes effect
    // 0x107: Increases progressively while the No-Slip Cap is held. Capped at 0x13
    // Used to calculate the chance of an item becoming sticky, resets to 0 when that happens
    u8 no_slip_cap_counter;
    // 0x108: Determines how much experience the monster will reward after being defeated
    // 0 = 0.5x, 1 = 1.0x, 2 = 1.5x
    u8 exp_yield;
    // 0x109: Appears to be set when the held item of the monster is going to be used?
    bool8 use_held_item;
    // 0x10A: Is initalized to 0x63 (99). Changing it from this value causes the monster to
    // begin rendering differently? For example, it causes entity::0xB3 to be 1 and forces
    // entity::0x28 to be 0.
    u8 field_0x10a;
    // 0x10B: Flag for two-turn moves that haven't concluded yet. This is also a graphical flag.
    // A value of 1 mean "high up" (Fly/Bounce). A value of 2 means some other condition like
    // Dig, Shadow Force, etc. Other values are treated as invalid. Also used for the move
    // Seismic Toss when throwing up the target.
    u8 two_turn_move_invincible;
    // 0x10C: Related to handling AI when a decoy is present on the floor?
    // Seems to only be 0, 1, 2
    u8 decoy_ai_tracker;
#ifndef JAPAN
    u8 field_0x10d;
    u8 field_0x10e;
    u8 field_0x10f;
#endif
    // 0x110: 1 means normal. 0 means half speed. 2, 3, and 4 mean 2x, 3x, and 4x speed.
    s32 speed_stage;
    // Each counter ticks down to 0 turn by turn. The current speed_stage is calculated as:
    // min(max({# nonzero speed_up_counters} - {# nonzero speed_down_counters}, 0), 4)
    u8 speed_up_counters[5];   // 0x114
    u8 speed_down_counters[5]; // 0x119
    u8 stockpile_stage;        // 0x11E: Goes from 0-3. STATUS_STOCKPILING if nonzero


    u8 field_0x11f;
    // 0x120: If zero, when the monster is standing in a room, the AI will make it head towards a
    // random exit. If nonzero, the monster will instead move in a random direction every turn.
    s32 random_movement;
    struct moves moves; // 0x124
    struct fixed_point belly;         // 0x146
    struct fixed_point max_belly;     // 0x14A:
    // 0x14E: If true and the monster is an ally, the AI will skip it. False for enemies.
    bool8 ai_ally_skip;
    bool8 ai_next_to_target; // 0x14F: This NPC monster is next to its current target
    // 0x150: Set if monster::is_team_leader is true and belly is empty.
    bool8 famished;
    bool8 waiting;
    // 0x152: Seems to be true if the monster has already acted this turn: attacked, used an item,
    // or seemingly anything other than moving/resting. Also true when the monster faints.
    bool8 already_acted;
    // 0x153: True if this enemy should evolve. It is not enough to set this flag to evolve
    // an enemy monster. You also need to set dungeon::should_enemy_evolve.
    bool8 should_evolve;
    // 0x154: True if using a charged move. Changed together with statuses::bide.
    bool8 using_charged_move;
    // 0x155: True if the target attacked a Pokemon that has STATUS_GRUDGE.
    bool8 hit_grudge_monster;
    u8 field_0x156; // 0 when the monster faints
    u8 field_0x157;
    // 0x158: General-purpose bitflags tracking different bits of volatile state.
    // Together with prev_state_bitflags, this is typically used to determine whether
    // to log a message on a state change.
    u16 state_flags;
    // 0x15A: The previous value of state_bitflags before the last update
    u16 prev_state_flags;
    // 0x15C: Appears to control if flash fire should activate.
    bool8 apply_flash_fire_boost;
    // 0x15D: Appears to be a counter for how many times rollout has hit. Likely to be able to
    // determine how much extra damage consecutive rollout hits should deal.
    u8 rollout_hit_counter;
    // 0x15E: If true, the monster is warped after completing its move.
    bool8 memento_warp_flag;
    // 0x15F: If true, the monster's special attack is dropped after the completing its move.
    bool8 overheat_special_attack_drop_flag;
    // 0x160: If true, the monster's shadow is drawn. This value is initalized to 1 for every
    // monster except Diglett and Dugtrio.
    bool8 display_shadow;
    // 0x161: If true, prevents giving items to this monster. Might have a broader meaning,
    // such as whether the monster is a guest pokémon.
    bool8 cannot_give_items;
    // 0x162: Related to using a move and either missing or fainting. Set to 1 right before
    // the function for a move is called and set to 0 (sometimes) in ApplyDamage. Gets set
    // when the monster faints sometimes with field 0x156. When false, causes random
    // outcomes with the monster to fail.
    bool8 field_0x162;
    // 0x163: Related to controlling the number of attacks per move use. Possibly to account
    // for two-turn moves?
    bool8 field_0x163;
    bool8 took_damage_flag; // 0x164: Set after the monster took damage.
    // 0x165: Appears to be some sort of validity check? Where 0 is valid and 1 is invalid.
    // HandleFaint sets this number to 1. Also set to 1 if IsMonsterIdInNormalRange is false.
    bool8 field_0x165;
    // 0x166: Set after the monster attacks (true if the attack missed, false otherwise). If true
    // when the monster attacks, Practice Swinger will activate.
    bool8 practice_swinger_flag;
    // 0x167: Set to true when the monster receives a critical hit. If true when the monster
    // attacks, Anger Point will activate. Set to false after the monster attacks.
    bool8 anger_point_flag;
    u8 field_0x168;
    u8 field_0x169;
    // 0x16A: When not DIR_NONE, monster will turn in the specified direction and
    // its AI will be forced to target the tile next to it in that direction.
    // Used to prevent bosses from turning towards team members the moment the boss fight
    // starts (which would override their intended starting facing direction).
    enum direction_id force_turn : 8;
    u8 field_0x16b;
    u8 field_0x16c;
    u8 field_0x16d;
    u8 field_0x16e;
    u8 field_0x16f;
    // 0x170: Set to make the monster disappear when using the move U-turn.
    bool8 uturn_hide_monster_flag;
    // 0x171: Some kind of visual flag? Gets set to 0 temporarily when changing Shaymin form
    // or when using the Gone Pebble? Also hardcoded to be set to 0 for monsters that generally
    // tend to float? Otherwise 1?
    bool8 field_0x171;
    // 0x172: Set when the leader and falling through a pitfall trap.
    bool8 pitfall_trap_flag_0x172;
    // 0x173: Some kind of visual flag?
    bool8 field_0x173;
    // 0x174: Set when the leader and falling through a pitfall trap.
    bool8 pitfall_trap_flag_0x174;
    u8 field_0x175;
    u8 field_0x176;
    // 0x177: Appears to be the direction for using sleep talk? Set to DIR_NONE when awake.
    enum direction_id sleep_talk_direction : 8;
    // 0x178: Appears to be the direction for using snore? Set to DIR_NONE when awake.
    enum direction_id snore_direction : 8;
    // 0x179: Seems to be set to 4 when the monster initally throws something and probably
    // related to direction somehow. Checked in a loop for every monster.
    u8 field_0x179;
    // 0x17A: Somehow related to sprite size?
    u8 field_0x17a;
    // 0x17B: Somehow related to sprite size?
    u8 field_0x17b;
    u8 field_0x17c;
    u8 field_0x17d;
    struct position target_pos; // 0x17E: The AI's target's position on screen
    struct position pixel_pos;  // 0x182: The monster's graphical position on screen?
    u8 field_0x186;
    u8 field_0x187;
    u8 field_0x188;
    u8 field_0x189;
    u8 field_0x18a;
    u8 field_0x18b;
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
    u8 field_0x194;
    u8 field_0x195;
    u8 field_0x196;
    u8 field_0x197;
    u8 field_0x198;
    u8 field_0x199;
    u8 field_0x19a;
    u8 field_0x19b;
    struct position pos; // 0x19C: Mirror of the position on the entity struct
    u8 field_0x1a0;
    u8 field_0x1a1;
    u8 field_0x1a2;
    u8 field_0x1a3;
    u8 field_0x1a4;
    u8 field_0x1a5;
    u8 field_0x1a6;
    u8 field_0x1a7;
    u8 field_0x1a8;
    u8 field_0x1a9;
    u8 field_0x1aa;
    u8 field_0x1ab;
    u8 field_0x1ac;
    u8 field_0x1ad;
    u8 field_0x1ae;
    u8 field_0x1af;
    u8 field_0x1b0;
    u8 field_0x1b1;
    u8 field_0x1b2;
    u8 field_0x1b3;
    u16 walk_anim_frames_left; // 0x1B4: Number of frames left in walking animation?
    u8 field_0x1b6;
    u8 field_0x1b7;
    u8 field_0x1b8;
    u8 field_0x1b9;
    u8 field_0x1ba;
    u8 field_0x1bb;
    u8 field_0x1bc;
    u8 field_0x1bd;
    u8 field_0x1be;
    u8 field_0x1bf;
    u8 field_0x1c0;
    u8 field_0x1c1;
    u8 field_0x1c2;
    u8 field_0x1c3;
    u8 field_0x1c4;
    u8 field_0x1c5;
    u8 field_0x1c6;
    u8 field_0x1c7;
    u8 field_0x1c8;
    u8 field_0x1c9;
    u8 field_0x1ca;
    u8 field_0x1cb;
    u8 field_0x1cc;
    u8 field_0x1cd;
    u8 field_0x1ce;
    u8 field_0x1cf;
    u8 field_0x1d0;
    u8 field_0x1d1;
    u8 field_0x1d2;
    u8 field_0x1d3;
    u8 field_0x1d4;
    u8 field_0x1d5;
    u8 field_0x1d6;
    u8 field_0x1d7;
    u8 field_0x1d8;
    u8 field_0x1d9;
    u8 field_0x1da;
    u8 field_0x1db;
    u8 field_0x1dc;
    u8 field_0x1dd;
    u8 field_0x1de;
    u8 field_0x1df;
    u8 field_0x1e0;
    u8 field_0x1e1;
    u8 field_0x1e2;
    u8 field_0x1e3;
    u8 field_0x1e4;
    u8 field_0x1e5;
    u8 field_0x1e6;
    u8 field_0x1e7;
    u8 field_0x1e8;
    u8 field_0x1e9;
    u8 field_0x1ea;
    u8 field_0x1eb;
    u8 field_0x1ec;
    u8 field_0x1ed;
    u8 field_0x1ee;
    u8 field_0x1ef;
    u8 field_0x1f0;
    u8 field_0x1f1;
    u8 field_0x1f2;
    u8 field_0x1f3;
    u8 field_0x1f4;
    u8 field_0x1f5;
    u8 field_0x1f6;
    u8 field_0x1f7;
    u8 field_0x1f8;
    u8 field_0x1f9;
    u8 field_0x1fa;
    u8 field_0x1fb;
    u8 field_0x1fc;
    u8 field_0x1fd;
    u8 field_0x1fe;
    u8 field_0x1ff;
    u8 field_0x200;
    u8 field_0x201;
    u8 field_0x202;
    u8 field_0x203;
    u8 field_0x204;
    u8 field_0x205;
    u8 field_0x206;
    u8 field_0x207;
    u8 field_0x208;
    u8 field_0x209;
    u8 field_0x20a;
    u8 field_0x20b;
    u8 field_0x20c;
    u8 field_0x20d;
    u8 field_0x20e;
    u8 field_0x20f;
    u8 hp_fractional; // 0x210: 200 * fractional_part(HP)
    u8 field_0x211;
    u8 field_0x212;
    u8 field_0x213;
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
    bool8 me_first_flag;
    u8 field_0x222;
    u8 field_0x223;
    // Stat boosts from exclusive items with EXCLUSIVE_EFF_STAT_BOOST
    u8 exclusive_item_offense_boosts[2]; // 0x224: {atk, sp_atk}
    u8 exclusive_item_defense_boosts[2]; // 0x226: {def, sp_def}
    // 0x228: Bitvector. See enum exclusive_item_effect_id for the meaning of each bit
    u32 exclusive_item_effect_flags[5];
    // 0x23C: Initialized to 0. Probably menu related only, seems to be set to true through the
    // menu.
    bool8 field_0x23c;
    // 0x23F: When reviving a monster, temporarily set to true. Probably a visual indicator
    // of some kind?
    bool8 unk_revive_visual_tracker;
    // 0x23E: Gets set to 0 before using an attack and gets set to 1 in LevelUp. Seems to stop
    // the rest of the attacks (ie from Swift Swim) from continuing. Possibly to avoid the
    // the monster leveling up and trying to use a move that was just overwritten by a new move?
    u8 field_0x23e;
    // 0x23F: Gets set to 1 when the move used won't use up any PP. Used to check if the
    // monster should lose extra PP from the ability Pressure.
    bool8 should_not_lose_pp;
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
    u8 field_0xC;
    u8 field_0xD;
    u8 field_0xE;
    u8 field_0xF;
    u8 field_0x10;
    u8 field_0x11;
    u8 field_0x12;
    u8 field_0x13;
    u8 field_0x14;
    u8 field_0x15;
    enum type_id types[2];        // 0x16
    enum ability_id abilities[2]; // 0x18
    enum dungeon_id joined_at;    // 0x1A
    u8 joined_at_floor;          // 0x1B
    struct item held_item;            // 0x1C
    u8 field_0x22;
    u8 field_0x23;
    s32 hp;                    // 0x24: Current HP
    s32 max_hp;                // 0x28: Actual max HP (hp + hp boost)
    u32 level;                // 0x2C
    s32 exp;                       // 0x30
    u8 offensive_stats[2];    // 0x34: {atk, sp_atk}
    u8 defensive_stats[2];    // 0x36: {def, sp_def}
    bool8 is_team_leader;           // 0x38
    u8 attack_boost;          // 0x39: from things like Power Band, Munch Belt
    u8 special_attack_boost;  // 0x3A
    u8 defense_boost;         // 0x3B
    u8 special_defense_boost; // 0x3C
    u8 field_0x3D;
    s16 iq; // 0x3E
    u8 field_0x40;
    u8 field_0x41;
    // 0x42: Level upon first evolution. Set to 0 in dungeon mode.
    u8 level_at_first_evo;
    // 0x43: Level upon first evolution. Set to 0 in dungeon mode.
    u8 level_at_second_evo;
    // 0x44: Evolution status. In ground_mode, accounts for luminous spring being unlocked.
    u8 evo_status;
    bool8 inflicted_with_gastro_acid; // 0x45
    u8 field_0x46;
    u8 field_0x47;
    u32 iq_skill_flags[3]; // 0x48
    enum tactic_id tactic;  // 0x54
    u8 field_0x55;
    u8 field_0x56;
    u8 field_0x57;
    // 0x58: Appears to be a list of all the currently inflicted statues in their enum form. The
    // last entry (30th) appears to always be STATUS_NONE to serve as a terminator for the list.
    // While in ground mode, it's always filled with STATUS_NONE.
    enum status_id active_statuses[30];
    u16 _padding_0x76;
};

// Info about a mission destination floor
struct mission_destination_info {
    bool8 is_destination_floor;  // 0x0: Whether or not the current floor is a mission destination
    enum mission_type type; // 0x1:
    // 0x2: The meaning of this field depends on the type field; see union mission_subtype.
    u8 subtype;
    // 0x3: The index of the mission in the job list?
    u8 mission_job_list_idx;
    // 0x4: Item to retrieve, if this is an item-retrieval mission
    enum item_id item_to_retrieve;
    enum item_id item_to_deliver;     // 0x6: Item to deliver to the client, if relevant
    enum item_id special_target_item; // 0x8: For Sealed Chamber and Treasure Memo missions
    enum monster_id client;           // 0xA: The client on the mission listing
    enum monster_id rescue_target;    // 0xC: The monster to be rescued
    // 0xE: Usually just the target to defeat. If an outlaw has minions, the monster IDs will be
    // listed in subsequent entries. Note that there can be multiple minions of the same species,
    // which is not reflected here.
    enum monster_id enemy_species[3];
    u8 n_enemy_species; // 0x14: Length of the preceding array
    u8 field_0x15;
    // 0x16: Fixed room ID of the destination floor, if relevant
    // (e.g., Chambers, Challenge Letters, etc.)
    enum fixed_room_id fixed_room_id;
    // 0x17: Related to missions where you have to obtain an item? Possibly related to the item
    // being picked up and/or destroyed?
    bool8 unk_mission_item_tracker1;
    u8 field_0x18;
    u8 field_0x19;
    // 0x1A: Related to missions where you have to obtain an item? Possibly related to the item
    // being picked up and/or destroyed?
    bool8 unk_mission_item_tracker2;
    // 0x1B: Will be set after the target enemy has been defeated.
    // If there are minions, this flag applies just to the main outlaw.
    bool8 target_enemy_is_defeated;
};

// Contains data about a monster that spawns in a dungeon
struct monster_spawn_entry {
    u16 level_mult_512; // 0x0: Spawn level << 9
    // 0x2: Incremental spawn weight of this entry for normal spawns
    u16 incremental_spawn_weight;
    // 0x4: Incremental spawn weight of this entry for monster house spawns
    u16 incremental_spawn_weight_monster_house;
    // 0x6: Monster id. Depending on where this struct is used, it can have values above 600
    // to list secondary gender entries.
    enum monster_id id;
};

// Dungeon floor properties
struct floor_properties {
    enum floor_layout layout; // 0x0
    // 0x1: Affects the number of rooms to be generated. If it's positive, a slight random variation
    // (between -2 and +1) is applied to the value (the final value must be at least 1). If it's
    // negative, its absolute value is used without adding a random variation.
    s8 room_density;
    u8 tileset; // 0x2
    // 0x3: Indexes into the music ID table in overlay 10 to determine the floor's music track.
    // See the relevant descriptions in the overlay 10 symbols for more information.
    u8 music_table_idx;
    enum weather_id weather; // 0x4
    // 0x5: Controls how many connections will be made between grid cells
    u8 floor_connectivity;
    // 0x6: Controls how many enemies will be spawned. If 0, no enemies will spawn, even as the
    // player walks.
    // The final value will be 0 in the special case that density is 0. Otherwise, the final value
    // will be randomized between density / 2 and density - 1, but no lower than 1.
    // The code seems to imply that the value was meant to be signed, since it contains a section
    // that takes the absolute value of the density while skipping the random variation, similar to
    // room_density.
    u8 enemy_density;
    u8 kecleon_shop_spawn_chance;  // 0x7: Percentage chance from 0-100
    u8 monster_house_spawn_chance; // 0x8: Percentage chance from 0-100
    u8 maze_room_chance;           // 0x9: Percentage chance from 0-100
    u8 sticky_item_chance;         // 0xA
    // 0xB: Whether or not dead ends are allowed in the floor layout. If false, dead ends will be
    // corrected during floor generation (or rather, they should be, but the implementation is
    // buggy)
    bool8 allow_dead_ends;
    // 0xC: Maximum number of secondary structures that can be generated on the floor
    u8 max_secondary_structures;
    // 0xD: room_flags: 1-byte bitfield
    bool8 f_secondary_structures : 1; // Whether secondary structures are allowed
    u8 room_flags_unk1 : 1;
    bool8 f_room_imperfections : 1; // Whether room imperfections are allowed
    u8 room_flags_unk3 : 5;

    u8 field_0xe;
    u8 item_density; // 0xF: Controls how many items will be spawned
    u8 trap_density; // 0x10: Controls how many traps will be spawned
    u8 floor_number; // 0x11: The current floor number within the overall dungeon
    enum fixed_room_id fixed_room_id; // 0x12
    u8 extra_hallways;               // 0x13: Number of extra hallways to generate
    u8 buried_item_density; // 0x14: Controls how many buried items (in walls) will be spawned
    // 0x15: Controls how much secondary terrain (water, lava, and this actually applies to chasms
    // too) will be spawned
    u8 secondary_terrain_density;
    // 0x16: Vision range (in tiles) when standing on a hallway.
    // A value of 0 means no limit, a value > 0 enables darkness on the floor.
    u8 visibility_range;
    u8 max_money_amount_div_5; // 0x17: 1/5 the maximum amount for Poké spawns
    // 0x18: Chance of an item spawning on each tile in a Kecleon shop
    enum shop_item_positions shop_item_positions;
    // 0x19: Chance that a Monster House will be an itemless one
    u8 itemless_monster_house_chance;
    // 0x1A: Values are shifted relative to enum hidden_stairs_type.
    // 0 means HIDDEN_STAIRS_SECRET_BAZAAR, 1 means HIDDEN_STAIRS_SECRET_ROOM, and
    // 255 still means HIDDEN_STAIRS_RANDOM_SECRET_BAZAAR_OR_SECRET_ROOM.
    u8 hidden_stairs_type;
    u8 hidden_stairs_spawn_chance; // 0x1B
    u8 enemy_iq;                   // 0x1C: IQ stat of enemies
    u8 iq_booster_value; // 0x1E: IQ increase from the IQ booster item upon entering the floor
};

// Contains the data required to display a tile on the minimap
struct minimap_display_tile {
    u32 field_0x0;
    u32 field_0x4;
    u32 field_0x8;
    u32 field_0x0C;
    u32 field_0x10;
    u32 field_0x14;
    u32 field_0x18;
    u32 field_0x1C;
    u32 field_0x20;
    u32 field_0x24;
    u32 field_0x28;
    u32 field_0x2C;
    u32 field_0x30;
    u32 field_0x34;
    u32 field_0x38;
    u32 field_0x3C;
};

// Contains the graphical representation of minimap tiles
struct minimap_display_data {
    // 0x0: Matrix that contains tile display data. Each chunk of 4x4 tiles shares
    // a single entry in this matrix. (To calculate which entry corresponds to a
    // given (x,y) coordinate, simply divide both x and y by 2 and drop decimals)
    struct minimap_display_tile tile_matrix_1[16][28];
    // 0x7000: Another matrix just like the first one
    struct minimap_display_tile tile_matrix_2[16][28];
    // 0xE000: Weird byte matrix.
    // The code that initializes this matrix fills 56 bytes
    // per row, which seems like an oversight.
    // On top of that, starting at 0xE1C0 there's a pointer table that gets overwritten every time
    // this matrix is rebuilt, only to be restored later. There's probably
    // an union involved somewhere, but right now there's not enough information
    // to know where exactly.
    u8 field_0xE000[32][28];
    u8 overwritten_extra_bytes[28]; // 0xE380
    u32 field_0xE39C[41];           // 0xE39C: Array of pointers
    u32 field_0xE440;
    u8 field_0xE444;
    u8 field_0xE445;
    u8 field_0xE446;
    u8 field_0xE447;
    u8 field_0xE448;
    // Padding?
    u8 field_0xE449;
    u8 field_0xE44A;
    u8 field_0xE44B;
};

// Struct that seems to hold data related to the map, the camera and the touchscreen numbers
struct display_data {
    struct position camera_pos; // 0x0: Position of the tile the camera is currently pointing to
    // 0x4: Copy of 0x0. Used to detect changes in the camera's position.
    struct position camera_pos_mirror;
    // 0x8: Pixel position of the tile the camera is currently pointing to
    struct position camera_pixel_pos;
    struct position camera_pixel_pos_mirror; // 0xC: Mirror of 0x8
    // 0x10: Entity currently being pointed by the camera, mostly used to
    // control rendering of the dungeon, GUI, minimap, etc.
    struct entity* camera_target;
    // 0x14: Appears to be used to determine the offset to render the screen from normal when
    // shaking.
    u32 screen_shake_offset;
    // 0x18: Appears to be the intensity value for when the screen shakes. Decremented by
    // 0x1 until 0x0.
    u32 screen_shake_intensity;
    // 0x1C: Appears to be the value to set to display_data::screen_shake_intensity when it
    // reaches 0x0. (This number is usually 0x0 so the screen stops shaking after.)
    u32 screen_shake_intensity_reset;
    u8 field_0x20; // 0x20: Initialized to 0x3.
    // 0x21: Same as floor_properties::visibility_range
    // Affects the number of map tiles around the player's position that get marked as
    // "visited" while exploring, as well as how far away you can see enemies under non-illuminated
    // conditions (outside of this range, enemies will not be visible on screen).
    u8 visibility_range;
    // 0x22: True if the pokémon currently pointed by the camera has
    // the status_id::STATUS_BLINKER effect
    bool8 blinded;
    // 0x23: True after using a Luminous Orb or in floors where darkness is forcefully disabled
    bool8 luminous;
    // 0x24: If false and luminous is false as well, darkness will be displayed graphically.
    // This is set in dungeons that aren't naturally dark, and also in some fixed room floors.
    bool8 natural_lighting;
    // 0x25: True if the pokémon currently pointed by the camera has the Map Surveyor IQ skill
    // active
    bool8 map_surveyor;
    // 0x26: True if enemies should be shown on the map.
    // Seems to be a dependent property computed as
    // (leader has Power Ears status OR leader has X-Ray Specs equipped).
    // This is NOT affected by the luminous flag.
    bool8 can_see_enemies;
    // 0x27: True if items are being shown on the map. Similar to can_see_enemies.
    bool8 can_see_items;
    // 0x28: True if traps are being shown on the map. Similar to can_see_enemies.
    bool8 can_see_traps;
    // 0x29: True if the pokémon currently pointed by the camera has the
    // status_id::STATUS_CROSS_EYED effect.
    // Causes all entities to be displayed as green circles on the map.
    bool8 hallucinating;
    bool8 can_see_stairs;  // 0x2A: True if stairs are being shown on the map
    u8 field_0x2B; // 0x2B: Initialized to 0
    u8 field_0x2C;
    bool8 darkness;        // 0x2D: True if there's darkness on the floor
    u8 field_0x2E; // 0x2E: Initialized to 1
    // 0x2F: True if the leader is being pointed by the camera right now. If false, UI digits will
    // be displayed in green.
    bool8 leader_pointed;
    u8 field_0x30; // 0x30: Initialized to 1
    // 0x31: Set to 1 when losing in a dungeon. Seems to cause display_data::0x38 to
    // display_data::leader_max_hp_touch_screen to become 0xFFFF (-1).
    bool8 unk_fade_to_black_tracker;
    u8 field_0x32;   // 0x32: Initialized to 0
    u8 field_0x33;   // 0x33: Initialized to 0
    u8 field_0x34;   // 0x34: Is used, related to lighting?
    bool8 team_menu_or_grid; // 0x35: True when the team menu is opened or while Y is being held
    // Derived from internal direction in leader info block
    enum direction_id leader_target_direction;        // 0x36
    enum direction_id leader_target_direction_mirror; // 0x37
    u16 field_0x38;                                // 0x38: Initialized to 0xFFFF (-1).
    u16 field_0x3A;                                // 0x3A: Initialized to 0xFFFF (-1).
    s16 floor_touch_screen;         // 0x3C: Floor number displayed on the touch screen
    s16 leader_level_touch_screen;  // 0x3E: Leader's level displayed on the touch screen
    s16 leader_hp_touch_screen;     // 0x40: Leader's current HP displayed on the touch screen
    s16 leader_max_hp_touch_screen; // 0x42: Leader's max HP displayed on the touch screen
    u16 field_0x44;
    // Padding?
    u8 field_0x46;
    u8 field_0x47;
};

// Used during floor generation to keep track of what entities should be spawned where
struct spawn_flags {
    bool8 f_stairs : 1;
    bool8 f_item : 1;
    bool8 f_trap : 1;
    bool8 f_monster : 1;
    u8 spawn_flags_unk4 : 4;
    u8 spawn_flags_unk8 : 8;
};

// Used during dungeon play to record the visibility of a tile.
struct visibility_flags {
    // If f_revealed == true and f_visited == false, the tile will appear as gray on the map.
    // This happens, e.g., when a Luminous Orb is used.
    bool8 f_revealed : 1; // Revealed on the map.
    bool8 f_visited : 1;  // Visited by the player
    u8 visibility_flags_unk2 : 6;
    u8 visibility_flags_unk8 : 8;
};

// These flags seem to occupy the same memory location, so the meaning is context-dependent.
union spawn_or_visibility_flags {
    struct spawn_flags spawn;
    struct visibility_flags visibility;
};

// Information about the rooms on the current floor
struct room_data {
    u8 room_id;
    u8 field_0x1;                 // Initialized to 0
    struct position bottom_right_corner; // 0x2
    struct position top_left_corner;     // 0x6
    u8 field_0xa;                 // Doesn't get initialized, likely padding
    u8 field_0xb;                 // Doesn't get initialized, likely padding
    u32 field_0xc;                // Initialized to (bottom_right_corner.x - 1) * 0x1C
    u32 field_0x10;               // Initialized to (bottom_right_corner.y - 1) * 0x1C
    u32 field_0x14;               // Initialized to (top_left_corner.x + 1) * 0x1C
    u32 field_0x18;               // Initialized to (top_left_corner.y + 1) * 0x1C
};

// Tile data
struct tile {
    // 0x0: terrain_flags: 2-byte bitfield
    u16 terrain_flags;
    // enum terrain_type terrain_type : 2;
    // This tile can be corner-cut when walking. Seemingly only used during dungeon generation.
    // bool f_corner_cuttable : 1;
    // Includes room tiles right next to a hallway, and branching points within corridors.
    // Only applies to natural halls, not ones made by Absolute Mover, not "hallways" made of
    // secondary terrain, etc. Used by the AI for navigation.
    // bool f_natural_junction : 1;
    // This tile is impassable, even with Absolute Mover/Mobile Scarf. Used for the map border,
    // key chamber walls, walls in boss battle rooms, etc.
    // bool f_impassable_wall : 1;
    // bool f_in_kecleon_shop : 1;  // In a Kecleon Shop
    // bool f_in_monster_house : 1; // In a Monster House
    // bool terrain_flags_unk7 : 1;
    // Cannot be broken by Absolute Mover. Set naturally on key doors.
    // bool f_unbreakable : 1;
    // Tile is any type of "stairs" (normal stairs, Hidden Stairs, Warp Zone)
    // bool f_stairs : 1;
    // bool terrain_flags_unk10 : 1;
    // bool f_key_door : 1;            // Tile is a key door
    // bool f_key_door_key_locked : 1; // Key door is locked and requires a Key to open
    // Key door is locked and requires an escort to open (for Sealed Chamber missions)
    // bool f_key_door_escort_locked : 1;
    // bool terrain_flags_unk14 : 1;
    // Tile is open terrain but unreachable from the stairs spawn point. Only set during dungeon
    // generation.
    // bool f_unreachable_from_stairs : 1;

    // 0x2: Seems to be used for spawning entities during dungeon generation, and for visibility
    // during dungeon play
    union spawn_or_visibility_flags spawn_or_visibility_flags;
    u16 texture_id; // 0x4: Maybe? Changing this causes the tile texture to change
    u8 field_0x6;
    // 0x7: Room index. 0xFF if not in a room, 0xFE on junctions during map generation (it gets set
    // to 0xFF later).
    u8 room;
    // 0x8: Where a monster standing on this tile is allowed to move.
    // Each element is a bitflag that corresponds to one of the first four values of
    // enum mobility_type. Each bit in the bitflag corresponds to the values of enum direction,
    // where 1 means a monster with that mobility type is allowed to walk in that direction.
    u8 walkable_neighbor_flags[4];
    struct entity* monster; // 0xC: Pointer to a monster on this tile, if any
    // 0x10: Pointer to an entity other than a monster on this tile (item/trap)
    struct entity* object;
};

// Data related to dungeon generation
struct dungeon_generation_info {
    // 0x0: Set if the floor layout is guaranteed to be a Monster House, or the dungeon generation
    // algorithm fails
    bool8 force_create_monster_house;
    // 0x1: Set if the locked door on the floor has already been opened.
    bool8 locked_door_opened;
    // 0x2: Set if a kecleon shop was properly spawned.
    bool8 kecleon_shop_spawned;
    // 0x3: When a non-zero value, the one-room orb will fail.
    u8 unk_one_room_flag;
    bool8 dough_seed_extra_poke_flag;
    // 0x5: Room index of Monster House on the floor. 0xFF if there's no Monster House
    u8 monster_house_room;
    // 0x6: Related to when a monster from a fixed room faints. Maybe to check if the floor
    // should be over after knocking them out?
    u8 unk_fixed_room_static_monster_tracker;
    u8 field_0x7;
    // 0x8: The type of the hidden stairs on the current floor.
    enum hidden_stairs_type hidden_stairs_type;
    // 0xC: Used to check to load the corresponding hidden fixed room and information for
    // the corresponding type of hidden floor.
    enum hidden_stairs_type hidden_floor_type;
    s16 tileset_id; // 0x10
    // 0x12: Music table index (see the same field in struct floor_properties)
    u16 music_table_idx;
    // 0x14: Controls which trap graphics to use for the staircase. Usually 0x2B (27) and
    // 0x2C (28) for down and up respectively.
    u16 staircase_visual_idx;
    enum fixed_room_id fixed_room_id; // 0x16
    u8 field_0x17;
    u8 field_0x18;
    u8 field_0x19;
    u16 floor_generation_attempts; // 0x1A: Number of attempts at floor layout generation
    struct tile tiles[32][56];          // 0x1C
    struct position team_spawn_pos;     // 0x8C1C: Position of the team spawn
    struct position stairs_pos;         // 0x8C20: Position of the stairs spawn
    // 0x8C24: Position of the Hidden Stairs spawn, or (-1, -1) if no Hidden Stairs
    struct position hidden_stairs_pos;
    // 0x8C28: Spawn position of each of the team members
    struct position individual_team_spawn_positions[4];
    // There's another 6 words that look like spawn positions right after these 4
};

// Trap info
struct trap {
    enum trap_id id;
    // If 0 or 2, the trap will activate only when a team member steps on it. If 1, the trap will
    // activate only when an enemy steps on it. Naturally, this seems to be 0 for traps and 2 for
    // Wonder Tiles
    u8 team;

    // 0x2: flags: 1-byte bitfield
    //u8 flags;
    bool8 f_unbreakable : 1; // If true, the trap can't be broken (for example, using a Trapbust Orb)
    u8 flags_unk1 : 7;

    u8 field_0x3;
};

// Struct that contains some data used when spawning new enemies
struct enemy_spawn_stats {
    enum monster_id id; // 0x0
    u16 level;          // 0x2
    // 0x4: Spawn moves. Useless since each individual enemy gets its own when spawning.
    enum move_id moves[4];
    u16 max_hp; // 0xC
    u8 atk;     // 0xE
    u8 def;     // 0xF
    u8 sp_atk;  // 0x10
    u8 sp_def;  // 0x11
};

// Contains the necessary information to spawn a Kecleon shopkeeper.
struct spawned_shopkeeper_data {
    enum monster_id monster_id;    // 0x0: The id of the monster to spawn
    enum monster_behavior behavior; // 0x2: NPC behavior of the monster
    bool8 valid;                         // 0x3: Indicates that this spawn data is valid
    u8 pos_x;                      // 0x4
    u8 pos_y;                      // 0x5
};

// Appears to contain diagnostic information related to the damage calculation routines.
struct damage_calc_diag {
    enum type_id move_type; // 0x0: The type of the last move used
    u8 field_0x1;
    u8 field_0x2;
    u8 field_0x3;
    enum move_category move_category; // 0x4: The category of the last move used
    // 0x8: The type matchup of the last move used against the individual types of the defender
    enum type_matchup move_indiv_type_matchups[2];
    // 0xA: The modified offensive stat stage of the attacker for the last move used
    u8 offensive_stat_stage;
    // 0xB: The modified defensive stat stage of the defender for the last move used
    u8 defensive_stat_stage;
    // 0xC: The base offensive stat of the attacker for the last move used
    u16 offensive_stat;
    // 0xE: The base defensive stat of the defender for the last move used
    u16 defensive_stat;
    // 0x10: The Flash Fire boost of the attacker when a Fire move was last used
    u16 flash_fire_boost;
    // 0x12: The modified offense value calculated for the attacker for the last move used,
    // prior to being clamped between 0 and 999
    u16 offense_calc;
    // 0x14: The modified defense value calculated for the defender for the last move used
    u16 defense_calc;
    u16 attacker_level; // 0x16: The level of the attacker for the last move used
    // 0x18: The intermediate quantity in the damage calculation called "AT" in debug logging,
    // which corresponds to: round[ min(max(offense_calc, 0), 999) + power_calc ],
    // where power_calc is a modified move power calculated as (intermediate rounding omitted):
    // GetMovePower(...) * (offensive stat stage multipliers) * (offensive multipliers)
    u16 damage_calc_at;
    // 0x1A: An identical copy of defense_calc. This is probably a relic of development,
    // when the final defense contribution to the damage formula might have been a different
    // quantity computed from defense_calc, like how damage_calc_at is computed
    // from offense_calc
    u16 damage_calc_def;
    // 0x1C: The intermediate quantity in the damage calculation called "FLV" in debug logging
    // (effective level?), which corresponds to: round[ (offense_calc - defense_calc)/8 + level ]
    u16 damage_calc_flv;
    u8 field_0x1e;
    u8 field_0x1f;
    // 0x20: The result of the damage calculation after multiplying the base value by multipliers,
    // but before applying random variation. There are also a couple stray multipliers applied
    // after this result, including multipliers specific to the projectile move (the static 50%,
    // and the Power Pitcher multiplier) and the Air Blade multiplier.
    s32 damage_calc;
    // 0x24: The intermediate quantity in the damage calculation resulting from the "base" damage
    // calculation: the sum of the power, attack, defense, and level terms, modified by the
    // non-team-member multiplier if relevant, and clamped between 1 and 999.
    s32 damage_calc_base;
    // 0x28: The random multiplier applied to the result of the damage calculation, as a
    // percentage (so the actual factor, multiplied by 100), rounded to an integer.
    s32 damage_calc_random_mult_pct;
    // 0x2C: The calculated "static" damage multiplier applied to the output of the base damage
    // calculation. "Static" in the sense that this part of the multiplier doesn't depend on
    // variables like type-based effects, critical hits, and Reflect/Light Screen. Factors in
    // the static damage multiplier include the argument to CalcDamage, the multiplier due to
    // monster::me_first_flag, Reckless, and Iron Fist.
    s32 static_damage_mult;
    // 0x30: The net number of attack boosts to an attacker due to a Power Band or Munch Belt.
    // It seems like there's a bug in the code; aura bows do not contribute to this field.
    s8 item_atk_modifier;
    // 0x31: The net number of special attack boosts to an attacker due to a Special Band,
    // Munch Belt, or aura bow. It seems like there's a bug in the code; physical attack boosts
    // from aura bows also contribute to this field.
    s8 item_sp_atk_modifier;
    // 0x32: The net number of offense boosts to an attacker due to Download, Rivalry,
    // Flower Gift, and Solar Power
    s8 ability_offense_modifier;
    // 0x33: The net number of defense boosts to a defender due to Flower Gift
    s8 ability_defense_modifier;
    // 0x34: The net number of offense boosts to an attacker due to Aggressor, Defender, and
    // Practice Swinger
    s8 iq_skill_offense_modifier;
    // 0x35: The net number of defense boosts to a defender due to Counter Basher, Aggressor, and
    // Defender
    s8 iq_skill_defense_modifier;
    // 0x36: The net number of defense boosts to a defender due to a Def Scarf or aura bow.
    // It seems like there's a bug in the code; special defense boosts from aura bows also
    // contribute to this field.
    s8 item_def_modifier;
    // 0x37: The net number of special defense boosts to a defender due to a Zinc Band.
    // It seems like there's a bug in the code; aura bows do not contribute to this field.
    s8 item_sp_def_modifier;
    // 0x38: Whether or not Scope Lens or Sharpshooter boosted the critical hit rate of a move
    bool8 scope_lens_or_sharpshooter_activated;
    // 0x39: Whether or not the Patsy Band boosted the critical hit rate of a move
    bool8 patsy_band_activated;
    // 0x3A: Whether or not Reflect or the Time Shield halved the damage from a physical move
    bool8 half_physical_damage_activated;
    // 0x3B: Whether or not Light Screen or the Aqua Mantle halved the damage from a special move
    bool8 half_special_damage_activated;
    // 0x3C: Whether or not the Enhanced critical-hit rate status maxed out the critical hit rate
    // of a move
    bool8 focus_energy_activated;
    // 0x3D: Whether or not Type-Advantage Master boosted the critical hit rate of a move
    bool8 type_advantage_master_activated;
    // 0x3E: Whether or not a non-Normal-type move was dampened by Cloudy weather
    bool8 cloudy_drop_activated;
    // 0x3F: Whether or not a Fire or Water move was affected by Rainy weather
    bool8 rain_multiplier_activated;
    // 0x40: Whether or not a Fire or Water move was affected by Sunny weather
    bool8 sunny_multiplier_activated;
    // 0x41: Whether or a Fire move was dampened by Thick Fat or Heatproof
    bool8 fire_move_ability_drop_activated;
    // 0x42: Whether or not Flash Fire was activated at some point for Fire immunity
    bool8 flash_fire_activated;
    // 0x43: Whether or not Levitate was activated at some point for Ground immunity
    bool8 levitate_activated;
    bool8 torrent_boost_activated;  // 0x44: Whether or not a Water move was boosted by Torrent
    bool8 overgrow_boost_activated; // 0x45: Whether or not a Grass move was boosted by Overgrow
    bool8 swarm_boost_activated;    // 0x46: Whether or not a Bug move was boosted by Swarm
    // 0x47: Whether or not a Fire move was boosted by either Blaze or Dry Skin
    bool8 fire_move_ability_boost_activated;
    // 0x48: Whether or not Scrappy was activated at some point to bypass immunity
    bool8 scrappy_activated;
    // 0x49: Whether or not Super Luck boosted the critical hit rate for a move
    bool8 super_luck_activated;
    // 0x4A: Whether or not Sniper boosted the critical hit damage multiplier for a move
    bool8 sniper_activated;
    bool8 stab_boost_activated; // 0x4B: Whether or not STAB was activated for a move
    // 0x4C: Whether or not an Electric move was dampened by either Mud Sport or Fog
    bool8 electric_move_dampened;
    // 0x4D: Whether or not Water Sport was activated by a Fire move
    bool8 water_sport_drop_activated;
    bool8 charge_boost_activated; // 0x4E: Whether or not Charge was activated by an Electric move
    u8 field_0x4f;
    // 0x50: Whether or not a Ghost type's immunity to Normal/Fighting was activated at some point
    bool8 ghost_immunity_activated;
    // 0x51: Whether or not a defender took less damage due to the Charging Skull Bash status
    bool8 skull_bash_defense_boost_activated;
    u8 field_0x52;
    u8 field_0x53;
};

#endif //PMDSKY_DUNGEON_MODE_H
