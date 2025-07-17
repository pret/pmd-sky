#include "overlay_31_02383328.h"

extern u8 OVERLAY31_UNKNOWN_POINTER__NA_238A268[];
extern u8 ov31_0238A2A8;

extern u8 sub_0204AEA0(void (*f)(void));
extern void ov29_022E8708();

void ov31_02383328(void (*f)(void))
{
    if (sub_0204AEA0(f) != ov31_0238A2A8) {
        ov29_022E8708();
        OVERLAY31_UNKNOWN_POINTER__NA_238A268[0] = 1;
    }
}
