#include "main_0206C98C.h"
#include "dc_envelope.h"

void DseMem_Quit(void)
{
    DRIVER_WORK.heap_start=0;
    DRIVER_WORK.heap_end=0;
    DRIVER_WORK.heap_size=0;
}

void* DseMem_AllocateUser(u32 size, u32 alignment)
{
    DseMem_Allocate(size,alignment,0x72657375);
}

void* DseMem_Allocate(u32 size, u32 alignment, u32 label);