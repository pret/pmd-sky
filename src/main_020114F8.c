#include "main_020114F8.h"
#include "main_02001188.h"

void SwapShopFreeDoublePointer(void** p)
{
    if (*p == NULL) {
        return;
    }
    MemFree(*(void **)*p);
    MemFree(*p);
    *p = NULL;
}
