#ifndef PMDSKY_OVERLAY_29_0234B340_H
#define PMDSKY_OVERLAY_29_0234B340_H

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"

void LogMessageQuiet(struct entity *user, const char *message);
void LogMessageByIdWithPopupCheckUserTarget(struct entity *user, struct entity *target, u32 message_id);

#endif
