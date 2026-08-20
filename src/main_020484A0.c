#include "main_020484A0.h"

extern u8 NOTIFY_NOTE;

u8 GetNotifyNote(void)
{
    return NOTIFY_NOTE;
}

void SetNotifyNote(u8 value)
{
    NOTIFY_NOTE = value;
}
