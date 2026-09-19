#include "overlay_29_0234B340.h"
#include "main_0202593C.h"
#include "overlay_29_022E272C.h"

extern void LogMessage(struct entity *user, const char *message, bool8 show_popup);

void LogMessageQuiet(struct entity *user, const char *message)
{
    LogMessage(user, message, FALSE);
}

void LogMessageByIdWithPopupCheckUserTarget(struct entity *user, struct entity *target, u32 message_id)
{
    bool8 display = FALSE;

    if (ShouldDisplayEntityWrapper(user))
        display = TRUE;
    if (ShouldDisplayEntityWrapper(target))
        display = TRUE;

    if (display)
        LogMessage(user, (char *)StringFromId(message_id), TRUE);
}
