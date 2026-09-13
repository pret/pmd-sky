#include "overlay_29_022E9FC0.h"

extern void ov29_022EA2A4(u32 param_1);
extern void ov29_022EA324(u32 param_1);

struct unk_02353560 {
    u8 field_0x0;
    u8 field_0x1;
    u8 field_0x2;
    u8 field_0x3;
    u8 field_0x4;
};

extern struct unk_02353560 ov29_02353560;

u8 ov29_022E9FC0(void)
{
    return ov29_02353560.field_0x3;
}

void ov29_022E9FD0(u8 value)
{
    ov29_02353560.field_0x3 = value;
}

void AdvanceFrame(u32 param_1)
{
    if (ov29_02353560.field_0x3) {
        ov29_022EA2A4(param_1);
    }
    else {
        ov29_022EA324(param_1);
    }
}
