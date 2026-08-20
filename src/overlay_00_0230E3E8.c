#include "overlay_00_0230E3E8.h"

s32 Gt2GetConnectionState(struct unk_0230E3E8* c)
{
    s32 state = c->field_0xC;

    if (state < 5) {
        return 0;
    }

    if (state == 5) {
        return 1;
    }

    if (state == 6) {
        return 2;
    }

    return 3;
}

u32 Gt2GetRemoteIP(struct unk_0230E3E8* c)
{
    return c->field_0x0;
}

u16 Gt2GetRemotePort(struct unk_0230E3E8* c)
{
    return c->field_0x4;
}

u32 Gt2GetLocalIP(struct unk_0230E420* s)
{
    return s->field_0x4;
}

u16 Gt2GetLocalPort(struct unk_0230E420* s)
{
    return s->field_0x8;
}

u32 Gt2GetOutgoingBufferSize(struct unk_0230E3E8* c)
{
    return c->field_0x54;
}

u32 Gt2GetOutgoingBufferFreeSpace(struct unk_0230E3E8* c)
{
    return c->field_0x54 - c->field_0x58;
}

s32 Gt2GetSocketSocket(struct unk_0230E420* s)
{
    return s->field_0x0;
}

void Gt2SetUnrecognizedMessageCallback(struct unk_0230E3E8* c, void *callback)
{
    c->field_0x30 = callback;
}

void Gt2SetConnectionData(struct unk_0230E3E8* c, void *data)
{
    c->field_0x40 = data;
}
