#include "overlay_29_0234B104.h"
#include "main_0200C4FC.h"
#include "overlay_29_0234B024.h"
#include "main_0202593C.h"
#include "overlay_29_022E272C.h"
#include "overlay_29_022E9FC0.h"
#include "overlay_29_0234B340.h"

extern void InitPreprocessorArgs(struct preprocessor_args *args);
extern void LogMessage(struct entity *user, const char *message, bool8 show_popup);
extern void WaitUntilAlertBoxTextIsLoaded(u32 param_1);
extern int FullyCloseAlertBox(void);

extern struct message_log_info MESSAGE_LOG_INFO;

void SetMessageLogPreprocessorArgsSpeakerId(u32 monster_id)
{
    MESSAGE_LOG_INFO.alert_box_info->preprocessor_args.speaker_id = monster_id;
}

void SetMessageLogPreprocessorArgsSpeakerId0x30000(u32 team_index)
{
    MESSAGE_LOG_INFO.alert_box_info->preprocessor_args.speaker_id = team_index | 0x30000;
}

void ov29_0234B130(void)
{
    s32 i;

    for (i = 0; i < 10; i++) {
        MESSAGE_LOG_INFO.alert_box_info->message_starts_group[i] = FALSE;
    }

    MESSAGE_LOG_INFO.alert_box_info->alert_box_window_id = -2;
    MESSAGE_LOG_INFO.alert_box_info->field_0xcee = 0;
    MESSAGE_LOG_INFO.alert_box_info->field_0xced = 0;
    MESSAGE_LOG_INFO.last_user = NULL;
    MESSAGE_LOG_INFO.should_start_group = TRUE;
    ov29_0234B1A4(FALSE);
    InitPreprocessorArgs(&MESSAGE_LOG_INFO.alert_box_info->preprocessor_args);
}

void ov29_0234B1A4(bool8 param_1)
{
    s32 i;

    if (!ov29_022E9FC0())
        return;

    for (i = 0; i < 10; i++) {
        MESSAGE_LOG_INFO.alert_box_info->alert_box_messages[i][0] = 0;
    }

    MESSAGE_LOG_INFO.alert_box_info->field_0xc8b = 0;
    MESSAGE_LOG_INFO.alert_box_info->alert_box_current_idx = 0;
    MESSAGE_LOG_INFO.alert_box_info->alert_box_current_loaded_idx = 0;
    MESSAGE_LOG_INFO.alert_box_info->frames_until_close = 0;
    MESSAGE_LOG_INFO.alert_box_info->field_0xc92 = 4;
    MESSAGE_LOG_INFO.alert_box_info->loading_status = 0;

    if (FullyCloseAlertBox() && param_1) {
        UnkMapRelatedFunc(0, 0);
        AdvanceFrame(11);
    }
}

void LogMessageByIdWithPopupCheckParticipants(struct entity *user, struct entity *target,
                                              u32 message_id, s32 pos, s16 val)
{
    MESSAGE_LOG_INFO.alert_box_info->preprocessor_args.id_vals[pos] = val;

    if (target != NULL && user != NULL) {
        LogMessageByIdWithPopupCheckUserTarget(user, target, message_id);
    }
    else if (user != NULL) {
        LogMessageByIdWithPopupCheckUser(user, message_id);
    }
}

void WaitUntilAlertBoxTextIsLoadedWrapper(void)
{
    WaitUntilAlertBoxTextIsLoaded(0x50);
}

void LogMessageByIdWithPopupCheckUser(struct entity *user, u32 message_id)
{
    bool8 display = FALSE;

    if (ShouldDisplayEntityWrapper(user))
        display = TRUE;

    if (display)
        LogMessage(user, (char *)StringFromId(message_id), TRUE);
}

void LogMessageWithPopupCheckUser(struct entity *user, const char *message)
{
    bool8 display = FALSE;

    if (ShouldDisplayEntityWrapper(user))
        display = TRUE;

    if (display)
        LogMessage(user, message, TRUE);
}

void LogMessageByIdQuiet(struct entity *user, u32 message_id)
{
    LogMessage(user, (char *)StringFromId(message_id), FALSE);
}
