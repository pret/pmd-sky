#include "overlay_29_022DC61C.h"

#include "main_0200330C.h"

extern void ov29_022DC2B8(u8 *p);
extern void ov29_022DC33C(u8 *p);

extern u8 ov29_023538B4[0x0001963C];
extern u8 *ov29_023534E0;

extern void ov29_022DC544(s32);
extern void ov29_022DC240(u8*);
extern void ov29_022DC314(u8*, u8*);

void ov29_022DC61C()
{
    MemZero(ov29_023538B4, sizeof(ov29_023538B4));
    ov29_022DC544(0);
    ov29_022DC240(ov29_023538B4);
    ov29_022DC314(ov29_023538B4, ov29_023534E0);
}

void ov29_022DC65C(void)
{
    ov29_022DC2B8(ov29_023538B4);
}

void ov29_022DC670(void)
{
    ov29_022DC33C(ov29_023538B4);
}
