#include "overlay_11_022E7F28.h"
#include "file.h"

extern struct unk_C_ROUTINES C_ROUTINES[];

extern void MemFree(void * ptr);

extern struct unk_02324FA0 UNIONALL_RAM_ADDRESS;

extern char ov11_02319AB4[];

extern u8 ov11_02319AD0[];

extern s32 ov11_022E46E8(struct iovec *iov, const char *filepath);

extern void Debug_Print0(const u8* fmt, ...);

extern void ov11_0230D318(void);

void ov11_022E7F28(void)
{
    ov11_0230D318();
}

void ov11_022E7F34(void)
{
    struct iovec iov;
    u16 *p;

    ov11_022E46E8(&iov, ov11_02319AB4);
    Debug_Print0(ov11_02319AD0, iov.iov_len);
    p = iov.iov_base;
    UNIONALL_RAM_ADDRESS.field_0x0 = p;
    UNIONALL_RAM_ADDRESS.field_0x4 = p + *p;
}

void ov11_022E7F80(void)
{
    MemFree(UNIONALL_RAM_ADDRESS.field_0x0);
    UNIONALL_RAM_ADDRESS.field_0x0 = NULL;
    UNIONALL_RAM_ADDRESS.field_0x4 = NULL;
}

struct unk_C_ROUTINES * ov11_022E7FA8(s32 idx)
{
    return &C_ROUTINES[idx];
}
