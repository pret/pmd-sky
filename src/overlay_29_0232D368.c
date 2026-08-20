#include "overlay_29_0232D368.h"

#ifdef JAPAN
#define GUARD_SWAP_LOG_MESSAGE 0x2495
#else
#define GUARD_SWAP_LOG_MESSAGE 0xF2E
#endif


extern void LogMessageByIdWithPopupCheckUserTarget(struct entity *user, struct entity *target, u32 message_id);

extern void SubstitutePlaceholderStringTags(s32 slot, struct entity *entity, u32 a);

extern void SwapDefensiveStages(struct entity *user, struct entity *target, s32 a);

extern void SwapDefensiveMultipliers(struct entity *user, struct entity *target, s32 a);

extern void TryInflictLuckyChantStatus(struct entity *user, struct entity *target);

bool8 DoMoveLuckyChant(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictLuckyChantStatus(attacker, defender);

    return TRUE;
}

bool8 DoMoveGuardSwap(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    SwapDefensiveStages(attacker, defender, 0);
    SwapDefensiveMultipliers(attacker, defender, 0);
    SubstitutePlaceholderStringTags(0, attacker, 0);
    SubstitutePlaceholderStringTags(1, defender, 0);
    LogMessageByIdWithPopupCheckUserTarget(attacker, defender, GUARD_SWAP_LOG_MESSAGE);

    return TRUE;
}
