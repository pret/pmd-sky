#ifndef PMDSKY_OVERLAY_29_02347BA4_H
#define PMDSKY_OVERLAY_29_02347BA4_H

#include "dungeon_mode.h"

struct projectile_throw_info
{
    u8 unk0;
    u8 unk1;
    s16 unk2;
};

struct projectile_hit_entry
{
    struct entity *target;
    bool8 did_hit;
};

// Checks if a monster is holding a certain item that isn't disabled by Klutz.
bool8 ItemIsActive__02347B50(struct entity *entity, enum item_id item_id);
// Checks if a monster is a team member under the effects of a certain exclusive item effect.
bool8 ExclusiveItemEffectIsActive__02347B80(struct entity *entity, enum exclusive_item_effect_id effect_id);
// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__02347BA4(struct entity *entity);
void HandleCurvedProjectileThrow(struct entity *thrower, struct item *item, struct position *start_pos, struct position *target_pos, struct projectile_throw_info *projectile_throw_info);

#endif //PMDSKY_OVERLAY_29_02347BA4_H
