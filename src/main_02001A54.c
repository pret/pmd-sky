#include "main_02001A54.h"

extern s32 UMultiplyByFixedPoint(s32, s32);
extern s32 sub_02001BB4(s32, s32);

s32 MultiplyByFixedPoint(s32 x, s32 y)
{
    s32 result;
    bool8 xNeg;
    bool8 yNeg;

    // Same as checking if x < 0 and y < 0
    if (x & 0x80000000) {
        xNeg = TRUE;
    } else {
        xNeg = FALSE;
    }
    if (y & 0x80000000) {
        yNeg = TRUE;
    } else {
        yNeg = FALSE;
    }
    
    if (x == 0) {
        return 0;
    }
    if (y == 0) {
        return 0;
    }
    
    if (xNeg) {
        x = -x;
    }
    if (yNeg) {
        y = -y;
    }
    
    result = UMultiplyByFixedPoint(x, y);
    if (xNeg != yNeg) {
        result = -result;
    }
    return result;
}

s32 sub_02001AB0(s32 x, s32 y)
{
    s32 result;
    bool8 xNeg;
    bool8 yNeg;

    // Same as checking if x < 0 and y < 0
    if (x & 0x80000000) {
        xNeg = TRUE;
    } else {
        xNeg = FALSE;
    }
    if (y & 0x80000000) {
        yNeg = TRUE;
    } else {
        yNeg = FALSE;
    }
    
    if (y == 0) {
        return 0x7FFFFFFF;
    }
    if (x == 0) {
        return 0;
    }
    
    if (xNeg) {
        x = -x;
    }
    if (yNeg) {
        y = -y;
    }
    
    result = sub_02001BB4(x, y);
    if (xNeg != yNeg) {
        result = -result;
    }
    return result;
}
