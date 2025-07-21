#include "overlay_10_022C434C.h"

// sub_80ADF8C - Red
s32 ov10_022C434C(s32 a0, s32 a1, s32 a2, s32 a3, u16 *a4, s32 a5)
{
    s32 ret = a5;
    if (a0 < 0)
        return ret;
    if (a1 < 0)
        return ret;
    if (a0 >= a2)
        return ret;
    if (a1 < a3) {
        ret = a4[a0 + (a1 * a2)] & 3;
    }
    return ret;
}
