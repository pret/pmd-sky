#ifndef HEADERS_TYPES_DUNGEON_MODE_COMMON_H_
#define HEADERS_TYPES_DUNGEON_MODE_COMMON_H_

#include "enums.h"

// Monster move info
struct move {
    // 0x0: flags0: 1-byte bitfield
    u8 flags0;
    /* bool8 f_exists : 1;                   // This move will show up in the move list */
    /* bool8 f_subsequent_in_link_chain : 1; // This move is in a link chain, but not the first move */
    /* bool8 f_enabled_for_ai : 1;           // AI can use this move */
    /* bool8 f_set : 1;                      // Usable by L+A */
    /* bool8 f_last_used : 1; // This move was the last one used (for things like Torment?) */
    /* bool8 f_disabled : 1;  // For Torment (and maybe others) */
    /* u8 flags0_unk6 : 2; */

    u8 field_0x1;

    // 0x2: flags2: 2-byte bitfield
    u16 flags2;
    /* bool8 f_sealed : 1; // Sealed by a Seal Trap. Also prevents AI from using this move */
    /* u16 flags2_unk1 : 2; */
    /* bool8 f_consume_pp : 1;   // This move will consume PP this turn */
    /* bool8 f_consume_2_pp : 1; // Consume 2 PP this turn. No effect unless f_consume_pp is set */
    /* u16 flags2_unk5 : 1; */
    /* // Consume 4 PP this turn. No effect unless f_consume_pp is set, overrides f_consume_2_pp */
    /* bool8 f_consume_4_pp : 1; */
    /* u16 flags2_unk7 : 1; */
    /* u16 flags2_unk8 : 1; */
    /* bool8 f_exclusive_item_pp_boost : 1; // A PP-boosting exclusive item is in effect */
    /* u16 flags3_unk10 : 6; */

    enum move_id id : 16; // 0x4
    u8 pp;           // 0x6: Current PP
    u8 ginseng;      // 0x7: Ginseng boost
};

#endif
