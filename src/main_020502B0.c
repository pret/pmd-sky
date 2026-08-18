#include "main_020502B0.h"
#include "adventure_log.h"

void IncrementNbFainted(void)
{
    if ((s32) ADVENTURE_LOG_PTR->nb_faints < 999999) {
        ADVENTURE_LOG_PTR->nb_faints++;
    }
    ADVENTURE_LOG_PTR->completion_flags[0] |= 0x20;
}

u32 GetNbFainted(void)
{
    return ADVENTURE_LOG_PTR->nb_faints;
}
