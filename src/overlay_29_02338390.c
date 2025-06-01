#include "overlay_29_02338390.h"
#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR[];

bool8 GravityIsActive()
{
    return DUNGEON_PTR[0]->gravity;
}
