#include "main_0200BD2C.h"

s32 GetFadeStatus(struct screen_fade *fstruct)
{
    s16 target_delta_brightness = fstruct->target_delta_brightness;
    if (target_delta_brightness == -256)
        return 1;
    if (target_delta_brightness == 256)
        return 2;
    return 0;
}
