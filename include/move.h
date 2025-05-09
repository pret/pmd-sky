#ifndef PMDSKY_MOVE_H
#define PMDSKY_MOVE_H

#include "enums.h"

enum move_flag
{
    MOVE_FLAG_EXISTS = 1 << 0,
    MOVE_FLAG_SUBSEQUENT_IN_LINK_CHAIN = 1 << 1, // This move is linked with the previous move in the Pokémon's moveset.
    MOVE_FLAG_ENABLED_FOR_AI = 1 << 2, // Enabled for the AI to use.
    MOVE_FLAG_SET = 1 << 3, // This move can be triggered by pressing L+A instead of having to go to the move menu.
    MOVE_FLAG_LAST_USED = 1 << 4, // The most recent move used by the Pokémon.
    MOVE_FLAG_DISABLED = 1 << 5, // Disabled by an effect like Taunt.
    MOVE_FLAG_INTERNAL_MARKER = 1 << 7     // Possibly some kind of flag used internally to mark a move and find it again
};

enum move_flag_2
{
    MOVE_FLAG_SEALED = 1 << 0,
    MOVE_FLAG_CONSUME_PP = 1 << 2,
    MOVE_FLAG_CONSUME_2_PP = 1 << 3,
    MOVE_FLAG_CONSUME_4_PP = 1 << 5,
    MOVE_FLAG_MULTITALENT_PP_BOOST = 1 << 8,
    MOVE_FLAG_EXCLUSIVE_ITEM_PP_BOOST = 1 << 9,
    MOVE_FLAG_UNKNOWN_PP_BOOST = 1 << 10,
};

// Monster move info
struct move {
    // 0x0: flags: 1-byte bitfield
    u8 flags0;
    // bool8 f_exists : 1;                   // This move will show up in the move list
    // bool8 f_subsequent_in_link_chain : 1; // This move is in a link chain, but not the first move
    // bool8 f_enabled_for_ai : 1;           // AI can use this move
    // bool8 f_set : 1;                      // Usable by L+A
    // bool8 f_last_used : 1; // This move was the last one used (for things like Torment?)
    // bool8 f_disabled : 1;  // For Torment (and maybe others)
    // u8 flags_unk6 : 2;

    u8 field_0x1;

    // 0x2: flags2: 2-byte bitfield
    u16 flags2;
    // bool8 f_sealed : 1; // Sealed by a Seal Trap. Also prevents AI from using this move
    // u16 flags2_unk1 : 2;
    // bool8 f_consume_pp : 1;   // This move will consume PP this turn
    // bool8 f_consume_2_pp : 1; // Consume 2 PP this turn. No effect unless f_consume_pp is set
    // u16 flags2_unk5 : 1;
    // // Consume 4 PP this turn. No effect unless f_consume_pp is set, overrides f_consume_2_pp
    // bool8 f_consume_4_pp : 1;
    // u16 flags2_unk7 : 1;
    // u16 flags2_unk8 : 1;
    // bool8 f_multitalent_pp_boost : 1;    // The IQ skill Multitalent is actively boosting move PP
    // bool8 f_exclusive_item_pp_boost : 1; // A PP-boosting exclusive item is in effect
    // bool8 f_unknown_pp_boost : 1;        // A PP-boosting effect? Possibly unused?
    // uint16_t flags3_unk11 : 5;

    enum move_id id; // 0x4
    u8 pp;           // 0x6: Current PP
    u8 ginseng;      // 0x7: Ginseng boost
};

#endif // PMDSKY_MOVE_H
