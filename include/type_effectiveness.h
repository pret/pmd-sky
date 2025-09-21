#ifndef PMDSKY_TYPE_EFFECTIVENESS_H
#define PMDSKY_TYPE_EFFECTIVENESS_H

#include "dungeon_mode.h"

// Type matchup table, not including TYPE_NEUTRAL.
// Note that Ghost's immunities seem to be hard-coded elsewhere. In this table, both Normal and
// Fighting are encoded as neutral against Ghost.
//
// Row index corresponds to the attack type and the column index corresponds to the defender type.
// C-style access: type_matchup_table[attack_type][target_type] or
// *(&type_matchup_table[0][0] + attack_type*18 + target_type)
struct type_matchup_table {
    s16 matchups[NUM_TYPES][NUM_TYPES];
};

s16 GetTypeMatchup(struct entity *attacker, struct entity *defender, s16 target_type_idx, enum type_id attack_type);

#endif //PMDSKY_TYPE_EFFECTIVENESS_H
