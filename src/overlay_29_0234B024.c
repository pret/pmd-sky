#include "overlay_29_0234B024.h"
#include "main_0200C4FC.h"

extern void InitPreprocessorArgs(struct preprocessor_args *args);

struct unk_023537CC {
    bool8 field_0x0;
    u8 field_0x1;
    u8 field_0x2;
    u8 field_0x3;
    u8 *field_0x4;
};

extern struct unk_023537CC MESSAGE_LOG_INFO;

void SetMessageLogGroupStartFlag(bool8 flag)
{
    MESSAGE_LOG_INFO.field_0x0 = flag;
}

struct preprocessor_args* GetMessageLogPreprocessorArgs(void)
{
    return ((struct preprocessor_args *) (MESSAGE_LOG_INFO.field_0x4 + 0xC9C));
}

void InitMessageLogPreprocessorArgs(void)
{
    InitPreprocessorArgs(((struct preprocessor_args *) (MESSAGE_LOG_INFO.field_0x4 + 0xC9C)));
}

void SetMessageLogPreprocessorArgsFlagVal(s32 idx, u32 val)
{
    ((struct preprocessor_args *) (MESSAGE_LOG_INFO.field_0x4 + 0xC9C))->flag_vals[idx] = val;
}

void SetPreprocessorArgsIdVal(s32 idx, u32 val)
{
    ((struct preprocessor_args *) (MESSAGE_LOG_INFO.field_0x4 + 0xC9C))->id_vals[idx] = val;
}

void SetMessageLogPreprocessorArgsNumberVal(s32 idx, s32 val)
{
    ((struct preprocessor_args *) (MESSAGE_LOG_INFO.field_0x4 + 0xC9C))->number_vals[idx] = val;
}

void SetMessageLogPreprocessorArgsString(s32 idx, char *str)
{
    ((struct preprocessor_args *) (MESSAGE_LOG_INFO.field_0x4 + 0xC9C))->strings[idx] = str;
}
