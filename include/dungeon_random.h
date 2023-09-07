#ifndef PMDSKY_DUNGEON_RANDOM_H
#define PMDSKY_DUNGEON_RANDOM_H

// Returns the result of a possibly biased coin flip (a Bernoulli random variable) with some success probability p, using the dungeon PRNG.
// percentChance: success percentage (100*p)
// return: true with probability p, false with probability (1-p)
u8 DungeonRandOutcome__022EAB20(s32 percentChance);

// Returns the result of a possibly biased coin flip (a Bernoulli random variable) with some success probability p, using the dungeon PRNG.
// percentChance: success percentage (100*p)
// return: true with probability p, false with probability (1-p)
u8 DungeonRandOutcome__022EAB50(s32 percentChance);

#endif //PMDSKY_DUNGEON_RANDOM_H
