#include "overlay_29_02306728.h"
#include "overlay_29_02305C04.h"
#include "dungeon_util_2.h"
#include "overlay_29_022E3F20.h"
#include "dungeon.h"
#include "dungeon_util_static.h"
#include "overlay_29_0234B104.h"

extern struct dungeon *DUNGEON_PTR[];

extern s32 GetIdleAnimationId(struct entity *entity);
extern int ov29_02304830();
extern void TryRemoveSnatchedMonsterFromDungeonStruct(struct entity *user, struct entity *target);
extern void ov29_022FB984(struct entity *entity);

#ifdef JAPAN
#define JPN_MSG_OFFSET -0x2C0
#else
#define JPN_MSG_OFFSET 0
#endif

void EndCurseClassStatus(struct entity *user, struct entity *target, u8 next_curse_class_status_being_applied, bool8 log_message)
{
    struct monster *entityInfo;

    if (!EntityIsValid__02305C04(target))
        return;

    entityInfo = GetEntInfo(target);
    SubstitutePlaceholderStringTags(0, target, 0);

    switch (entityInfo->curse_class_status.curse) {
    case STATUS_CURSE_NONE:
    case 7:
        break;
    case STATUS_CURSE_CURSED:
        if (next_curse_class_status_being_applied != STATUS_CURSE_CURSED && log_message)
            LogMessageByIdWithPopupCheckUser(target, 0xc95 + JPN_MSG_OFFSET);
        break;
    case STATUS_CURSE_SNATCH:
        if (next_curse_class_status_being_applied != STATUS_CURSE_SNATCH && log_message)
            LogMessageByIdWithPopupCheckUser(target, 0xc96 + JPN_MSG_OFFSET);
        TryRemoveSnatchedMonsterFromDungeonStruct(user, target);
        break;
    case STATUS_CURSE_DECOY:
        entityInfo->curse_class_status.curse = STATUS_CURSE_NONE;
        ov29_02304830(target, GetIdleAnimationId(target));
        DUNGEON_PTR[0]->decoy_is_active = FALSE;
        if (next_curse_class_status_being_applied != STATUS_CURSE_DECOY) {
            SubstitutePlaceholderStringTags(0, target, 0);
            if (log_message)
                LogMessageByIdWithPopupCheckUser(target, 0xca5 + JPN_MSG_OFFSET);
        }
        break;
    case STATUS_CURSE_GASTRO_ACID:
        entityInfo->curse_class_status.curse = STATUS_CURSE_NONE;
        ov29_022FB984(target);
        if (log_message)
            LogMessageByIdWithPopupCheckUser(target, 0xcbf + JPN_MSG_OFFSET);
        DUNGEON_PTR[0]->activate_artificial_weather_flag = TRUE;
        break;
    case STATUS_CURSE_HEAL_BLOCK:
        if (log_message)
            LogMessageByIdWithPopupCheckUser(target, 0xcc2 + JPN_MSG_OFFSET);
        break;
    case STATUS_CURSE_EMBARGO:
        if (log_message)
            LogMessageByIdWithPopupCheckUser(target, 0xcc3 + JPN_MSG_OFFSET);
        break;
    }

    entityInfo->curse_class_status.curse = STATUS_CURSE_NONE;
    UpdateStatusIconFlags(target);
}
