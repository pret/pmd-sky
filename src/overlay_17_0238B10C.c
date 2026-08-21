#include "overlay_17_0238B10C.h"
#include "enums.h"

extern void ov17_0238A278(void);

extern struct unk_0238BE00 *OVERLAY17_UNKNOWN_POINTER__NA_238BE00;

extern u32 IsSimpleMenuActive(s32 window_id);

extern s32 GetSimpleMenuResult__0202B870(s8 window_id);

extern void ov17_0238B028(s32 a);

extern enum game_mode GetGameMode();

void ov17_0238B10C(void)
{
    s32 r;
    s32 mode;

    if (IsSimpleMenuActive(OVERLAY17_UNKNOWN_POINTER__NA_238BE00->field_0x2)) {
        return;
    }

    r = GetSimpleMenuResult__0202B870(OVERLAY17_UNKNOWN_POINTER__NA_238BE00->field_0x2);

    switch (r) {
    case 2:
        ov17_0238B028(0xC);
        break;
    case 3:
        mode = GetGameMode();

        if (!(mode != GAME_MODE_RESCUE && mode != GAME_MODE_5)) {
            ov17_0238B028(9);
        } else {
            ov17_0238B028(6);
        }
        break;
    case 4:
    default:
        ov17_0238B028(4);
        break;
    }
}

void ov17_0238B194(void)
{
    OVERLAY17_UNKNOWN_POINTER__NA_238BE00->field_0x7E = 3;
    OVERLAY17_UNKNOWN_POINTER__NA_238BE00->field_0x78 = 5;
}

void ov17_0238B1B8(void)
{
    OVERLAY17_UNKNOWN_POINTER__NA_238BE00->field_0x7E = 0;
    ov17_0238A278();
    OVERLAY17_UNKNOWN_POINTER__NA_238BE00->field_0x6C = 1;
}

void ov17_0238B1E8(void)
{
    OVERLAY17_UNKNOWN_POINTER__NA_238BE00->field_0x7E = 3;
    OVERLAY17_UNKNOWN_POINTER__NA_238BE00->field_0x78 = 7;
}

void ov17_0238B20C(void)
{
    OVERLAY17_UNKNOWN_POINTER__NA_238BE00->field_0x78 = 8;
}

void ov17_0238B224(void)
{
    OVERLAY17_UNKNOWN_POINTER__NA_238BE00->field_0x78 = 0;
}

void ov17_0238B23C(void)
{
    OVERLAY17_UNKNOWN_POINTER__NA_238BE00->field_0x7E = 3;
    OVERLAY17_UNKNOWN_POINTER__NA_238BE00->field_0x78 = 0xA;
}

void ov17_0238B260(void)
{
    OVERLAY17_UNKNOWN_POINTER__NA_238BE00->field_0x78 = 0xB;
}

void ov17_0238B278(void)
{
    OVERLAY17_UNKNOWN_POINTER__NA_238BE00->field_0x78 = 0;
}

void ov17_0238B290(void)
{
    OVERLAY17_UNKNOWN_POINTER__NA_238BE00->field_0x7E = 0x20;
    OVERLAY17_UNKNOWN_POINTER__NA_238BE00->field_0x78 = 0xD;
}
