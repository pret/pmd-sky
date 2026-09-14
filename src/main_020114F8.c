#include "main_020114F8.h"
#include "main_02001188.h"
#include "common.h"

extern void ApplyGummiBoostsGroundMode(s16 *monster_id, s16 *iq, u8 *offensive_stats, u8 *defensive_stats, s16 item_id, int a6, void *a7);

void SwapShopFreeDoublePointer(void** p)
{
    if (*p == NULL) {
        return;
    }
    MemFree(*(void **)*p);
    MemFree(*p);
    *p = NULL;
}

void ApplyGummiBoostsToGroundMonster(struct ground_monster *monster, s16 item_id, int a3, void *a4)
{
    ApplyGummiBoostsGroundMode(&monster->id, &monster->iq, monster->offensive_stats,
                               monster->defensive_stats, item_id, a3, a4);
}

void ApplyGummiBoostsToTeamMember(struct team_member *member, s16 item_id, int a3, void *a4)
{
    ApplyGummiBoostsGroundMode((s16 *)&member->id, (s16 *)&member->iq, member->offensive_stats,
                               member->defensive_stats, item_id, a3, a4);
}
