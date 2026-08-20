#include "main_0204FA24.h"
#include "adventure_log.h"

void SetAdventureLogStructLocation(void)
{
    ADVENTURE_LOG_PTR = &_022AB69C;
}

void SetAdventureLogDungeonFloor(struct dungeon_floor_pair *floor)
{
    ADVENTURE_LOG_PTR->current_floor = *floor;
}

struct dungeon_floor_pair* GetAdventureLogDungeonFloor(void)
{
    return &ADVENTURE_LOG_PTR->current_floor;
}
