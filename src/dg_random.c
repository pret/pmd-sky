#include "dg_random.h"

// file starts at 0x022ea968

extern s16 DungeonRand16Bit(void);

s32 DungeonRandInt(s32 end)
{
    s32 entropy = DungeonRand16Bit();
    entropy &= 0xffff;
    entropy *= end;
    return (((s32) entropy) >> 0x10) & 0xffff;
}

s32 DungeonRandRange(s32 from, s32 to)
{
    s32 entropy;
    if (from == to) {
        return from;
    } else if (from<to) {
        entropy = DungeonRand16Bit();
        return from + ((s32)((entropy & 0xffff) * (to - from)) >> 0x10 & 0xffffU);
    } else {
        entropy = DungeonRand16Bit();
        return to + ((s32)((entropy & 0xffff) * (from - to)) >> 0x10 & 0xffffU);
    }
}

bool8 DungeonRandOutcome__022EAB20(s32 percentChance)
{
    if ((((DungeonRand16Bit() & 0xFFFF) * 100) >> 16) < percentChance)
    {
        return TRUE;
    }
    return FALSE;
}

bool8 DungeonRandOutcome__022EAB50(s32 percentChance)
{
    if ((((DungeonRand16Bit() & 0xFFFF) * 100) >> 16) < percentChance)
    {
        return TRUE;
    }
    return FALSE;
}
