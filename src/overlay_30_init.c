#include "overlay_30.h"


struct Overlay30Main {
    s32 state;
    s32 unk4;
    s32 unk8;
    u8 unkC;
    s8 isGameModeRescue; // GAME_MODE_RESCUE
};

extern struct Overlay30Main* ov30_023860A0;

extern s32 ReadQuickSaveInfo(s32, s32);
extern s32 sub_02034DA8();
extern void sub_02034EB4(s32, s32, s32);
extern void* MemAlloc(u32 len, u32 flags);
extern void MemFree(void *);

#ifdef JAPAN
    #define SAVE_CHECKSUM 0x20111122
#else
    #define SAVE_CHECKSUM 0x21061522
#endif

#define SAVE_VALID 1
#define SAVE_INVALID_CHECKSUM 4

void ov30_02382820(s32 arg0, s32 arg1, s32 isGameModeRescue)
{

    ov30_023860A0 = MemAlloc(sizeof(struct Overlay30Main), 5);
    ov30_023860A0->unk4 = arg0;
    ov30_023860A0->unk8 = arg1;
    ov30_023860A0->unkC = 0;
    ov30_023860A0->isGameModeRescue = isGameModeRescue;
    ov30_023860A0->state = 0;
}

s32 ov30_02382874(void)
{
    s32 saveStatus;

    switch (ov30_023860A0->state) {
        default:
        case 2:
            break;
        case 0:
            saveStatus = ReadQuickSaveInfo(ov30_023860A0->unk4, ov30_023860A0->unk8);
            if ((saveStatus == 0) && (*(u32*)(ov30_023860A0->unk4 + (ov30_023860A0->unk8 - 4)) != SAVE_CHECKSUM)) {
                saveStatus = SAVE_INVALID_CHECKSUM;
            }
            if (saveStatus == 0) {
                ov30_023860A0->unkC = 1;
                ov30_023860A0->state = 3;
            } else if (saveStatus == SAVE_VALID) {
#ifdef JAPAN
                sub_02034EB4(0x40C, 0x4D8, 0);
#else
                sub_02034EB4(0x40C, 0x247, 0);
#endif
                ov30_023860A0->state = 2;
            } else {
#ifdef JAPAN
                sub_02034EB4(0x61C, 0x4DE, 0);
#else
                sub_02034EB4(0x61C, 0x24D, 0);
#endif
                ov30_023860A0->state = 1;
            }
            break;
        case 1:
            if (sub_02034DA8() == 0) {
                ov30_023860A0->state = 3;
            }
            break;
        case 3:
            return 0;
    }
    return 1;
}

u8 ov30_0238298C(void)
{
    return ov30_023860A0->unkC;
}

void ov30_023829A0(void)
{
    if(ov30_023860A0 != NULL)
    {
        MemFree(ov30_023860A0);
        ov30_023860A0 = NULL;
    }
}
