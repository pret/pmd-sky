#include "fixed_room_data.h"

extern struct fixed_room_properties_entry ov10_022C6C74[10];

bool8 AreMovesEnabled(enum fixed_room_id fixed_room_id)
{
    return FIXED_ROOM_PROPERTIES_TABLE[fixed_room_id].moves_enabled;
}

bool8 IsRoomIlluminated(enum fixed_room_id fixed_room_id)
{
    return FIXED_ROOM_PROPERTIES_TABLE[fixed_room_id].illuminated;
}

