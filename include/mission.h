#ifndef PMDSKY_MISSION_H
#define PMDSKY_MISSION_H

#include "enums.h"
#include "item.h"

// Represents the different statuses that a mission can have
enum mission_status {
    MISSION_STATUS_INVALID = 0, // Used for empty mission slots
    MISSION_STATUS_UNK_1 = 1,   // The mission won't display a status
    MISSION_STATUS_UNK_2 = 2,   // The mission won't display a status
    MISSION_STATUS_UNK_3 = 3,   // The mission won't display a status
    MISSION_STATUS_SUSPENDED = 4,
    MISSION_STATUS_ACCEPTED = 5,
    MISSION_STATUS_DONE = 6,
    MISSION_STATUS_UNK_7 = 7, // Shows up as "accepted"
    MISSION_STATUS_UNK_8 = 8, // Shows up as "accepted"
};

// Different types of rewards that a mission can have
enum mission_reward_type {
    MISSION_REWARD_MONEY = 0,
    MISSION_REWARD_MONEY_AND_MORE = 1, // Money + (?)
    MISSION_REWARD_ITEM = 2,
    MISSION_REWARD_ITEM_AND_MORE = 3, // Item + (?)
    // Exclusive Item, displayed as "(?)" (Will be 1 star, and beneficial of the client/target)
    // $SCENARIO_MAIN must be [8, 0] or above AND mission rank must be >=5 stars to be selected.
    // Also used for the Togetic Wing given from the Gabite Scale mission.
    MISSION_REWARD_EXCLUSIVE_ITEM = 4,
    // Money, displayed as "(?)"
    // $SCENARIO_MAIN must be [12, 0] or above to be selected.
    MISSION_REWARD_MONEY_HIDDEN = 5,
    // Either an egg or the client requests to join the team, displayed as "(?)"
    // $SCENARIO_MAIN must be [6, 0] or above for this to be selected
    MISSION_REWARD_SPECIAL = 6,
};

// Mission type on a floor
enum mission_type {
    MISSION_RESCUE_CLIENT = 0,
    MISSION_RESCUE_TARGET = 1,
    MISSION_ESCORT_TO_TARGET = 2,
    MISSION_EXPLORE_WITH_CLIENT = 3,
    MISSION_PROSPECT_WITH_CLIENT = 4,
    MISSION_GUIDE_CLIENT = 5,
    MISSION_FIND_ITEM = 6,
    MISSION_DELIVER_ITEM = 7,
    MISSION_SEARCH_FOR_TARGET = 8,
    MISSION_TAKE_ITEM_FROM_OUTLAW = 9,
    MISSION_ARREST_OUTLAW = 10,
    MISSION_CHALLENGE_REQUEST = 11,
    MISSION_TREASURE_MEMO = 12,
    MISSION_TYPE_UNK_0xD = 13,
    MISSION_TYPE_CONSUMABLE = 14 // Used for SE3 wondermail and Seven Treasures!
};

// Mission subtype for MISSION_RESCUE_TARGET
// The distinction is mainly for dialogue
enum mission_subtype_rescue_target {
    // Client and Target are randomly selected
    MISSION_RESCUE_CLIENT_TARGET_RANDOM = 0,
    // Client is the evolved form of the target
    // (IE: Beedrill/Weedle, Aggron/Aron)
    MISSION_RESCUE_CLIENT_TARGET_CHILD = 1,
    // Client and Target are deeply similar
    // (IE: Dodrio/Exeggutor, Muk/Swalot, Magikarp/Feebas)
    MISSION_RESCUE_CLIENT_TARGET_SIMILAR_FRIENDS = 2,
    // Client and Target are lovers or rivals
    // (IE: Nidoking/Nidoqueen, Seviper/Zangoose, Volbeat/Illumise)
    MISSION_RESCUE_CLIENT_TARGET_LOVERS_RIVALS = 3
};

// Mission subtype for MISSION_ESCORT_TO_TARGET
enum mission_subtype_escort_to_target {
    // Client and Target are randomly selected
    MISSION_ESCORT_CLIENT_TARGET_RANDOM = 0,
    // Client and Target are counterparts
    // (IE: Nidoran-M/Nidoran-F, Volbeat/Illumise, Miltank/Tauros)
    MISSION_ESCORT_CLIENT_TARGET_SPECIFIC = 1
};

// Mission subtype for MISSION_EXPLORE_WITH_CLIENT
enum mission_subtype_explore {
    MISSION_EXPLORE_NORMAL = 0,
    MISSION_EXPLORE_SEALED_CHAMBER = 1,
    MISSION_EXPLORE_GOLDEN_CHAMBER = 2,
    MISSION_EXPLORE_NEW_DUNGEON = 3,
};

