#include "main_0204FDFC.h"
#include "adventure_log.h"

extern struct adventure_log* ADVENTURE_LOG_PTR;

extern s32 GetDexNumberVeneer();

void SetPokemonJoined(u32 monster_id)
{
    s32 dex_num = GetDexNumberVeneer(monster_id);
    if (dex_num == 0) return;

    ADVENTURE_LOG_PTR->completion_flags[0] |= 1;

    u32 word = dex_num / 32;        // dex_num / 32
    u32 bit  = dex_num % 32;        // dex_num % 32

    ADVENTURE_LOG_PTR->pokemon_joined_flags[word] |= (1 << bit);
}
