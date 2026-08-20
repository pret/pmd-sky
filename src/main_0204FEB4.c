#include "main_0204FEB4.h"
#include "adventure_log.h"

u32 GetNbPokemonBattled(void)
{
    return ADVENTURE_LOG_PTR->pokemon_battled_counter;
}

void IncrementNbBigTreasureWins(void)
{
    SetNbBigTreasureWins(ADVENTURE_LOG_PTR->nb_big_treasure_wins + 1);
}

void SetNbBigTreasureWins(s32 value)
{
    ADVENTURE_LOG_PTR->completion_flags[0] |= 0x400;
    if (value > 999999) {
        value = 999999;
    }
    ADVENTURE_LOG_PTR->nb_big_treasure_wins = value;
}

u32 GetNbBigTreasureWins(void)
{
    return ADVENTURE_LOG_PTR->nb_big_treasure_wins;
}

void SetNbRecycled(s32 value)
{
    ADVENTURE_LOG_PTR->completion_flags[0] |= 0x800;
    if (value > 999999) {
        value = 999999;
    }
    ADVENTURE_LOG_PTR->nb_recycled = value;
}

u32 GetNbRecycled(void)
{
    return ADVENTURE_LOG_PTR->nb_recycled;
}

void IncrementNbSkyGiftsSent(void)
{
    SetNbSkyGiftsSent(ADVENTURE_LOG_PTR->nb_gifts_sent + 1);
}

void SetNbSkyGiftsSent(s32 value)
{
    ADVENTURE_LOG_PTR->completion_flags[0] |= 0x1000;
    if (value > 999999) {
        value = 999999;
    }
    ADVENTURE_LOG_PTR->nb_gifts_sent = value;
}

u32 GetNbSkyGiftsSent(void)
{
    return ADVENTURE_LOG_PTR->nb_gifts_sent;
}
