#ifndef PMDSKY_IQ_SKILLS_H
#define PMDSKY_IQ_SKILLS_H

#define NUM_IQ_SKILLS 69
#define NUM_IQ_SKILLS_PER_GROUP 25
#define NUM_IQ_GROUPS 16

#include "enums.h"

// Table of 4-byte values for each IQ skill that represent the required IQ value to unlock a skill.
extern const s32 IQ_SKILLS[NUM_IQ_SKILLS];
extern const enum iq_skill_id IQ_GROUP_SKILLS[NUM_IQ_GROUPS][NUM_IQ_SKILLS_PER_GROUP];

#endif //PMDSKY_IQ_SKILLS_H
