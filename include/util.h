#ifndef PMDSKY_UTIL_H
#define PMDSKY_UTIL_H

typedef s32 fx32_8;        // 32-bit signed fixed-point number with 8 fraction bits
typedef u32 ufx32_8;  // 32-bit unsigned fixed-point number with 8 fraction bits
typedef u8 bool8;

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
    s16 integer;
    s16 fractional;
};

// Compares two numbers and return the minimum
#define MIN(A, B) ((A > B) ? B : A)

// Same as MIN macro but as a static inline, since the macro doesn't match in some places.
static inline s32 Min(s32 a, s32 b)
{
    return a < b ? a : b;
}

static inline s32 Max(s32 a, s32 b)
{
    return a > b ? a : b;
}

#endif //PMDSKY_UTIL_H
