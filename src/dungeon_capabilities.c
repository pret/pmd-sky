#include "dungeon_capabilities.h"
#include "dungeon_statuses.h"
#include "dungeon_util_static.h"

extern bool8 CheckVariousStatuses(struct entity *entity);

bool8 CheckVariousStatuses2(struct entity *entity, bool8 blind_check)
{
    struct monster *pokemon_info = GetEntInfo(entity);

    if ((blind_check && IsBlinded(entity, TRUE)))
        return TRUE;
    if (pokemon_info->sleep_class_status.sleep == STATUS_SLEEP_SLEEP)
        return TRUE;
    if (pokemon_info->sleep_class_status.sleep == STATUS_SLEEP_NAPPING)
        return TRUE;
    if (pokemon_info->sleep_class_status.sleep == STATUS_SLEEP_NIGHTMARE)
        return TRUE;
    if (pokemon_info->cringe_class_status.cringe == STATUS_CRINGE_PAUSED)
        return TRUE;
    if (pokemon_info->cringe_class_status.cringe == STATUS_CRINGE_INFATUATED)
        return TRUE;
    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_WRAP)
        return TRUE;
    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_WRAPPED)
        return TRUE;
    if (CheckVariousStatuses(entity))
        return TRUE;
    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_PETRIFIED)
        return TRUE;
    if (pokemon_info->terrified_turns != 0)
        return TRUE;

    return FALSE;
}
