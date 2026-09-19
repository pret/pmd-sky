#include "main_0200330C.h"
#include "main_020027E8.h"
#include "main_0200224C.h"
#include "main_0200238C.h"
#include <debug.h>

struct unk_0229B220 {
    u8 field_0x0[0x28];
};

struct unk_020AEFDC {
    OSMutex field_0x0;
    struct unk_020027E8 *field_0x18;
    s32 field_0x1c;
    s32 field_0x20;
};

struct unk_020AF000 {
    OSMessage *field_0x0;
    OSMessage field_0x4;
    OSMessageQueue field_0x8;
};

struct unk_02006C1C {
    u16 field_0x0;
    u16 field_0x2;
    s32 field_0x4;
    s32 field_0x8;
    s32 field_0xc;
    s32 field_0x10;
    s32 field_0x14;
    s32 field_0x18;
    s32 field_0x1c;
    s32 field_0x20;
};

extern struct unk_0229B220 _0229B220;
extern struct unk_020AEFB4 _020AEFB4;
extern struct unk_020AEFB4 _020AEFC8;
extern struct unk_020AEFDC _020AEFDC;
extern struct unk_020AF000 _020AF000;
extern struct unk_020AF000 _020AF028;
extern struct unk_020AF000 _020AF050;
extern struct unk_020027E8 _020AF078;
extern struct unk_020027E8 _020AF154;
extern u8 _0229B248[0x4000];
extern u8 _0229F248[0x4000];
extern u8 _020924D8[];
extern u32 OS_IRQTable[];

void OS_InitVAlarm(void);
void OS_CreateVAlarm(struct unk_0229B220 *alarm);
void OS_SetPeriodicVAlarm(struct unk_0229B220 *alarm, s32 tick, s32 delay,
                          void (*handler)(void *), void *arg);
void OS_SetIrqFunction(u32 mask, void (*func)(void));
u32 OS_EnableIrqMask(u32 mask);
u32 PM_SetLcdPower(u32 sw);

bool8 GetHeldButtons(s32 index, u16 *out);
void GetReleasedStylus(struct unk_02006C1C *out);
void KeyWaitInit(void);
void HaltProcessDisp(s32 a);
void MainLoop(void);

struct unk_020027E8 *sub_02002580(void);
void sub_02002628(void *a, u32 b);
void sub_0200265C(void *a);
void sub_02002670(void);
void sub_020026B8(void);
void sub_02002778(struct unk_020027E8 *task,
                  const struct unk_020AEFB4 *desc, void *arg);
void sub_02002950(struct unk_020AF000 *a);
void sub_020029A0(struct unk_020AF000 *a);
void sub_020029B8(struct unk_020AF000 *a);
void sub_02002A44(struct unk_020AF000 *a);
void sub_02002C40(struct unk_020AEFDC *a);
void sub_020025F8(u32 a);
void sub_02003A40(void);
bool8 sub_02003B5C(void);
void sub_02005EAC(void);
void sub_02006098(void);
void sub_02006D4C(void);
void sub_02006DEC(void);
void sub_020082E0(void);
void sub_020820E8(s32 a, s32 b, s32 c);
void sub_02017D20(void);
void sub_0201849C(void);

void ZInit8(struct iovec* ptr)
{
    ptr->iov_base = NULL;
    ptr->iov_len = 0;
}

bool8 PointsToZero(struct iovec* ptr)
{
    if (ptr->iov_base == NULL) {
        return TRUE;
    } else {
        return FALSE;
    }
}

void MemZero(u8* ptr, s32 len) {
    while (len>0) {
        len-=1;
        *ptr++=0;
    }
}

void MemZero16(u16* ptr, s32 len) {
    while (len>0) {
        len-=2;
        *ptr++=0;
    }
}

void MemZero32(u32* ptr, s32 len) {
    while (len>0) {
        len-=4;
        *ptr++=0;
    }
}

void MemsetSimple(u8* ptr, u8 val, s32 len) {
    while (len>0) {
        len--;
        *ptr++=val;
    }
}

void Memset32(u32* ptr, u32 val, s32 len) {
    while (len>0) {
        len-=4;
        *ptr++=val;
    }
}

void MemcpySimple(u8* dest, u8* src, s32 n)
{
    while (n>0) {
        *dest++ = *src++;
        n -= 1;
    }
}

void Memcpy16(u16* dest, u16* src, s32 n)
{
    while (n>0) {
        *dest++ = *src++;
        n -= 2;
    }
}

void Memcpy32(u32* dest, u32* src, s32 n)
{
    while (n>0) {
        *dest++ = *src++;
        n -= 4;
    }
}

