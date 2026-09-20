#ifndef PMDSKY_OVERLAY_29_02320764_H
#define PMDSKY_OVERLAY_29_02320764_H

#include "dungeon_mode.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__02320764(struct entity *entity);
void TryAftermathExplosion(struct entity *attacker, struct entity *defender,
                           struct position *pos, s32 idx, enum type_id attack_type,
                           s16 damage_source);
void CalcExplosionDamage(struct entity *attacker, struct entity *defender,
                   enum type_id attack_type, s16 damage_source, s32 fixed_damage);
void CalcAftermathExplosionDamage(struct entity *attacker, struct entity *defender,
                   enum type_id attack_type, s16 damage_source, s32 fixed_damage);
void TryWarp(struct entity *user, struct entity *target, s32 warp_type,
             struct position *pos);
void EnsureCanStandCurrentTile(struct entity *entity);
void ov29_02321134(struct entity *entity);
void ov29_02321164(struct entity *a, struct entity *b);
void ov29_0232119C(struct entity *entity, s32 a, s32 b);

#endif //PMDSKY_OVERLAY_29_02320764_H
