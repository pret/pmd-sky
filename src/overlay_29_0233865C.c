#include "overlay_29_0233865C.h"
#include "dungeon.h"

extern struct dungeon *DUNGEON_PTR;

bool8 IsSecretRoom(void)
{
    return DUNGEON_PTR->gen_info.fixed_room_id == FIXED_SECRET_ROOM;
}
