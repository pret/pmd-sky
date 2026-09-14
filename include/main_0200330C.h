#ifndef PMDSKY_MAIN_0200330C_H
#define PMDSKY_MAIN_0200330C_H

#include "util.h"
#include <file.h>

void ZInit8(struct iovec* ptr);
bool8 PointsToZero(struct iovec* ptr);
void MemZero(u8* ptr, s32 len);
void MemZero16(u16* ptr, s32 len);
void MemZero32(u32* ptr, s32 len);
void MemsetSimple(u8* ptr, u8 val, s32 len);
void Memset32(u32* ptr, u32 val, s32 len);
void MemcpySimple(u8* dest, u8* src, s32 n);
void Memcpy16(u16* dest, u16* src, s32 n);
void Memcpy32(u32* dest, u32* src, s32 n);
struct unk_020027E8;

struct unk_020AEFB4 {
    void (*field_0x0)(void *);
    void *field_0x4;
    u32 field_0x8;
    u32 field_0xc;
    u32 field_0x10;
};

struct unk_020AEF7C {
    u8 field_0x0;
    u8 field_0x1;
    u8 field_0x2;
    u8 field_0x3;
    u8 field_0x4;
    u8 field_0x5;
    u8 field_0x6;
    u8 field_0x7;
    u8 field_0x8;
    u8 field_0x9;
    u8 field_0xa;
    u8 field_0xb;
    u8 field_0xc;
    u8 field_0xd;
    u8 field_0xe;
    u8 field_0xf;
    u8 (*field_0x10)(void);
    s32 field_0x14;
    u8 (*field_0x18)(void);
    volatile s32 field_0x1c;
    volatile s32 field_0x20;
    struct unk_020027E8 *field_0x24;
    s32 field_0x28;
    s32 field_0x2c;
    s32 field_0x30;
    struct unk_020027E8 *field_0x34;
    struct unk_020AEFB4 field_0x38;
    struct unk_020AEFB4 field_0x4c;
};

extern struct unk_020AEF7C _020AEF7C;

void TaskProcBoot(void);
u16 EnableAllInterrupts(void);
void sub_02003620(void *arg);
void sub_02003704(void);
void sub_02003754(void *arg);
void sub_02003780(void *arg);
s32 sub_020037A4(void);

#endif //PMDSKY_MAIN_0200330C_H
