#include "overlay_29_0234AFFC.h"
#include "main_0200C4FC.h"

struct unk_023537CC {
    bool8 field_0x0;
    u8 field_0x1;
    u8 field_0x2;
    u8 field_0x3;
    u8 *field_0x4;
};

extern struct unk_023537CC MESSAGE_LOG_INFO;

void ov29_0234AFFC(u8 value)
{
    MESSAGE_LOG_INFO.field_0x4[0xCED] = value;
}

void ov29_0234B010(u8 value)
{
    MESSAGE_LOG_INFO.field_0x4[0xCEE] = value;
}
