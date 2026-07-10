#include "overlay_13_0238BDA8.h"
#include "main_0200C4FC.h"

extern struct personality_test *PERSONALITY_TEST_PTR;
extern int PreprocessString(char *output,int output_size,char *format,u16 flags,struct preprocessor_args *args);
extern char ov13_0238CE70[32]; // "[gender:0][CLUM_SET:28][kind:0]"

s32 GetPersonality(void) {
    s32 i;
    s32 maxScore = 0;
    s32 personality = 0;
    for(i = 0; i < 16; i++)
    {
        s32 score = (PERSONALITY_TEST_PTR->personality_points[i] + PERSONALITY_TEST_PTR->tiebreaker_bonus_points[i]);

        if(maxScore < score)
        {
            personality = i;
            maxScore = score;
        }
    }
    return personality;
}

char* GetPartnerOptionString(char* output, s32 option_id)
{
    struct preprocessor_args args;
    s16 partner = PERSONALITY_TEST_PTR->partner_options[option_id];
    args.flag_vals[0] = partner;
    args.id_vals[0] = partner | 0x10000;
    PreprocessString(output, 0x400, (char*)&ov13_0238CE70, 0xC402, &args);
    return output;
}
