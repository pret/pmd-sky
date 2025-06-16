#include "overlay_29_022DC61C.h"
#include "main_0200330C.h"

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
