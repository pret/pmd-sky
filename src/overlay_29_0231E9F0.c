#include "overlay_29_0231E9F0.h"
#include "moves.h"
#include "moves_1.h"
#include "main_0201514C.h"

s16 GetMaxPpWrapper(struct move *move)
{
    return GetMaxPp(move);
}

void InitMoveWrapper(struct entity *entity, struct move *move, enum move_id move_id)
{
    InitMove(move, move_id);
}

int MoveIsNotPhysical(enum move_id move_id)
{
    s32 category = GetMoveCategory(move_id);

    if (category == CATEGORY_PHYSICAL) {
        return FALSE;
    } else if (category != CATEGORY_PHYSICAL) {
        return TRUE;
    }
    return TRUE;
}

bool8 CategoryIsNotPhysical(s32 category)
{
    if (category == CATEGORY_PHYSICAL) {
        return FALSE;
    } else if (category != CATEGORY_PHYSICAL) {
        return TRUE;
    }
    return TRUE;
}
