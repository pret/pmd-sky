#include "overlay_13_0238BDA8.h"
#include "overlay_13_0238BE4C.h"

extern struct personality_test *PERSONALITY_TEST_PTR;

void WaitForNextStep(enum personality_test_state state) {
    PERSONALITY_TEST_PTR->state = QUIZ_WAIT_NEXT_STEP;
    PERSONALITY_TEST_PTR->future_state = state;
}
