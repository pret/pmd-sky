#include "overlay_13_0238BE4C.h"
#include "overlay_13_0238BDA8.h"

extern struct Overlay13Main *PERSONALITY_TEST_PTR;

void WaitForNextStep(s32 state) {
    PERSONALITY_TEST_PTR->unk20 = 0x3A;
    PERSONALITY_TEST_PTR->unk30 = state;
}
