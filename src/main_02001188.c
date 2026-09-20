#include "main_02001188.h"

extern void *MemLocateSet(struct mem_arena *arena, u32 len, u32 flags);

void* MemAlloc(u32 len, u32 flags)
{
    return MemLocateSet(0, len, flags);
}

extern void MemLocateUnset(struct mem_arena *arena, void *ptr);

void MemFree(void * ptr)
{
    MemLocateUnset(0, ptr);
}
