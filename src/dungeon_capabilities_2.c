#include "dungeon_capabilities_2.h"
#include "dungeon_util.h"

bool8 CheckVariousStatuses(struct entity *pokemon)
{
    struct monster *pokemon_info = GetEntInfo(pokemon);

    if (pokemon_info->sleep_class_status.sleep != SLEEP_STATUS_SLEEPLESS &&
        pokemon_info->sleep_class_status.sleep != SLEEP_STATUS_YAWNING &&
        pokemon_info->sleep_class_status.sleep != STATUS_NONE)
        return TRUE;
    if (pokemon_info->frozen_class_status.freeze == FROZEN_STATUS_FROZEN)
        return TRUE;
    if (pokemon_info->frozen_class_status.freeze == FROZEN_STATUS_PETRIFIED)
        return TRUE;
    if (pokemon_info->bide_class_status.bide == BIDE_STATUS_BIDE)
        return TRUE;

    return FALSE;
}
