#include "dungeon_capabilities_2.h"
#include "dungeon_util_static.h"

bool8 CheckVariousStatuses(struct entity *pokemon)
{
    struct monster *pokemon_info = GetEntInfo(pokemon);

    if (pokemon_info->sleep_class_status.sleep != STATUS_SLEEP_SLEEPLESS &&
        pokemon_info->sleep_class_status.sleep != STATUS_SLEEP_YAWNING &&
        pokemon_info->sleep_class_status.sleep != STATUS_SLEEP_NONE)
        return TRUE;
    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_FROZEN)
        return TRUE;
    if (pokemon_info->frozen_class_status.freeze == STATUS_FROZEN_PETRIFIED)
        return TRUE;
    if (pokemon_info->bide_class_status.bide == STATUS_TWO_TURN_BIDE)
        return TRUE;

    return FALSE;
}
