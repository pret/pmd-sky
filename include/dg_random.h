#ifndef PMDSKY_DG_RANDOM_H
#define PMDSKY_DG_RANDOM_H

#include "util.h"

// Compute a pseudorandom integer under a given maximum value using the dungeon PRNG.
// pseudorandom integer on the interval [0, end - 1]
s32 DungeonRandInt(s32 end);
// Compute a pseudorandom value between two integers using the dungeon PRNG.
// If both input integers are the same, the first is returned.
// return: pseudorandom integer on the interval [min(from, to), max(from, to) - 1], or from if from == to.
s32 DungeonRandRange(s32 from, s32 to);
// Returns the result of a possibly biased coin flip (a Bernoulli random variable) with some success probability p, using the dungeon PRNG.
// percentChance: success percentage (100*p)
// return: true with probability p, false with probability (1-p)
bool8 DungeonRandOutcome__022EAB20(s32 percentChance);

// Returns the result of a possibly biased coin flip (a Bernoulli random variable) with some success probability p, using the dungeon PRNG.
// percentChance: success percentage (100*p)
// return: true with probability p, false with probability (1-p)
bool8 DungeonRandOutcome__022EAB50(s32 percentChance);

#endif //PMDSKY_DG_RANDOM_H
