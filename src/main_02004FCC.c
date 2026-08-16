#include "main_02004FCC.h"

void Rgb8ToRgb5(u16 *dest, u32 *color)
{
    u8 *c = (u8 *)color;

    *dest = ((c[2] & 0xf8) << 7) | ((c[1] & 0xf8) << 2) | ((c[0] & 0xf8) >> 3);
}
