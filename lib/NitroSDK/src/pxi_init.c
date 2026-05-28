#include <nitro.h>

extern void PXI_InitFifo(void);

void PXI_Init (void)
{
    PXI_InitFifo();
}
