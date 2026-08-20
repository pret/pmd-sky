#include "overlay_29_02325F3C.h"
#include "weather.h"

extern const s16 MORNING_SUN_HP_RESTORATION_TABLE[];

extern void TryIncreaseHp(struct entity *user, struct entity *target, s16 hp, s32 a, bool8 b);

extern s32 NIGHTMARE_TURN_RANGE;

extern s32 CalcStatusDuration(struct entity *target, s32 *turn_range, s32 a);

extern void TryInflictNightmareStatus(struct entity *user, struct entity *target, s32 turns);

bool8 DoMoveNightmare(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictNightmareStatus(attacker, defender, CalcStatusDuration(defender, &NIGHTMARE_TURN_RANGE, TRUE));

    return TRUE;
}

bool8 DoMoveMorningSun(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryIncreaseHp(attacker, defender, MORNING_SUN_HP_RESTORATION_TABLE[GetApparentWeather(attacker)], 0, TRUE);

    return TRUE;
}
