#include "main_020027E8.h"

extern volatile struct unk_0229B0E0 _0229B0E0;

extern void sub_02002670(void);

extern void sub_020026B8(void);

extern struct unk_020027E8 *sub_02002580(void);

void sub_020027E8(struct unk_020027E8 *p)
{
    OS_WakeupThreadDirect(p->field_0x0);
}

u32 sub_020027F8(struct unk_020027E8 *p, u32 prio)
{
    u32 old;

    old = OS_GetThreadPriority(p->field_0x0);
    OS_SetThreadPriority(p->field_0x0, prio);
    return old;
}

u32 sub_02002824(u32 prio)
{
    OSThread *thread;
    u32 old;

    thread = OSi_ThreadInfo.current;
    old = OS_GetThreadPriority(thread);
    OS_SetThreadPriority(thread, prio);
    return old;
}

void sub_02002858(struct unk_020027E8 *p, s32 v)
{
    p->field_0x14 = v;
}

s32 sub_02002860(struct unk_020027E8 *p)
{
    if (p != NULL && p->field_0x0 != NULL) {
        return p->field_0x14;
    }

    return 0;
}

bool8 sub_02002878(s32 v)
{
    struct unk_020027E8 *p;

    p = sub_02002580();

    if (p != NULL) {
        return p->field_0x14 == v;
    }

    return 0;
}

void sub_020028AC(void)
{

}

void sub_020028B0(OSMutex *mutex)
{
    OS_InitMutex(mutex);
    OS_LockMutex(mutex);
    sub_02002670();
    _0229B0E0.field_0x0 += 1;

    if (_0229B0E0.field_0x0 > _0229B0E0.field_0x4) {
        _0229B0E0.field_0x4 = _0229B0E0.field_0x0;
    }

    sub_020026B8();
}

void sub_020028F8(OSMutex *mutex)
{
    OS_UnlockMutex(mutex);
}

void sub_02002904(OSMutex *mutex)
{
    OS_LockMutex(mutex);
}
