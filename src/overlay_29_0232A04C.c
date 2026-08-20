#include "overlay_29_0232A04C.h"
#include "moves_2.h"
#include "main_0201514C.h"
#include "dungeon_util_static.h"

extern void CalcDamageFixedWrapper(struct entity *attacker, struct entity *defender, s32 fixed_damage, s32 a, bool8 *flag, s32 type, s32 category, s32 damage_source, s32 b, s32 c, s32 d);

extern s32 GetDamageSourceWrapper(struct move *move, enum item_id item_id);
#include "move_orb_effects.h"

extern const struct StatIndex ATK_STAT_IDX;

extern const struct StatIndex SPATK_STAT_IDX;

extern bool8 DoMoveTakeaway(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id);

bool8 DoMoveDamageStealItem(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    return DoMoveTakeaway(attacker, defender, move, item_id);
}

bool8 DoMoveAmnesia(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    BoostDefensiveStat(attacker, defender, SPATK_STAT_IDX, 2);

    return TRUE;
}

bool8 DoMoveNightShade(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    bool8 flag = FALSE;
    s32 level = GetEntInfo(attacker)->level;
    s32 type = GetMoveType(move);
    s32 category = GetMoveCategory(move->id);
    s32 source = GetDamageSourceWrapper(move, item_id);

    CalcDamageFixedWrapper(attacker, defender, level, 1, &flag, type, category, source,
                           0, 1, 0);
    flag = flag == 0;

    return flag;
}
