#include "overlay_13_EntryOverlay13.h"

extern void* MemAlloc(u32 len, u32 flags);
extern void* MemFree(void *);
void sub_0201F2E4(void);
void sub_020348E4(const u8 *);
extern void ov11_022E6E8C(u32);
void ov11_022E6E68(void);
BOOL ov11_022E6EC8(void);
void Overlay13SwitchFunctionNa238A574(void);

struct Overlay13Main
{
    // size: 0x428
    u8 unk0;
    u8 unk1;
    u8 fill2[0x6 - 2];
    s8 unk6;
    u8 unk7[0x20 - 0x7];
    u32 unk20;
    u8 fill24[0x426 - 0x24];
    u16 unk426;
};

extern struct Overlay13Main *OVERLAY13_UNKNOWN_POINTER__NA_238CEA0;

extern const u8 OVERLAY13_UNKNOWN_STRUCT__NA_238C024[];

void EntryOverlay13(void)
{
    sub_0201F2E4();
    OVERLAY13_UNKNOWN_POINTER__NA_238CEA0 = MemAlloc(sizeof(struct Overlay13Main), 8);
    OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0 = 0;
    OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk20 = 0;
    OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk6 = 0xFE;
    sub_020348E4(OVERLAY13_UNKNOWN_STRUCT__NA_238C024);
}

void ExitOverlay13(void)
{
    if(OVERLAY13_UNKNOWN_POINTER__NA_238CEA0)
    {
        sub_0201F2E4();
        MemFree(OVERLAY13_UNKNOWN_POINTER__NA_238CEA0);
        OVERLAY13_UNKNOWN_POINTER__NA_238CEA0 = NULL;
    }
}

u32 Overlay13SwitchFunctionNa238A1C8(void) {
    switch(OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0)
    {
        case 0:
            ov11_022E6E68();
            OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0 = 0xD;
            break;
        case 1:
            if(ov11_022E6EC8())
            {
                ov11_022E6E8C(1);
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0 = 0xC;
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk1 = 0xD;
            }
            break;
        case 2:
             if(ov11_022E6EC8())
            {
                ov11_022E6E8C(0x19);
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0 = 0xC;
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk1 = 0xD;
            }
            break;
        case 0xF:
             if(ov11_022E6EC8())
            {
                ov11_022E6E8C(0x1d);
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0 = 0xC;
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk1 = 0xD;
            }
            break;
        case 0xE:
             if(ov11_022E6EC8())
            {
                ov11_022E6E8C(0x1c);
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0 = 0xC;
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk1 = 0xD;
            }
            break;
        case 0x11:
             if(ov11_022E6EC8())
            {
                ov11_022E6E8C(0x1f);
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0 = 0xC;
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk1 = 0xD;
            }
            break;
        case 0x12:
             if(ov11_022E6EC8())
            {
                ov11_022E6E8C(0x20);
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0 = 0xC;
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk1 = 0xD;
            }
            break;
        case 3:
             if(ov11_022E6EC8())
            {
                ov11_022E6E8C(0x18);
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0 = 0xC;
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk1 = 0xD;
            }
            break;
       case 8:
             if(ov11_022E6EC8())
            {
                ov11_022E6E8C(0x15);
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0 = 0xC;
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk1 = 0xD;
            }
        case 9:
             if(ov11_022E6EC8())
            {
                ov11_022E6E8C(0x16);
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0 = 0xC;
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk1 = 0xD;
            }
        case 7:
             if(ov11_022E6EC8())
            {
                ov11_022E6E8C(OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk426 + 0x5);
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0 = 0xC;
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk1 = 0xD;
            }
            break;
       case 4:
             if(ov11_022E6EC8())
            {
                ov11_022E6E8C(0x2);
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0 = 0xC;
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk1 = 0xD;
            }
            break;
        case 0x10:
             if(ov11_022E6EC8())
            {
                ov11_022E6E8C(0x1e);
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0 = 0xC;
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk1 = 0xD;
            }
            break;
        case 5:
             if(ov11_022E6EC8())
            {
                ov11_022E6E8C(0x3);
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0 = 0xC;
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk1 = 0xD;
            }
        case 6:
             if(ov11_022E6EC8())
            {
                ov11_022E6E8C(0x4);
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0 = 0xC;
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk1 = 0xD;
            }
        case 12:
            if(ov11_022E6EC8())
            {
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk0 = OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk1;
                OVERLAY13_UNKNOWN_POINTER__NA_238CEA0->unk1 = 0xD;
            }
            break;
        case 10:
            break;
        case 11:
            break;
        case 0xD:
            Overlay13SwitchFunctionNa238A574();
            break;
        case 0x13:
            ov11_022E6E8C(-1);
            return 4;
    }
    return 1;
}
