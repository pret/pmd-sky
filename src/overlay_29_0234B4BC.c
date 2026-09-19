#include "overlay_29_0234B4BC.h"
#include "main_0202593C.h"

extern void LogMessage(struct entity *user, const char *message, bool8 show_popup);

void LogMessageByIdWithPopup(struct entity *user, s32 message_id)
{
    LogMessage(user, (char *)StringFromId(message_id), TRUE);
}

void LogMessageWithPopup(struct entity *user, const char *message)
{
    LogMessage(user, message, TRUE);
}
