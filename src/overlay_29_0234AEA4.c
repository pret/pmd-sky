#include "overlay_29_0234AEA4.h"
#include "overlay_29_022FA430.h"
#include "overlay_29_022FBA54.h"
#include "overlay_29_022FBBEC.h"
#include "special_move_types.h"

void TeleportFleeingOutlaw()
{
    struct entity *entity = FindMonsterWithBehavior(BEHAVIOR_FLEEING_OUTLAW);
    if (!ShouldMonsterHeadToStairs(entity) && DoesMonsterHaveMove(entity, MOVE_TELEPORT))
        UseMoveByMoveId(entity, MOVE_TELEPORT, 0);
}
