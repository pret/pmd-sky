#include "main_02001894.h"

// Divides x by 256, and rounds up to 1 if the division would make x 0.
s32 RoundUpDiv256(s32 x) {
    if (x & 0xFF) x += 0x100;
    return x >> 8;
}
