#ifndef PMDSKY_MAIN_020027E8_H
#define PMDSKY_MAIN_020027E8_H

#include "util.h"

struct unk_020027E8 {
    OSThread *field_0x0;
    u8 field_0x4[0x10];
    s32 field_0x14;
};

struct unk_0229B0E0 {
    s32 field_0x0;
    s32 field_0x4;
};

void sub_020027E8(struct unk_020027E8 *p);
u32 sub_020027F8(struct unk_020027E8 *p, u32 prio);
u32 sub_02002824(u32 prio);
void sub_02002858(struct unk_020027E8 *p, s32 v);
s32 sub_02002860(struct unk_020027E8 *p);
bool8 sub_02002878(s32 v);
void sub_020028AC(void);
void sub_020028B0(OSMutex *mutex);
void sub_020028F8(OSMutex *mutex);
void sub_02002904(OSMutex *mutex);

#endif
