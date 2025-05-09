#include "dungeon_logic_0.h"
#include "dungeon_util_static.h"

bool8 IsMonsterDrowsy(struct entity *monster)
{
    struct monster *pokemon_info = GetEntInfo(monster);
    if (pokemon_info->sleep_class_status.sleep == STATUS_SLEEP_SLEEP)
        return TRUE;

    if (pokemon_info->sleep_class_status.sleep == STATUS_SLEEP_NIGHTMARE)
        return TRUE;

    if (pokemon_info->sleep_class_status.sleep == STATUS_SLEEP_YAWNING)
        return TRUE;

    return FALSE;
}
