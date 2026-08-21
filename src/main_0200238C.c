#include "main_0200238C.h"

extern void OS_ResetSystem(u32 a);

extern void CardPullOut(void);

extern s32 sub_020024D4(void);

extern void Card_SetPulledOutCallback(s32 (*cb)(void));

extern const u8 _02092464[];

extern void Debug_Print0(const u8* fmt, ...);

extern void sub_02003AD0(void);

extern void *sub_02002580(void);

extern u32 sub_020027F8(void *p, u32 prio);

extern s32 _0229AFE4[8];

s8 sub_0200238C(s8 c)
{
    if (c < 'A') {
        return c;
    }

    if (c <= 'Z') {
        c = (s8) (c + 0x20);
    }

    return c;
}

void sub_020023A8(s8 *dst, s8 *src, s32 n)
{
    s32 i;

    for (i = 0; i < n; i++) {
        s8 c = *src;

        if (c == 0) {
            for (; i < n; i++) {
                *dst++ = ' ';
            }

            break;
        }

        src++;
        *dst++ = c;
    }

    *dst = 0;
}

s32 sub_020023F8(s8 *a, s8 *b, s32 n)
{
    s32 i;

    for (i = 0; i < n; i++) {
        s8 ca = *a++;
        s8 cb = *b++;

        if (cb != ca) {
            return 0;
        }

        if (ca == 0) {
            return 1;
        }
    }

    return 1;
}

void WaitForever(void)
{
    OS_DisableScheduler();

    while (TRUE) {
        WaitForInterrupt();
    }
}

void sub_02002448(u32 a)
{
    sub_02003AD0();
    sub_020027F8(sub_02002580(), 1);
    OS_DisableScheduler();
    GX_DispOff();
    *(vu32 *) 0x04001000 &= ~0x10000;
    Debug_Print0(_02092464, a);
    OS_ResetSystem(a);
    OS_DisableScheduler();

    while (TRUE) {
        WaitForInterrupt();
    }
}

s32 sub_020024A0(void)
{
    return *(vu32 *) 0x027FFC20;
}

void sub_020024B0(void)
{
    Card_SetPulledOutCallback(NULL);
}

void sub_020024C0(void)
{
    Card_SetPulledOutCallback(sub_020024D4);
}

s32 sub_020024D4(void)
{
    CardPullOut();
    return 0;
}
