#include "main_020503CC.h"
#include "adventure_log.h"

u32 GetNbItemAcquired(void)
{
    u32 count = 0;
    s32 i = 0;
    struct adventure_log *log = ADVENTURE_LOG_PTR;

    for (i = 0; i < 0x580; i++) {
        if (log->items_acquired_flags[i / 32] & (1 << (i % 32))) {
            count++;
        }
    }
    return count;
}