// Mission subtype for MISSION_FIND_ITEM
enum mission_subtype_find_item {
    // In the template, pulls from the "common" table in rescue_item_tables.
    // Client is random
    MISSION_FIND_ITEM_COMMON_TABLE = 0,
    // In the template, pulls from the "rare" table in rescue_item_tables.
    // Client is random
    MISSION_FIND_ITEM_RARE_TABLE = 1,
    // Item is an evolution item for the client
    // (IE: Gloom/Leaf Stone, Dusclops/Reaper Cloth, Magmar/Magmarizer)
    MISSION_FIND_ITEM_EVOLVES_CLIENT = 2,
    // Item is a gummi of one of the client's types
    // (IE: Flaafy/Yellow Gummi, Baltoy/Brown Gummi, Dratini/Royal Gummi)
    MISSION_FIND_ITEM_CLIENT_FAVORITE_GUMMI = 3,
    // This is the special Togetic Mission that unlocks Labyrinth Cave
    MISSION_TOGETIC_GABITE_SCALE = 4
};

// Mission subtype for MISSION_TAKE_ITEM_FROM_OUTLAW
// Random Client and Outlaw. NOT Magnezone/Magnemite
enum mission_subtype_take_item {
    MISSION_TAKE_ITEM_NORMAL_OUTLAW = 0,
    MISSION_TAKE_ITEM_HIDDEN_OUTLAW = 1,
    MISSION_TAKE_ITEM_FLEEING_OUTLAW = 2,
};

// Mission subtype for MISSION_ARREST_OUTLAW
// 0-3 all occur naturally in-game, the distinction is in intensity of the mission.
// Each uses a different table of outlaws of varying difficulties.
enum mission_subtype_outlaw {
    MISSION_OUTLAW_NORMAL_0 = 0, // in mission_template, client is magnezone
    MISSION_OUTLAW_NORMAL_1 = 1, // in mission_template, client is magnezone
    MISSION_OUTLAW_NORMAL_2 = 2, // in mission_template, client is magnemite
    MISSION_OUTLAW_NORMAL_3 = 3, // in mission_template, client is magnemite
    MISSION_OUTLAW_ESCORT = 4,
    MISSION_OUTLAW_FLEEING = 5,
    // One of 30 specific pairings (IE: Vespiquen/Combee, Golduck/Psyduck, Cloyster/Clampearl)
    MISSION_OUTLAW_HIDEOUT = 6,
    MISSION_OUTLAW_MONSTER_HOUSE = 7,
};

// Mission subtype for MISSION_CHALLENGE_REQUEST
enum mission_subtype_challenge {
    // One of 28 specific pairings
    // (IE: Charizard/Blastoise/Venusaur, Hitmontop/Hitmonchan/HitmonLee,
    // Nidoking/Nidorina/Nidorino)
    MISSION_CHALLENGE_NORMAL = 0,
    MISSION_CHALLENGE_MEWTWO = 1,
    MISSION_CHALLENGE_ENTEI = 2,
    MISSION_CHALLENGE_RAIKOU = 3,
    MISSION_CHALLENGE_SUICUNE = 4,
    MISSION_CHALLENGE_JIRACHI = 5,
};

// Mission subtype for MISSION_TYPE_CONSUMABLE
enum mission_subtype_consumable {
    MISSION_CONSUMABLE_UNK_0 = 0,
    // Subtype 0x1 is used in the template for seven-treasure missions
    MISSION_SEVEN_TREASURE = 1,
    // Subtype 0x2 is used by the SE3 wondermail
    MISSION_SPECIAL_EPISODE = 2
};

// The meaning of the mission subtype depends on the mission type
union mission_subtype {
    enum mission_subtype_rescue_target rescue_target;
    enum mission_subtype_escort_to_target escort;
    enum mission_subtype_explore explore;
    enum mission_subtype_find_item find_item;
    enum mission_subtype_take_item take_item;
    enum mission_subtype_outlaw outlaw;
    enum mission_subtype_challenge challenge;
    enum mission_subtype_consumable consumable;
    u8 other;
};

// Different types of restrictions that a mission can have
enum mission_restriction_type {
    MISSION_RESTRICTION_NONE = 0,
    MISSION_RESTRICTION_TYPE = 1,    // Requires a pokémon of a certain type on the team
    MISSION_RESTRICTION_MONSTER = 2, // Requires a certain pokémon on the team
};

// The restriction of a mission can be a monster ID or a type ID
union mission_restriction {
    enum monster_id monster_id;
    enum type_id type_id;
};

// Contains the data for a single mission
struct mission {
    enum mission_status status; // 0x0
    enum mission_type type;     // 0x1
    union mission_subtype subtype;  // 0x2
    enum dungeon_id dungeon_id; // 0x4
    u8 floor;                  // 0x5
    // 0x8: A random value determined by FUN_0205146C [EU], which is used to
    // randomly generate the mission title and description.
    s32 description_id;
    u8 unique_map_id; // 0xC: for challenges/treasure hunts/certain outlaws
    enum monster_id client; // 0xE: For challenge letter missions, stores the leader
    // 0x10: For non-legendary challenge letter missions, stores the second team member
    enum monster_id target;
    // 0x12: For non-legendary challenge letter missions, stores the third team member
    enum monster_id outlaw_backup_species;
    enum item_id item_wanted;            // 0x14
    enum mission_reward_type reward_type; // 0x16
    enum item_id item_reward;                      // 0x18
    enum mission_restriction_type restriction_type; // 0x1A
    union mission_restriction restriction; // 0x1C
};

struct mission_deliver_list {
    u8 unk0[0x18];
    u8* unk18;
};

#endif //PMDSKY_MISSION_H
