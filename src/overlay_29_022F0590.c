#include "overlay_29_022F0590.h"

#include "dungeon.h"

#include "main_0201D198.h"
#include "dg_uty.h"
#include "overlay_29_0234B024.h"
#include "overlay_29_0234B104.h"
#include "overlay_29_0234BA54.h"
#include "position_util.h"
void UnfreezeAnim(struct entity *entity)
{
    struct monster *monster = entity->info;

    monster->field_0x171 = FALSE;
    SetAnimationControlPausedFlag(&entity->anim_ctrl, FALSE);
}

extern struct dungeon *DUNGEON_PTR[];
extern bool8 EntityIsValid__022F0590(struct entity *entity);
extern void FreezeAnim(struct entity *e);


void ov29_022F0534(bool8 freeze)
{
    s32 i;

    for (i = 0; i < 20; i++)
    {
        struct entity *entity = DUNGEON_PTR[0]->active_monster_ptrs[i];
        if (EntityIsValid__022F0590(entity))
        {
            if (!freeze)
                UnfreezeAnim(entity);
            else
                FreezeAnim(entity);
        }
    }
}



extern void ov29_022F0AE0(void);

extern void ov29_0234D668(void);

extern void ov29_0234D838(void);

extern void ov29_022EA370(s32 a, s32 b);

extern s32 TalkToSecretBazaarNpc(s32 a, struct entity *b, s32 c, s32 d, s32 e);
#include "dungeon_util_static.h"

extern void FreezeAnim(struct entity *e);

bool8 EntityIsValid__022F0590(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return GetEntityType(entity) != ENTITY_NOTHING;
}

void ov29_022F05B4(struct entity* a, struct entity* b, bool8 freeze)
{
    if (!freeze) {
        UnfreezeAnim(a);
        UnfreezeAnim(b);
    } else {
        FreezeAnim(a);
        FreezeAnim(b);
    }
}

void ov29_022F05E4(void)
{
    ov29_022F0AE0();
    ov29_0234D668();
    ov29_0234D838();
    ov29_022EA370(0x20, 0x62);
}

s32 TalkToSecretBazaarNpcStandard(s32 a, struct entity* b, s32 c)
{
    return TalkToSecretBazaarNpc(a, b, c, 0, 0);
}

s32 ov29_022F0618(s32 a, struct entity* b, s32 c, s32 d)
{
    return TalkToSecretBazaarNpc(a, b, c, d, 0);
}

s32 TalkToSecretBazaarNpcWithYesNoMenu(s32 a, struct entity* b, s32 c, s32 d)
{
    s32 result = TalkToSecretBazaarNpc(a, b, c, d, 1);

    ov29_022F0AE0();

    return result;
}

extern void MakeMonsterIdleInDirection2(struct entity *entity, u8 direction);
extern void ov29_02322DDC(struct entity *user, struct move *move, char *message,
                          struct entity **targets, s32 param_5, s32 param_6);
extern void AnimationDelayOrSomething(s32 param_1);
extern void ExecuteMoveEffect(struct entity **targets, struct entity *user,
                              struct move *move, s32 param_4, s32 param_5);
extern void ov29_022E81F8(void);
extern s32 TryPointCameraToMonster(struct entity *entity, s32 param_2, s32 param_3);
extern void ov29_0234D690(s32 message_id, struct preprocessor_args *args,
                          s32 param_3, s32 param_4, u8 param_5);
extern void ov29_0234D650(void);

void MakeTargetFaceUserAndIdle(struct entity *target, struct entity *user)
{
    MakeMonsterIdleInDirection2(target,
                                GetDirectionTowardsPosition(&target->pos, &user->pos));
}

void ov29_022F067C(struct entity *user, struct entity *target, enum move_id move_id)
{
    struct move move;
    struct entity *targets[5];
    s32 i;
    s32 n;

    if (target == NULL) {
        n = 0;
        for (i = 0; i < 4; i++) {
            struct entity *entity = DUNGEON_PTR[0]->monster_slot_ptrs[i];
            if (EntityIsValid__022F0590(entity)) {
                targets[n] = entity;
                n++;
            }
        }
        if (n < 4) {
            targets[n] = NULL;
        } else if (n == 4) {
            targets[4] = NULL;
        }
    } else {
        targets[0] = target;
        targets[1] = NULL;
    }

    move.flags0 = 0;
    move.flags2 = 0;
    move.id = (enum move_id)0;
    move.pp = 0;
    move.ginseng = 0;
    move.flags0 = 1;
    move.flags2 = 0;
    move.id = move_id;
    move.pp = 1;
    move.ginseng = 0;

    ov29_02322DDC(user, &move, NULL, targets, 0, 1);
    AnimationDelayOrSomething(1);
    ExecuteMoveEffect(targets, user, &move, 0, 0);
    ov29_022E81F8();
    WaitUntilAlertBoxPauseIsOver(10);
    ov29_0234B1A4(0);
    TryPointCameraToMonster(GetLeader(), 1, 1);
}

void ov29_022F0780(s32 message_id)
{
    ov29_0234D668();
    ov29_0234D690(message_id, GetMessageLogPreprocessorArgs(), 0, 0, 1);
    ov29_0234D650();
}