void TaskProcBoot(void)
{
    u32 temp[2];
    u8 (*fn)(void);

    sub_02002950(&_020AF000);
    sub_02002950(&_020AF028);
    sub_02002950(&_020AF050);
    sub_02002C40(&_020AEFDC);
    sub_02006D4C();
    sub_02017D20();

    _020AEF7C.field_0x38.field_0x4 = _0229B248;
    sub_02002778(&_020AF078, &_020AEFB4, NULL);
    sub_020027E8(&_020AF078);

    OS_InitVAlarm();
    OS_CreateVAlarm(&_0229B220);
    OS_SetPeriodicVAlarm(&_0229B220, 0, 100, sub_02003754, NULL);
    OS_SetIrqFunction(1, sub_02003704);
    OS_EnableIrqMask(1);
    EnableAllInterrupts();
    GX_VBlankIntr(TRUE);

    _020AEF7C.field_0x24 = &_020AF154;
    _020AEF7C.field_0x4c.field_0x4 = _0229F248;
    sub_02002778(&_020AF154, &_020AEFC8, NULL);
    sub_020027E8(&_020AF154);

    _020AEF7C.field_0x34 = sub_02002580();
    sub_020027F8(_020AEF7C.field_0x34, 0xF);
    sub_02002858(_020AEF7C.field_0x34, 2);

    fn = NULL;
    _020AEF7C.field_0x5 = 0;
    Debug_Print0(_020924D8);

    while (TRUE) {
        sub_02002628(temp, 0xB);
        if (_020AEF7C.field_0x7 != 0) {
            _020AEF7C.field_0x7 = 0;
        } else {
            sub_02002A44(&_020AF050);
        }

        if (fn != NULL) {
            if (_020AEF7C.field_0x6 != 0 && _020AEF7C.field_0x0 != 0) {
                _020AEF7C.field_0x3 = 1;
                sub_020029A0(&_020AF000);
                sub_02002A44(&_020AF028);
                sub_02002670();
                if (_020AEF7C.field_0x10 == NULL) {
                    fn = NULL;
                }
                sub_020026B8();
            }
        } else {
            sub_02002670();
            fn = _020AEF7C.field_0x10;
            sub_020026B8();
            if (fn != NULL) {
                _020AEF7C.field_0x3 = 1;
                sub_02002A44(&_020AF028);
            }
        }

        sub_0200265C(temp);
        sub_02002670();
        if (_020AEF7C.field_0x10 != NULL) {
            fn = _020AEF7C.field_0x10;
        }
        if (fn != NULL) {
            if (_020AEF7C.field_0x3 != 0) {
                _020AEF7C.field_0x0 = 0;
            }
            _020AEF7C.field_0x18 = fn;
            sub_020026B8();
            _020AEF7C.field_0x30 += 1;
            sub_02006098();
            _020AEF7C.field_0x6 = fn();
        } else {
            sub_020026B8();
            sub_02003A40();
            sub_02002670();
            _020AEF7C.field_0x18 = NULL;
            _020AEF7C.field_0x6 = 1;
            sub_020026B8();
        }

        if (_020AEF7C.field_0xd != 0) {
            sub_020025F8(0);
        }

        if (_020AEF7C.field_0x2 != 0) {
            if (sub_02003B5C()) {
                if (_020AEF7C.field_0x1 != 0) {
                    _020AEF7C.field_0xb = 0;
                    sub_020820E8(0xC, 0, 0);
                } else if (_020AEF7C.field_0x14 == 0) {
                    if (PM_SetLcdPower(0)) {
                        _020AEF7C.field_0x14 = 1;
                    }
                }
            } else if (_020AEF7C.field_0x14 != 0) {
                if (PM_SetLcdPower(1)) {
                    _020AEF7C.field_0x14 = 0;
                }
            }
        }
    }
}

u16 EnableAllInterrupts(void)
{
    u16 old;

    old = reg_OS_IME;
    reg_OS_IME = 1;
    return old;
}

void sub_02003620(void *arg)
{
    u16 buttons;
    struct unk_02006C1C stylus;

    while (TRUE) {
        OS_SleepThread(NULL);
        _020AEF7C.field_0x28 += 1;

        if (_020AEF7C.field_0xd != 0) {
            HaltProcessDisp(0);
        } else if (_020AEF7C.field_0xc != 0) {
            HaltProcessDisp(1);
        }

        if (_020AEF7C.field_0x1 != 0 || !sub_02003B5C() || _020AEF7C.field_0x8 != 0) {
            sub_02006DEC();
            Rand16Bit();
            GetHeldButtons(0, &buttons);
            GetReleasedStylus(&stylus);
            if (buttons != 0 || (stylus.field_0x0 & 1)) {
                Rand16Bit();
            }
        } else {
            KeyWaitInit();
        }

        sub_020029B8(&_020AF050);
        sub_0201849C();
    }
}

void sub_02003704(void)
{
    *(vu32 *)((u32)OS_IRQTable + 0x3ff8) |= 1;
    _020AEF7C.field_0x20 += 1;
    if (_020AEF7C.field_0x9 != 0) {
        OS_WakeupThreadDirect(_020AEF7C.field_0x34->field_0x0);
    }
    sub_020082E0();
}

void sub_02003754(void *arg)
{
    _020AEF7C.field_0x1c += 1;
    OS_WakeupThreadDirect(_020AF078.field_0x0);
}

void sub_02003780(void *arg)
{
    sub_02005EAC();
    _020AEF7C.field_0x0 = 1;
    MainLoop();
    WaitForever();
}

s32 sub_020037A4(void)
{
    return _020AEF7C.field_0x28;
}

