#include "overlay_29_022DC61C.h"

#include "main_0200330C.h"
#include "poly_text.h"

extern struct unk_ov29_022DC240_t ov29_023538B4;
extern u8 *ov29_023534E0;

void ov29_022DC61C()
{
    MemZero((u8 *)&ov29_023538B4, sizeof(ov29_023538B4));
    ov29_022DC544(0);
    ov29_022DC240(&ov29_023538B4);
    ov29_022DC314(&ov29_023538B4, ov29_023534E0);
}

void ov29_022DC65C(void)
{
    ov29_022DC2B8(&ov29_023538B4);
}

void ov29_022DC670(void)
{
    ov29_022DC33C((u8 *)&ov29_023538B4);
}
