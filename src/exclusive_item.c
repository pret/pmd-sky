#include "exclusive_item.h"

bool8 ExclusiveItemEffectFlagTest(u32 *effect_flags, u32 effect_id)
{
    u32 effect_bit = effect_id >> 5;
    if (effect_flags[effect_bit] & 1 << effect_id - (effect_bit << 5))
        return TRUE;
    return FALSE;
}
