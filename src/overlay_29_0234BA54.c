#include "overlay_29_0234BA54.h"
#include "overlay_29_0234B024.h"

extern struct message_log_info MESSAGE_LOG_INFO;
extern u16 DUNGEON_BUTTON_INPUT[8];

extern void ov29_022E0B60(s32 a);
extern void UnkMapRelatedFunc(u32 switch_case, u32 param_2);
extern void ov29_0233A248(s32 a);
extern void sub_0204833C(void);
extern s32 sub_02048360(void);
extern void sub_02048240(s32 a);
extern void sub_02048150(s32 a);
extern void sub_02048134(s32 a);
extern void sub_020480CC(s32 a);
extern void sub_0204804C(s32 a);
extern void sub_02047FFC(s32 a);
extern void InitPortraitParams(portrait_params *portrait);
extern void AllowPortraitDefault(portrait_params *portrait, bool32 allow);
extern void WaitUntilAlertBoxTextIsLoaded(u32 param_1);
extern void AdvanceFrame(u32 param_1);

void WaitUntilAlertBoxPauseIsOver(u32 param_1)
{
    struct alert_box_info *alert_box_info = MESSAGE_LOG_INFO.alert_box_info;
    s32 i;

    WaitUntilAlertBoxTextIsLoaded(param_1);

    for (i = 0; i < 240; i++) {
        if (alert_box_info->frames_until_close < 180) {
            return;
        }

        if ((DUNGEON_BUTTON_INPUT[0] & 3) == 3) {
            return;
        }

        if (DUNGEON_BUTTON_INPUT[1] & 240) {
            return;
        }

        AdvanceFrame(param_1);
    }
}

void InitPortraitDungeon(portrait_params *portrait, enum monster_id monster_id, u8 emotion)
{
    InitPortraitParams(portrait);
    portrait->monster_id = monster_id;
    portrait->portrait_emotion = emotion;
    portrait->layout_idx = 0;
    portrait->offset_x = 2;
    portrait->offset_y = 9;
    portrait->try_flip = FALSE;
    portrait->has_flip = FALSE;
    portrait->hw_flip = FALSE;
    AllowPortraitDefault(portrait, 1);
}

void ov29_0234BB10(void)
{
    sub_02047FFC(0);
}

void ov29_0234BB20(s32 a)
{
    sub_0204804C(a);
}

void ov29_0234BB2C(s32 a)
{
    sub_020480CC(a);
}

void ov29_0234BB38(s32 a)
{
    sub_02048134(a);
}

void ov29_0234BB44(s32 a)
{
    sub_02048150(a);
}

void ov29_0234BB50(s32 a)
{
    sub_02048240(a);
}

s32 OpenMessageLog(s32 param_1, s32 param_2)
{
    s32 r;

    UnkMapRelatedFunc(6, 0);

    if (param_1 == 0) {
        ov29_0233A248(0);
    }

    AdvanceFrame(0x62);
    AdvanceFrame(0x62);
    sub_0204833C();

    do {
        AdvanceFrame(0x62);
        r = sub_02048360();
    } while (r == 0);

    AdvanceFrame(0x62);

    if (param_2 != 0) {
        UnkMapRelatedFunc(0, 0);
    }

    return r == 1;
}

void ov29_0234BBDC(s32 a)
{
    ov29_022E0B60(a);
}
