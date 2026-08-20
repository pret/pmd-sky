#include "overlay_29_0232A480.h"
#include "dungeon_util_static.h"

#ifdef JAPAN
#define SWALLOW_LOG_MESSAGE 0xC26
#else
#define SWALLOW_LOG_MESSAGE 0xEE4
#endif


extern void LogMessageByIdWithPopupCheckUserTarget(struct entity *user, struct entity *target, u32 message_id);

extern const s32 ov10_022C49D4[];

extern void TryIncreaseHp(struct entity *user, struct entity *target, s32 hp, s32 a, bool8 b);

extern void TryInflictIngrainStatus(struct entity *user, struct entity *target);

bool8 DoMoveIngrain(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictIngrainStatus(attacker, defender);

    return TRUE;
}

bool8 DoMoveSwallow(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    struct monster *info = GetEntInfo(defender);

    if (info->stockpile_stage != 0) {
        TryIncreaseHp(attacker, defender, ov10_022C49D4[info->stockpile_stage], 0, TRUE);
        info->stockpile_stage = 0;
    } else {
        LogMessageByIdWithPopupCheckUserTarget(attacker, defender, SWALLOW_LOG_MESSAGE);
    }

    return TRUE;
}
