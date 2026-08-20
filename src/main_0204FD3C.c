#include "main_0204FD3C.h"
#include "adventure_log.h"

void IncrementNbEggsHatched(void)
{
    if ((s32) ADVENTURE_LOG_PTR->nb_eggs_hatched < 999999) {
        ADVENTURE_LOG_PTR->nb_eggs_hatched++;
    }
    ADVENTURE_LOG_PTR->completion_flags[0] |= 0x100;
}

u32 GetNbEggsHatched(void)
{
    return ADVENTURE_LOG_PTR->nb_eggs_hatched;
}

u32 GetNbPokemonJoined(void)
{
    return ADVENTURE_LOG_PTR->pokemon_joined_counter;
}

u32 GetNbMovesLearned(void)
{
    return ADVENTURE_LOG_PTR->moves_learned_counter;
}

void SetVictoriesOnOneFloor(s32 value)
{
    if (value > 999999) {
        value = 999999;
    }
    ADVENTURE_LOG_PTR->nb_victories_on_one_floor = value;
    ADVENTURE_LOG_PTR->completion_flags[0] |= 0x200;
}

u32 GetVictoriesOnOneFloor(void)
{
    return ADVENTURE_LOG_PTR->nb_victories_on_one_floor;
}
