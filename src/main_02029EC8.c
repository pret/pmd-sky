#include "main_02029EC8.h"

u32 Arm9LoadUnkFieldNa0x2029EC8(u32 i, u8 *unused)
{
    return PREV_MENU_ITEMS[i];
}

void Arm9StoreUnkFieldNa0x2029ED8(u32 i, u8 v)
{
    PREV_MENU_ITEMS[i] = v;
}
