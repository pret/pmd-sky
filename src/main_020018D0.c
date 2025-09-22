#include "main_020018D0.h"

extern const s16 SIN_TABLE[];

s32 SinAbs4096(s32 x)
{
    // From what I can tell, the sine table only has values for quarter 1, and the code accesses it in different ways based on what quarter the angle falls in.
    // Doing it this way saves 3 kibibytes of memory in table values, if my math is mathing.
    switch (x & 0xc00) {
        case 0x000: // quarter 1 angle
            return SIN_TABLE[x & 0x3ff];
        case 0x400: // quarter 2 angle
            return SIN_TABLE[0x3ff - (x & 0x3ff)];
        case 0x800: // quarter 3 angle
            return -SIN_TABLE[x & 0x3ff];
        case 0xc00: // quarter 4 angle
            return -SIN_TABLE[0x3ff - (x & 0x3ff)];
        default: // redundant? shouldn't ever happen.
            return 0; 
    }
}

s32 CosAbs4096(s32 x)
{
    // Identical to SinAbs4096, but different quarters are handled differently. This works due to the relation between cosine and sine.
    switch (x & 0xc00) {
        case 0x000: // quarter 1 angle
            return SIN_TABLE[0x3ff - (x & 0x3ff)];
        case 0x400: // quarter 2 angle
            return -SIN_TABLE[x & 0x3ff];
        case 0x800: // quarter 3 angle
            return -SIN_TABLE[0x3ff - (x & 0x3ff)];
        case 0xc00: // quarter 4 angle
            return SIN_TABLE[x & 0x3ff];
        default: // redundant? shouldn't ever happen.
            return 0; 
    }
}
