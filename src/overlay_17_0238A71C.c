#include "overlay_17_0238A71C.h"

extern void sub_0203C760(void);
extern void MemFree(void *);
extern void *OVERLAY17_UNKNOWN_POINTER__NA_238BE00;

void ov17_0238A71C(void)
{
    if (OVERLAY17_UNKNOWN_POINTER__NA_238BE00 == NULL) {
        return;
    }

    sub_0203C760();
    MemFree(OVERLAY17_UNKNOWN_POINTER__NA_238BE00);
    OVERLAY17_UNKNOWN_POINTER__NA_238BE00 = NULL;
}
