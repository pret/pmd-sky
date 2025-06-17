#include "overlay_29_02301118.h"
#include "direction.h"

extern bool8 ov29_02301158(struct entity *monster, s32 direction);

bool8 IsMonsterCornered(struct entity *monster)
{
    for (u8 i = 0; i < NUM_DIRECTIONS; i++)
    {
        if (ov29_02301158(monster, i))
        {
            return TRUE;
        }
    }
    return FALSE;
}
