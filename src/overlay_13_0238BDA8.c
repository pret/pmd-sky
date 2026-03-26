#include "overlay_13_0238BDA8.h"

extern struct Overlay13Main *PERSONALITY_TEST_PTR;

s32 GetPersonality(void) {
    s32 index;
    s32 uVar2 = 0;
    s32 ret = 0;
    for(index = 0; index < 0x10; index++)
    {
        s32 temp = (PERSONALITY_TEST_PTR->unk34[index] + PERSONALITY_TEST_PTR->unk44[index]);

        if(uVar2 < temp)
        {
            ret = index;
            uVar2 = temp;
        }
    }
    return ret;
}
