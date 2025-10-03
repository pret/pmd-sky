#include "dungeon_logic_7.h"

#include "dungeon_logic_6.h"
#include "dungeon_mode.h"
#include "util.h"

bool8 IsLoneOutlawVeneer(struct monster* monster_info)
{
    return IsLoneOutlaw(monster_info->monster_behavior);
}
