#include "overlay_29_0233836C.h"
#include "dungeon.h"
#include "main_0200330C.h"
#include "overlay_29_02337CA8.h"

extern void LogMessageByIdWithPopupCheckUser(struct entity *user, u32 message_id);
extern void ov29_02306D54(struct entity *);

void ResetGravity(void)
{
    MemZero(&DUNGEON_PTR[0]->gravity, 2);
}

bool8 GravityIsActive()
{
    return DUNGEON_PTR[0]->gravity;
}

void ov29_023383A8(struct entity *monster)
{
#ifndef JAPAN
    LogMessageByIdWithPopupCheckUser(monster, 0xD8D);
#else
    LogMessageByIdWithPopupCheckUser(monster, 0xACD);
#endif
}

bool8 TryActivateGravity(struct entity *monster)
{
    if (!EntityIsValid__02337CA8(monster)) {
        return FALSE;
    }
    if (DUNGEON_PTR[0]->gravity) {
        LogMessageByIdWithPopupCheckUser(monster, 0xC06);
        return FALSE;
    }
    DUNGEON_PTR[0]->gravity = TRUE;
    LogMessageByIdWithPopupCheckUser(monster, 0xC05);
    ov29_02306D54(monster);
    return TRUE;
}

