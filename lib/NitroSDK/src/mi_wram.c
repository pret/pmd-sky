#include <nitro.h>

void MI_SetWramBank (MIWram cnt)
{
    reg_GX_VRAMCNT_WRAM = (u8)cnt;
}
