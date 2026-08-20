#include "overlay_29_02329664.h"
#include "move_orb_effects.h"

#ifdef JAPAN
#define HELPING_HAND_LOG_MESSAGE 0xC1C
#else
#define HELPING_HAND_LOG_MESSAGE 0xEDA
#endif


extern void LogMessageByIdWithPopupCheckUserTarget(struct entity *user, struct entity *target, u32 message_id);

extern const struct StatIndex ATK_STAT_IDX;

extern const struct StatIndex SPATK_STAT_IDX;

extern void TryInflictConversion2Status(struct entity *user, struct entity *target);

bool8 DoMoveConversion2(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictConversion2Status(attacker, defender);

    return TRUE;
}

bool8 DoMoveHelpingHand(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    bool8 result = FALSE;

    if (attacker == defender) {
        LogMessageByIdWithPopupCheckUserTarget(attacker, defender, HELPING_HAND_LOG_MESSAGE);
    } else {
        BoostOffensiveStat(attacker, defender, ATK_STAT_IDX, 1);
        BoostOffensiveStat(attacker, defender, SPATK_STAT_IDX, 1);
        result = TRUE;
    }

    return result;
}
