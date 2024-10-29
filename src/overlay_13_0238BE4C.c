#include "overlay_13_0238BE4C.h"
#include "overlay_13_0238BDA8.h"

extern struct Overlay13Main *OVERLAY13_UNKNOWN_POINTER__NA_238CEA0;

void WaitForNextStep(s32 state) {
    OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk20 = 0x3A;
    OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk30 = state;
}
