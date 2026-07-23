#include "main_0201E380.h"

extern void Rgb8ToRgb5(u16* dest, u32* color);

void sub_0201E380(struct unk_0201E380* a, u32* color, s16 c, s16 d)
{
    Rgb8ToRgb5(&a->field_0x18[(c << 8) + d], color);
    a->field_0x1c[c] = 1;
}
