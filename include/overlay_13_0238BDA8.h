#ifndef PMDSKY_OVERLAY_13_0238BDA8_H
#define PMDSKY_OVERLAY_13_0238BDA8_H
#include "util.h"
#include "window.h"
#include "main_0200C4FC.h"

// Doesn't seem like an enum is actually used in the original code, for some reason.
enum personality_test_state {
    QUIZ_INIT = 0,
    QUIZ_INTRO = 1,
    QUIZ_START_QUIZ = 2,
    QUIZ_PREP_QUESTION = 3,
    QUIZ_QUESTION_PROMPT = 4,
    QUIZ_QUESTION_MENU = 5,
    QUIZ_ANSWER_QUESTION = 6,
    QUIZ_AFTER_QUESTION = 7,
    QUIZ_FINISH_QUESTIONS = 8,
    QUIZ_AURA_INFO = 9,
    QUIZ_AURA_INFO_AWAIT_DBOX_INACTIVE = 10,
    QUIZ_AURA_INFO_DBOX_INACTIVE = 11,
    QUIZ_HOLD_PROMPT = 12,
    QUIZ_HOLD_PROMPT_AWAIT_DBOX_INACTIVE = 13,
    QUIZ_HOLD_PROMPT_DBOX_INACTIVE = 14,
    QUIZ_AWAIT_BEGIN_HOLD = 15,
    QUIZ_BEGIN_HOLD = 16,
    QUIZ_CONTINUE_HOLD = 17,
    QUIZ_CONTINUE_HOLD_AWAIT_DBOX_INACTIVE = 18,
    QUIZ_CONTINUE_HOLD_DBOX_INACTIVE = 19,
    QUIZ_PRE_AURA_IDENTIFIED = 20,
    QUIZ_AURA_IDENTIFIED = 21,
    QUIZ_AURA_IDENTIFIED_AWAIT_DBOX_INACTIVE = 22,
    QUIZ_AURA_IDENTIFIED_DBOX_INACTIVE = 23,
    QUIZ_AWAIT_LIFT = 24,
    QUIZ_LIFTED_AWAIT_COUNTDOWN = 25,
    QUIZ_PREP_PRE_SHOW_AURA = 26,
    QUIZ_PRE_SHOW_AURA = 27,
    QUIZ_PRE_SHOW_AURA_AWAIT_DBOX_INACTIVE = 28,
    QUIZ_PRE_SHOW_AURA_DBOX_INACTIVE = 29,
    QUIZ_PREP_SHOW_AURA = 30,
    QUIZ_SHOW_AURA = 31,
    QUIZ_SHOW_AURA_AWAIT_DBOX_INACTIVE = 32,
    QUIZ_SHOW_AURA_DBOX_INACTIVE = 33,
    QUIZ_THANK_YOU = 34,
    QUIZ_UNUSED_35 = 35,
    QUIZ_EXPLAIN_PERSONALITY = 36,
    QUIZ_HERO_SPECIES = 37,
    QUIZ_HERO_SPECIES_AWAIT_DBOX_INACTIVE = 38,
    QUIZ_HERO_SPECIES_DBOX_INACTIVE = 39,
    QUIZ_PRE_CHOOSE_PARTNER = 40,
    QUIZ_PRE_CHOOSE_PARTNER_AWAIT_DBOX_INACTIVE = 41,
    QUIZ_CHOOSE_PARTNER_PROMPT = 42,
    QUIZ_CHOOSE_PARTNER_PROMPT_AWAIT_DBOX_INACTIVE = 43,
    QUIZ_START_CHOOSE_PARTNER = 44,
    QUIZ_CHOOSE_PARTNER = 45,
    QUIZ_FINISH_CHOOSE_PARTNER = 46,
    QUIZ_CONFIRM_PARTNER_SPECIES_PROMPT = 47,
    QUIZ_PARTNER_NAME_START = 48,
    QUIZ_AWAIT_PARTNER_NAME_FINISH = 49,
    QUIZ_PARTNER_NAME_FINISH = 50,
    QUIZ_CONFIRM_PARTNER_NAME_RESULT = 51,
    QUIZ_CONFIRM_PARTNER_NAME_YES = 52,
    QUIZ_CONFIRM_PARTNER_NAME_NO = 53,
    QUIZ_READY_TO_GO = 54,
    QUIZ_FINISH_1 = 55,
    QUIZ_FINISH_2 = 56,
    QUIZ_FINISH_3 = 57,
    QUIZ_WAIT_NEXT_STEP = 58,
    QUIZ_CONFIRM_PARTNER_SPECIES_MENU = 59,
    QUIZ_CONFIRM_PARTNER_SPECIES_MENU_RESULT = 60,
    QUIZ_EARLY_RELEASE = 61,
    QUIZ_EARLY_RELEASE_MESSAGE = 62,
    QUIZ_EARLY_RELEASE_RETRY = 63,
    QUIZ_UNK_64 = 64,
    QUIZ_UNK_65 = 65,
};
typedef u32 personality_test_state; // because an enum isn't actually used in the code, for some reason.

struct personality_test
{
    u8 outer_state;
    u8 next_outer_state;
    s8 main_dbox_window_id;
    s8 menu_window_id;
    s8 aura_bow_dbox_window_id;
    s8 portrait_box_window_id;
    s8 debug_window_id;
    u8 padding_0x7;
    char *question_buf_ptr;
    u32 unkC[2];
    char *answer_buf_ptr;
    u32 unk18;
    u32 unk1C;
    personality_test_state state;
    s32 question_num;
    s32 lift_continue_countdown;
    u8 fill2C[4];
    personality_test_state future_state;
    u8 personality_points[16];
    u8 tiebreaker_bonus_points[16];
    u8 question_ids[10];
    bool8 not_play_old_game;
    u8 gender;
    u16 question_string_id;
    u8 fill62[0x6C - 0x62];
    char question_buf[512];
    char answer_bufs[4][64];
    u8 unk36C[4];
    u32 n_partner_options;
    enum monster_id partner_options[20];
    u8 fill39C[0x3B4 - 0x39C];
    portrait_params portrait_params;
    char charbuf3C4[32];
    char charbuf3E4[32];
    char charbuf404[32];
    enum monster_id partner_species;
    u16 aura_color;
};

// Returns the personality obtained after answering all the questions.
// The value to return is determined by checking the points obtained for each the personalities and returning the one with the highest amount of points.
// return: Personality (0-15)
s32 GetPersonality(void);
char* GetPartnerOptionString(char* output, s32 option_id);

#endif //PMDSKY_OVERLAY_13_0238BDA8_H
