#include "fixed_room_data.h"

bool8 AreMovesEnabled(enum fixed_room_id fixed_room_id)
{
    return FIXED_ROOM_PROPERTIES_TABLE[fixed_room_id].moves_enabled;
}
