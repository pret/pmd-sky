#include <nitro.h>

extern void MI_SetWramBank(u32);
extern void MI_StopDma(u32);

#define MI_WRAM_ARM7_ALL 3

void MI_Init (void)
{
#ifdef SDK_ARM9
    MI_SetWramBank(MI_WRAM_ARM7_ALL);
#endif

    MI_StopDma(0);
}
