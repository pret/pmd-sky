#include "overlay_28_0238A58C.h"
#include "main_02001188.h"

extern void* ov28_0238AD80;

extern void ov28_0238AB5C(s32);
extern void sub_02025C14();
extern void sub_02027170();
extern void sub_02027228();

void ov28_0238A58C(void)
{
    ov28_0238AB5C(0);
    sub_02025C14();
    sub_02027170();
    sub_02027228();
    if (ov28_0238AD80 != NULL) {
        MemFree(ov28_0238AD80);
        ov28_0238AD80 = NULL;
    }
}
