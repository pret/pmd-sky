#ifndef PMDSKY_TYPE_MATCHUP_TABLE_H
#define PMDSKY_TYPE_MATCHUP_TABLE_H

#include "enums.h"

// Type matchup table, not including TYPE_NEUTRAL.
// Note that Ghost's immunities seem to be hard-coded elsewhere. In this table, both Normal and
// Fighting are encoded as neutral against Ghost.
// Row index corresponds to the attack type and the column index corresponds to the defender type.
struct type_matchup_table {
    s16 matchups[NUM_TYPES][NUM_TYPES];
};

// Table of type matchups.
// Each row corresponds to the type matchups of a specific attack type, with each entry within the row specifying the type's effectiveness against a target type.
extern const struct type_matchup_table TYPE_MATCHUP_TABLE;

#endif //PMDSKY_TYPE_MATCHUP_TABLE_H
