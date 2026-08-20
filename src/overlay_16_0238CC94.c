#include "overlay_16_0238CC94.h"

extern struct unk_0238CE40 *OVERLAY16_UNKNOWN_POINTER__NA_238CE40;








s16 ov16_0238CC94(void)
{
    return OVERLAY16_UNKNOWN_POINTER__NA_238CE40->field_0xDC;
}

s16 ov16_0238CCA8(void)
{
    return OVERLAY16_UNKNOWN_POINTER__NA_238CE40->field_0xDE;
}

s32 ov16_0238CCBC(void)
{
    struct unk_0238CE40 *p = OVERLAY16_UNKNOWN_POINTER__NA_238CE40;

    if (p == NULL) {
        return 0;
    }

    return p->field_0xE0;
}

void ov16_0238CCD8(void)
{
    OVERLAY16_UNKNOWN_POINTER__NA_238CE40->field_0xE0 = 0;
}

void ov16_0238CCF0(void)
{
    OVERLAY16_UNKNOWN_POINTER__NA_238CE40->field_0xD8 = 4;
}
