#include "overlay_29_0234B340.h"

extern void LogMessage(struct entity *user, const char *message, bool8 show_popup);

void LogMessageQuiet(struct entity *user, const char *message)
{
    LogMessage(user, message, FALSE);
}
