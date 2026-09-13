#include "overlay_29_023061A8.h"
#include "overlay_29_02305C04.h"
#include "dungeon_util_2.h"
#include "overlay_29_022E3F20.h"
#include "dungeon_util_static.h"

#ifdef JAPAN
#define JPN_MSG_OFFSET -0x2C0
#else
#define JPN_MSG_OFFSET 0
#endif

extern void LogMessageByIdWithPopupCheckUserTarget(struct entity *user, struct entity *target, u32 message_id);

void EndBurnClassStatus(struct entity *user, struct entity *target)
{
    struct monster *entityInfo;

    if (!EntityIsValid__02305C04(target))
        return;

    entityInfo = GetEntInfo(target);
    SubstitutePlaceholderStringTags(0, target, 0);
    switch (entityInfo->burn_class_status.burn) {
        case STATUS_BURN_NONE:
        case 5:
            break;
        case STATUS_BURN_POISONED:
        case STATUS_BURN_BADLY_POISONED:
            LogMessageByIdWithPopupCheckUserTarget(user, target, 0xc9e + JPN_MSG_OFFSET);
            break;
        case STATUS_BURN_PARALYSIS:
            LogMessageByIdWithPopupCheckUserTarget(user, target, 0xc9c + JPN_MSG_OFFSET);
            break;
        case STATUS_BURN_BURN:
            LogMessageByIdWithPopupCheckUserTarget(user, target, 0xc9d + JPN_MSG_OFFSET);
            break;
    }
    entityInfo->burn_class_status.burn = STATUS_BURN_NONE;
    UpdateStatusIconFlags(target);
}
