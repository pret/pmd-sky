#include <nitro.h>

extern void MI_StopDma(u32);

void MI_Init (void)
{
#ifdef SDK_ARM9
    MI_SetWramBank(MI_WRAM_ARM7_ALL);
#endif

    MI_StopDma(0);
}
