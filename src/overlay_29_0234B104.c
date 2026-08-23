#include "overlay_29_0234B104.h"
#include "main_0200C4FC.h"
#include "overlay_29_0234B024.h"

extern struct message_log_info MESSAGE_LOG_INFO;

void SetMessageLogPreprocessorArgsSpeakerId(u32 monster_id)
{
    MESSAGE_LOG_INFO.alert_box_info->preprocessor_args.speaker_id = monster_id;
}

void SetMessageLogPreprocessorArgsSpeakerId0x30000(u32 team_index)
{
    MESSAGE_LOG_INFO.alert_box_info->preprocessor_args.speaker_id = team_index | 0x30000;
}
