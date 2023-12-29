#include "dg_random.h"

// file starts at 0x022ea968

extern s32 DungeonRand16Bit(void);

u8 DungeonRandOutcome__022EAB20(s32 percentChance)
{
    if ((((DungeonRand16Bit() & 0xFFFF) * 100) >> 16) < percentChance)
    {
        return TRUE;
    }
    return FALSE;
}

u8 DungeonRandOutcome__022EAB50(s32 percentChance)
{
    if ((((DungeonRand16Bit() & 0xFFFF) * 100) >> 16) < percentChance)
    {
        return TRUE;
    }
    return FALSE;
}
