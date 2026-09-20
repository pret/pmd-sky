#ifndef PMDSKY_OVERLAY_29_0230F810_H
#define PMDSKY_OVERLAY_29_0230F810_H

#include "util.h"

#include "dungeon_mode.h"

void ov29_0230F140(struct entity *entity);
void ov29_0230F14C(struct entity *entity);
void ov29_0230F158(struct entity *entity);
void TryNonLeaderItemPickUp(struct entity *entity);
bool8 GetExclusiveItemWithEffectFromBag(struct entity *entity, enum exclusive_item_effect_id effect_id, struct item *out);
bool8 AuraBowIsActive(struct entity *entity);
void ov29_0230F728(struct entity *attacker, struct entity *defender, enum exclusive_item_effect_id effect_id, s32 flags);
u8 ExclusiveItemOffenseBoost(struct entity *entity, s32 idx);
u8 ExclusiveItemDefenseBoost(struct entity *entity, s32 idx);
s32 TeamMemberHasItemActive(struct entity **buf, enum item_id item_id);
// Checks if a monster is holding a certain item that isn't disabled by Klutz.
bool8 ItemIsActive__0230F810(struct entity *entity, enum item_id item_id);
bool8 TeamMemberHasExclusiveItemEffectActive(enum exclusive_item_effect_id effect_id);

#endif //PMDSKY_OVERLAY_29_0230F810_H
