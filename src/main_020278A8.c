#include "main_020278A8.h"
#include "window.h"

extern u8 *_020AFC70;

u16* GetPaletteBaseAddress__020278A8(s32 a, s32 b)
{
    return &(*(u16 **)(_020AFC70 + 0xE0))[(a << 8) + b];
}
