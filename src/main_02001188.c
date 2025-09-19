#include "main_02001188.h"

extern void MemLocateUnset(struct mem_arena *arena, void *ptr);

void MemFree(void * ptr)
{
    MemLocateUnset(0, ptr);
}
