#ifndef PMDSKY_UTIL_H
#define PMDSKY_UTIL_H

// RGBA8 structure. Sometimes alpha is ignored and only used for padding
struct rgba {
    u8 r;
    u8 b;
    u8 g;
    u8 a; // Sometimes used only for padding
};

// a 2d short (16bit) vector
struct vec2_16 {
    s16 x;
    s16 y;
};

// a 2d ushort (16bit) vector
struct uvec2_16 {
    u16 x;
    u16 y;
};

// a (16b.16b) fixed-point rational
struct fixed_point {
    u16 integer;
    u16 fractional;
};

// Compares two numbers and return the minimum
#define MIN(A, B) ((A > B) ? B : A)

#endif //PMDSKY_UTIL_H
