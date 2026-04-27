#include "main_0202A388.h"

extern u8* _020AFDA8;

extern void sub_0201F2A0(u8*);

void sub_0202A388(void)
{
    u8* ptr;
    s32 i;

    i = 0;
    ptr = _020AFDA8 + 0x244;
    if ((s32)*(u16*)(_020AFDA8 + 0x484) <= 0) {
        return;
    }
    while (i < *(u16*)(_020AFDA8 + 0x484)) {
        sub_0201F2A0(ptr + 4);
        i = (s16)(i + 1);
        ptr += 0x48;
    }
}
