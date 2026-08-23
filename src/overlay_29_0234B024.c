#include "overlay_29_0234B024.h"
#include "dungeon_mode.h"
#include "main_0200C4FC.h"

extern struct message_log_info MESSAGE_LOG_INFO;

extern char *GetSize0x80Buffer(void);
extern void GetName(char *dst, enum monster_id monster_id, char color_id);
extern void InitPreprocessorArgs(struct preprocessor_args *args);

void SetMessageLogGroupStartFlag(bool8 should_start_group)
{
    MESSAGE_LOG_INFO.should_start_group = should_start_group;
}

struct preprocessor_args* GetMessageLogPreprocessorArgs(void)
{
    return &MESSAGE_LOG_INFO.alert_box_info->preprocessor_args;
}

void InitMessageLogPreprocessorArgs(void)
{
    InitPreprocessorArgs(&MESSAGE_LOG_INFO.alert_box_info->preprocessor_args);
}

void SetMessageLogPreprocessorArgsFlagVal(s32 pos, u32 val)
{
    MESSAGE_LOG_INFO.alert_box_info->preprocessor_args.flag_vals[pos] = val;
}

void SetPreprocessorArgsIdVal(s32 pos, u32 val)
{
    MESSAGE_LOG_INFO.alert_box_info->preprocessor_args.id_vals[pos] = val;
}

void SetMessageLogPreprocessorArgsNumberVal(s32 pos, s32 val)
{
    MESSAGE_LOG_INFO.alert_box_info->preprocessor_args.number_vals[pos] = val;
}

void SetMessageLogPreprocessorArgsString(s32 pos, char *string)
{
    MESSAGE_LOG_INFO.alert_box_info->preprocessor_args.strings[pos] = string;
}

void SetMessageLogPreprocessorArgsStringToName(u8 pos, enum monster_id monster_id)
{
    char *buffer = GetSize0x80Buffer();

    GetName(buffer, monster_id, 0x4E);
    MESSAGE_LOG_INFO.alert_box_info->preprocessor_args.strings[pos] = buffer;
}
