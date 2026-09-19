#include "main_020502B0.h"
#include "adventure_log.h"
#include "item_util_1.h"
#include "main_0204FB9C.h"
#include "progression.h"

extern s32 NormalizeTreasureBox(s32 item_id);

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

void SetItemAcquired(struct item *item)
{
    s32 id = NormalizeTreasureBox(item->id);
    if (!IsItemValidVeneer(id)) {
        return;
    }
    if (id >= 0x3B && id <= 0x41) {
        s32 all = 1;
        s32 i;
        SetAdventureLogCompleted((u8) (id - 0x21));
        for (i = 0x1A; i <= 0x20; i++) {
            if (!GetAdventureLogCompleted((u8) i)) {
                all = 0;
                break;
            }
        }
        if (all) {
            SetResolvedPerformanceProgressFlag(0x15, 1);
        }
    }
    ADVENTURE_LOG_PTR->items_acquired_flags[id / 32] |= 1 << (id % 32);
    ADVENTURE_LOG_PTR->completion_flags[0] |= 8;
}
