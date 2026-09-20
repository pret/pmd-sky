#ifndef PMDSKY_OVERLAY_29_023047B8_H
#define PMDSKY_OVERLAY_29_023047B8_H

#include "dungeon_mode.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__023047B8(struct entity *entity);
void ov29_023047DC(void);
void ov29_02304830(struct entity *entity, s32 animation_group_id);
void ov29_02304954(void);
void ChangeMonsterAnimation(struct entity *entity, s32 animation_id, s32 direction);
void ov29_023049D4(struct entity *entity, s32 animation_id, s32 direction);
void MakeMonsterIdleInDirectionIfValid(struct entity *entity, s32 direction);
void ChangeMonsterAnimationToIdle(struct entity *entity, s32 direction);
void ChangeMonsterAnimationToHurt(struct entity *entity, s32 direction);
s32 GetIdleAnimationId(struct entity *entity);
void MakeMonsterIdleInDirection(struct entity *entity, s32 direction);
void ov29_02304B14(struct entity *entity);
void DetermineAllMonsterShadow(void);
s32 DetermineMonsterShadow(struct entity *entity);
void ov29_02304C3C(struct entity *entity, s32 a);
void ov29_02304D20(struct entity *entity, s32 b, struct position *c);
bool8 DisplayActions(struct entity *a);

#endif //PMDSKY_OVERLAY_29_023047B8_H
