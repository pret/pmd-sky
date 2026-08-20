#ifndef PMDSKY_OVERLAY_00_0230E3E8_H
#define PMDSKY_OVERLAY_00_0230E3E8_H

#include "util.h"

struct unk_0230E3E8 {
    u32 field_0x0;
    u16 field_0x4;
    u8 field_0x6[6];
    s32 field_0xC;
    u8 field_0x10[0x20];
    void *field_0x30;
    u8 field_0x34[0xC];
    void *field_0x40;
    u8 field_0x44[0x10];
    u32 field_0x54;
    u32 field_0x58;
};

struct unk_0230E420 {
    s32 field_0x0;
    u32 field_0x4;
    u16 field_0x8;
};

s32 Gt2GetConnectionState(struct unk_0230E3E8* c);
u32 Gt2GetRemoteIP(struct unk_0230E3E8* c);
u16 Gt2GetRemotePort(struct unk_0230E3E8* c);
u32 Gt2GetLocalIP(struct unk_0230E420* s);
u16 Gt2GetLocalPort(struct unk_0230E420* s);
u32 Gt2GetOutgoingBufferSize(struct unk_0230E3E8* c);
u32 Gt2GetOutgoingBufferFreeSpace(struct unk_0230E3E8* c);
s32 Gt2GetSocketSocket(struct unk_0230E420* s);
void Gt2SetUnrecognizedMessageCallback(struct unk_0230E3E8* c, void *callback);
void Gt2SetConnectionData(struct unk_0230E3E8* c, void *data);

#endif
