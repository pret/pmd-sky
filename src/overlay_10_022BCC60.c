#include "overlay_10_022BCC60.h"

extern void sub_020331AC(void*, u32);
extern void* GetWindowContents(s32 window_id);

void ov10_022BCC60(u32 unused, u32 r1)
{
    sub_020331AC(GetWindowContents(unused) + 4, r1);
}
