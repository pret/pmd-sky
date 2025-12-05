#ifndef PMDSKY_MAIN_02058CD8_H
#define PMDSKY_MAIN_02058CD8_H

#include "enums.h"
#include "util.h"

// Returns whether an IQ skill can be learned with a given IQ amount or not.
// If the specified amount is 0, it always returns false.
bool8 CanLearnIqSkill(s32 iq_amount, enum iq_skill_id iq_id);

#endif //PMDSKY_MAIN_02058CD8_H
