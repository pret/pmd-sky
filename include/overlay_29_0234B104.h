#ifndef PMDSKY_OVERLAY_29_0234B104_H
#define PMDSKY_OVERLAY_29_0234B104_H

#include "util.h"
#include "main_0200C4FC.h"
#include "dungeon_mode.h"

void SetMessageLogPreprocessorArgsSpeakerId(u32 monster_id);
void SetMessageLogPreprocessorArgsSpeakerId0x30000(u32 team_index);
void ov29_0234B130(void);
void ov29_0234B1A4(bool8 param_1);
void LogMessageByIdWithPopupCheckParticipants(struct entity *user, struct entity *target, u32 message_id, s32 pos, s16 val);
void WaitUntilAlertBoxTextIsLoadedWrapper(void);
void LogMessageByIdWithPopupCheckUser(struct entity *user, u32 message_id);
void LogMessageWithPopupCheckUser(struct entity *user, const char *message);
void LogMessageByIdQuiet(struct entity *user, u32 message_id);

#endif
