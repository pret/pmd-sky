#ifndef PMDSKY_MAIN_0200BC54_H
#define PMDSKY_MAIN_0200BC54_H

#include "util.h"

// Fade status. Fade in means increasing brightness and fade out means decreasing.
// As a result, fading the screen to white is considered a fade in.
enum fade_status {
    FADE_NONE = 0,
    FADE_COMPLETE = 1,
    FADE_IN = 2,
    FADE_OUT = 3,
};

// State of the screen fade in all other modes except dungeon mode
struct screen_fade {
    u8 field0_0x0;
    u8 field1_0x1;
    u8 field2_0x2;
    u8 field3_0x3;
    enum fade_status status; // 0x4
    s32 remaining_frames;    // 0x8
    // 0xC: Initial duration of the fade in frames
    s32 duration;
    // 0x10: What brightness the fade ends at. 256 means fade to white, -256 means fade to black
    s16 target_delta_brightness;
    // 0x12: Max absolute value of the brightness during the fade. 256 means a full fade
    s16 max_brightness;
    // 0x14: Current brightness of the fade. Positive numbers turn the screen white, negative to
    // black
    s16 delta_brightness;
};

bool8 HandleFadesVeneer(struct screen_fade *fstruct);

#endif //PMDSKY_MAIN_0200BC54_H
