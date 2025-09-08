#include "main_0204DA2C.h"
#include "main_0200330C.h"

extern u8 ARM9_UNKNOWN_TABLE__NA_209E164[];

extern void sub_02050990(u8*, u8*, s32);
extern void CopyBitsTo(u8* write_info, void* buf_write, s32 nbits);
extern void sub_020509BC(u8*);

s32 sub_0204DA2C(u8* arg0, void* arg1, u8 arg2)
{
    u8 tmp3[16];
    u8 tmp2[54];
    u8 tmp1[34];

    for (int i = 0; i < 34; i++) {
        tmp1[i] = 0;
    }

    for (int i = 0; i < arg2; i++) {
        tmp2[i] = ARM9_UNKNOWN_TABLE__NA_209E164[*arg0];
        if (tmp2[i] == 0xff) {
            return 0;
        }

        arg0++;
    }

    s32 v1 = arg2 * 5;
    s32 v2 = (v1 & 7) + 7;
    sub_02050990(tmp3, tmp1, (v1 >> 3) + (v2 >> 3));

    for (int i = 0; i < arg2; i++) {
        CopyBitsTo(tmp3, &tmp2[i], 5);
    }

    sub_020509BC(tmp3);
    MemcpySimple(arg1, tmp1, (v1 >> 3) + (v2 >> 3));
    return 1;
}
