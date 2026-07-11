#include "main_02001CD4.h"

void FixedPoint32To64(struct fixed_point_64* out, s32 x)
{
    out->lower = (s32) (x << 8);
    out->upper = x >> 0x18;
    
    if (out->upper & 0x80) {
        out->upper |= ~0x7F;
    } else {
        out->upper &= 0x7F;
    }
}
