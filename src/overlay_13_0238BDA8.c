#include "overlay_13_0238BDA8.h"
#include "main_0200C4FC.h"

extern struct personality_test *PERSONALITY_TEST_PTR;
extern int PreprocessString(char *output,int output_size,char *format,u16 flags,struct preprocessor_args *args);
extern char ov13_0238CE70[32]; // "[gender:0][CLUM_SET:28][kind:0]"
extern void DrawTextInWindow(s8 window_id,s32 x,s32 y,char *string);
extern void InitPreprocessorArgs(struct preprocessor_args* args);
extern int PreprocessStringFromId(char *output,s32 output_size,s32 string_id,s32 flags,struct preprocessor_args *args);
extern void UpdateWindow(s8 window_id);
extern void sub_02027B1C(s8 window_id); // this is "ClearAndUpdateWindow" in my (Chesyon's) notes, but I haven't submitted it to pmdsky-debug yet.

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

void WaitForNextStep(enum personality_test_state state) {
    PERSONALITY_TEST_PTR->state = QUIZ_WAIT_NEXT_STEP;
    PERSONALITY_TEST_PTR->future_state = state;
}

#ifdef JAPAN
    #define DIAGNOSIS_DEBUG_STRING_1 0x31C6
    #define DIAGNOSIS_DEBUG_STRING_2 0x31C7
    #define DIAGNOSIS_DEBUG_STRING_3 0x31C8
    #define DIAGNOSIS_DEBUG_STRING_4 0x31C9
#else
    #define DIAGNOSIS_DEBUG_STRING_1 0x6CA
    #define DIAGNOSIS_DEBUG_STRING_2 0x6CB
    #define DIAGNOSIS_DEBUG_STRING_3 0x6CC
    #define DIAGNOSIS_DEBUG_STRING_4 0x6CD
#endif

void DrawPersonalityTestDebug(s8 window_id) {
    char buf[1024];
    struct preprocessor_args args;

    InitPreprocessorArgs(&args);
    sub_02027B1C(window_id);
    args.number_vals[0] = PERSONALITY_TEST_PTR->personality_points[0];
    args.number_vals[1] = PERSONALITY_TEST_PTR->personality_points[1];
    args.number_vals[2] = PERSONALITY_TEST_PTR->personality_points[2];
    args.number_vals[3] = PERSONALITY_TEST_PTR->personality_points[3];
    PreprocessStringFromId((char*)&buf, sizeof(buf), DIAGNOSIS_DEBUG_STRING_1, 0xC402, &args);
    DrawTextInWindow(window_id, 4, 0, (char*)&buf);
    args.number_vals[0] = PERSONALITY_TEST_PTR->personality_points[4];
    args.number_vals[1] = PERSONALITY_TEST_PTR->personality_points[5];
    args.number_vals[2] = PERSONALITY_TEST_PTR->personality_points[6];
    args.number_vals[3] = PERSONALITY_TEST_PTR->personality_points[7];
    PreprocessStringFromId((char*)&buf, sizeof(buf), DIAGNOSIS_DEBUG_STRING_2, 0xC402, &args);
    DrawTextInWindow(window_id, 4, 0xC, (char*)&buf);
    args.number_vals[0] = PERSONALITY_TEST_PTR->personality_points[8];
    args.number_vals[1] = PERSONALITY_TEST_PTR->personality_points[9];
    args.number_vals[2] = PERSONALITY_TEST_PTR->personality_points[10];
    args.number_vals[3] = PERSONALITY_TEST_PTR->personality_points[11];
    PreprocessStringFromId((char*)&buf, sizeof(buf), DIAGNOSIS_DEBUG_STRING_3, 0xC402, &args);
    DrawTextInWindow(window_id, 4, 0x18, (char*)&buf);
    args.number_vals[0] = PERSONALITY_TEST_PTR->personality_points[12];
    args.number_vals[1] = PERSONALITY_TEST_PTR->personality_points[13];
    args.number_vals[2] = PERSONALITY_TEST_PTR->personality_points[14];
    args.number_vals[3] = PERSONALITY_TEST_PTR->personality_points[15];
    PreprocessStringFromId((char*)&buf, sizeof(buf), DIAGNOSIS_DEBUG_STRING_4, 0xC402, &args);
    DrawTextInWindow(window_id, 4, 0x24, (char*)&buf);
    UpdateWindow(window_id);
}
