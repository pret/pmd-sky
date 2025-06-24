#include "dungeon_ai_attack_2.h"
#include "direction.h"
#include "util.h"

extern bool8 AI_CAN_ATTACK_IN_DIRECTION[NUM_DIRECTIONS];

void ResetAiCanAttackInDirection()
{
    for (s32 i = 0; i < NUM_DIRECTIONS; i++)
    {
        AI_CAN_ATTACK_IN_DIRECTION[i] = FALSE;
    }
}
