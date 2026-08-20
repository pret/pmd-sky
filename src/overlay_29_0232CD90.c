#include "overlay_29_0232CD90.h"
#include "moves_2.h"
#include "main_0201514C.h"

extern void CalcDamageFixedWrapper(struct entity *attacker, struct entity *defender, s32 fixed_damage, s32 a, bool8 *flag, s32 type, s32 category, s32 damage_source, s32 b, s32 c, s32 d);

extern s32 GetDamageSourceWrapper(struct move *move, enum item_id item_id);

extern void TryInflictInvisibleStatus(struct entity *user, struct entity *target);

bool8 DoMoveInvisify(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    TryInflictInvisibleStatus(attacker, attacker);

    return TRUE;
}

bool8 DoMoveOneShot(struct entity* attacker, struct entity* defender, struct move* move, enum item_id item_id)
{
    bool8 flag = FALSE;
    s32 type = GetMoveType(move);
    s32 category = GetMoveCategory(move->id);
    s32 source = GetDamageSourceWrapper(move, item_id);

    CalcDamageFixedWrapper(attacker, defender, 0x270F, 1, &flag, type, category, source,
                           0, 1, 0);
    flag = flag == 0;

    return flag;
}
