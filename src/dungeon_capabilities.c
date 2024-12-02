#include "dungeon_capabilities.h"
#include "dungeon_util.h"

extern bool8 IsBlinded(struct entity *entity, bool8 check_held_item);
extern bool8 CheckVariousStatuses(struct entity *entity);

bool8 CheckVariousStatuses2(struct entity *entity, bool8 blind_check)
{
    struct monster *pokemon_info = GetEntInfo(entity);

    if ((blind_check && IsBlinded(entity, TRUE)))
        return TRUE;
    if (pokemon_info->sleep_class_status.sleep == SLEEP_STATUS_SLEEP)
        return TRUE;
    if (pokemon_info->sleep_class_status.sleep == SLEEP_STATUS_NAPPING)
        return TRUE;
    if (pokemon_info->sleep_class_status.sleep == SLEEP_STATUS_NIGHTMARE)
        return TRUE;
    if (pokemon_info->cringe_class_status.cringe == CRINGE_STATUS_PAUSED)
        return TRUE;
    if (pokemon_info->cringe_class_status.cringe == CRINGE_STATUS_INFATUATED)
        return TRUE;
    if (pokemon_info->frozen_class_status.freeze == FREEZE_STATUS_WRAPPED)
        return TRUE;
    if (pokemon_info->frozen_class_status.freeze == FREEZE_STATUS_WRAP)
        return TRUE;
    if (CheckVariousStatuses(entity))
        return TRUE;
    if (pokemon_info->frozen_class_status.freeze == FREEZE_STATUS_PETRIFIED)
        return TRUE;
    if (pokemon_info->terrified_turns != 0)
        return TRUE;

    return FALSE;
}
