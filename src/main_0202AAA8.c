#include "main_0202AAA8.h"

void MemFree(void *ptr);
void DeleteWindow(s32 window_id);

void SetParentMenuState7(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);

    menu->field_0x19C = 7;
}

void CloseParentMenu(s32 window_id)
{
    struct unk_0202AAA8 *menu = GetWindowContents(window_id);

    MemFree(menu->field_0x198);
    MemFree(menu);
    DeleteWindow(window_id);
}
