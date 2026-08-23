#include "overlay_29_0234AFFC.h"
#include "main_0200C4FC.h"
#include "overlay_29_0234B024.h"

extern struct message_log_info MESSAGE_LOG_INFO;

void ov29_0234AFFC(u8 value)
{
    MESSAGE_LOG_INFO.alert_box_info->field_0xced = value;
}

void ov29_0234B010(u8 value)
{
    MESSAGE_LOG_INFO.alert_box_info->field_0xcee = value;
}
