#include "overlay_29_022EFA6C.h"
#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR[];

extern s32 TeamMemberHasItemActive(struct entity **buf, enum item_id item_id);

extern void BoostIQ(struct entity *entity, s16 iq, bool8 a);

bool8 DebugRecruitingEnabled(u32 monster_id)
{
    return TRUE;
}

void TryActivateIqBooster(void)
{
    struct entity *members[4];
    s16 iq;
    s32 n;
    s32 i;

    iq = DUNGEON_PTR[0]->floor_properties.iq_booster_value;
    if (iq <= 0) {
        return;
    }

    n = TeamMemberHasItemActive(members, ITEM_IQ_BOOSTER);
    if (n <= 0) {
        return;
    }

    for (i = 0; i < n; i++) {
        BoostIQ(members[i], iq, FALSE);
    }
}
