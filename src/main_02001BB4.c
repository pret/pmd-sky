#include "main_02001BB4.h"

extern s32 UFixedPoint64CmpLt(s32, u32, s32, u32);

u32 sub_02001BB4(s32 x, s32 y)
{
    u32 var_r4;
    u32 var_r5;
    s32 var_r6;
    u32 var_r7;
    
    u32 var_r8;
    
    if (y == 0) {
        return 0x7FFFFFFFU;
    }
    if (x == 0) {
        return 0U;
    }
    
    var_r8 = 0;
    
    var_r4 = 0;
    var_r5 = 0;
    var_r6 = (x >> 0x18) & 0xFF;
    var_r7 = (x << 8) & ~0xFF;
    
    for (int i = 0; i < 0x40; i++) {
        // 128-bit left shift by 1
        var_r4 = (var_r4 << 1);
        if (var_r5 & 0x80000000) {
            var_r4 |= 1;
        }
        var_r5 = (var_r5 << 1) & ~1;
        if (var_r6 & 0x80000000) {
            var_r5 |= 1;
        }
        var_r6 = (var_r6 << 1);
        if (var_r7 & 0x80000000) {
            var_r6 |= 1;
        }
        var_r7 = (var_r7 << 1) & ~1;
        
        bool8 var_r1;
        if (UFixedPoint64CmpLt(var_r4, var_r5, 0, y) == 0) {
            u32 temp_r0 = var_r5;
            var_r5 -= y;
            var_r1 = TRUE;
            if (temp_r0 < var_r5) {
                var_r4 -= 1;
            }
        } else {
            var_r1 = FALSE;
        }
        
        var_r8 = (var_r8 << 1) & ~1;
        if (var_r1) {
            var_r8 |= 1;
        }
    }
    
    return var_r8;
}

void IntToFixedPoint64(struct fixed_point_64* out, s32 x)
{
    out->upper = (u32) (x & ~0xFFFF) >> 0x10;
    out->lower = x << 0x10;
    if (x & 0x8000) {
        out->upper = out->upper | ~0xFFFF;
    }
}
