#include "overlay_13_0238BDA8.h"

extern struct Overlay13Main *OVERLAY13_UNKNOWN_POINTER__NA_238CEA0;

s32 GetPersonality(void) {
    s32 index;
    s32 uVar2 = 0;
    s32 ret = 0;
    for(index = 0; index < 0x10; index++)
    {
        s32 temp = (OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk34[index] + OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk44[index]);

        if(uVar2 < temp)
        {
            ret = index;
            uVar2 = temp;
        }
    }
    return ret;
}
