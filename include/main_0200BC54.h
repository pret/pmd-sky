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
    s32 field_0x0;
    s32 status;
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
    u8 field_0x16[4];
    u8 field_0x1a[0x2A];
};

bool8 HandleFadesVeneer(struct screen_fade *fstruct);
void sub_0200BC60(struct screen_fade *fstruct, s32 a, s32 b, u8 *c);
void sub_0200BCB0(struct screen_fade *fstruct, s32 a, s32 b, u8 *c);
bool8 sub_0200BD14(struct screen_fade *fstruct);

#endif //PMDSKY_MAIN_0200BC54_H
