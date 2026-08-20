#include "overlay_29_0234B4BC.h"

extern void LogMessage(struct entity *user, const char *message, bool8 show_popup);

void LogMessageWithPopup(struct entity *user, const char *message)
{
    LogMessage(user, message, TRUE);
}
