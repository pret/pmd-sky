#include "dungeon_logic_6.h"

#include "dungeon_mode.h"
#include "util.h"


#include "overlay_29_0234BA54.h"

extern void ov29_0234D8A0(s32 a);
extern s16 ov29_022DE5F0(s32 index);
extern void ov29_022EA370(s32 a, s32 b);
extern int ov29_0234B1A4();
extern void ov29_0234D630(void);
extern s8 ov29_023535A4;
extern s16 ov29_0237C9A0[2];

bool8 IsBehaviorLoneOutlaw(enum monster_behavior behavior)
{
    bool8 result;

    // If behavior is BEHAVIOR_OUTLAW, BEHAVIOR_HIDDEN_OUTLAW or BEHAVIOR_FLEEING_OUTLAW
    if ((u32) (u8) (behavior + 0xFF) <= BEHAVIOR_FLEEING_OUTLAW) {
        result = TRUE;
    } else {
        result = FALSE;
    }
    return result;
}

bool8 IsSecretBazaarNpcBehavior(enum monster_behavior behavior)
{
    // Includes the following behaviors:
    // BEHAVIOR_SECRET_BAZAAR_KIRLIA
    // BEHAVIOR_SECRET_BAZAAR_MIME_JR
    // BEHAVIOR_SECRET_BAZAAR_SWALOT
    // BEHAVIOR_SECRET_BAZAAR_LICKILICKY
    // BEHAVIOR_SECRET_BAZAAR_SHEDINJA
    if ((u8) ((behavior + 0xF0) & 0xFF) <= 4)
        return TRUE;
    return FALSE;
}

void ov29_022EFB20(bool8 param_1)
{
    if (param_1) {
        WaitUntilAlertBoxPauseIsOver(10);
        ov29_0234B1A4(0);
        ov29_022EA370(10, 0x62);
    }
    ov29_0234D630();
    ov29_023535A4 = -2;
    ov29_0237C9A0[1] = ov29_022DE5F0(1);
    ov29_0237C9A0[0] = ov29_022DE5F0(0);
}

void ov29_022EFB84(bool8 param_1)
{
    ov29_0234D8A0(0);
    if (param_1) {
        ov29_022EA370(10, 0x62);
    }
}
