#include "main_020504A4.h"
#include "adventure_log.h"

u32 GetSentryDutyGamePoints(s32 index)
{
    return ADVENTURE_LOG_PTR->sentry_duty_game_points[index];
}
