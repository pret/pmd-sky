#include "overlay_29_0234B104.h"
#include "main_0200C4FC.h"

struct unk_023537CC {
    bool8 field_0x0;
    u8 field_0x1;
    u8 field_0x2;
    u8 field_0x3;
    u8 *field_0x4;
};

extern struct unk_023537CC MESSAGE_LOG_INFO;

void SetMessageLogPreprocessorArgsSpeakerId(u32 speaker_id)
{
    ((struct preprocessor_args *) (MESSAGE_LOG_INFO.field_0x4 + 0xC9C))->speaker_id = speaker_id;
}

void SetMessageLogPreprocessorArgsSpeakerId0x30000(u32 speaker_id)
{
    ((struct preprocessor_args *) (MESSAGE_LOG_INFO.field_0x4 + 0xC9C))->speaker_id = speaker_id | 0x30000;
}
