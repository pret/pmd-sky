#include "main_020348E4.h"

extern struct struct_02AFDB8* MENU_CONTROL_PTR;
extern u32 OverlayLoadEntriesEqual(struct struct_1*, struct struct_1*);

u32 InitMenu(struct struct_1* src)
{
    if (OverlayLoadEntriesEqual(src, &(MENU_CONTROL_PTR->b)) == 0) {
        if (MENU_CONTROL_PTR->a != 0 && OverlayLoadEntriesEqual(src, &(MENU_CONTROL_PTR->c))) {
            return 0;
        }
        MENU_CONTROL_PTR->a = 1;
        MENU_CONTROL_PTR->d = 0;
        MENU_CONTROL_PTR->c = *src;
        MENU_CONTROL_PTR->e = 0;
        return 1;
    }
    return 0;
}

