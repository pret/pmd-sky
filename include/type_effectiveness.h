#ifndef PMDSKY_TYPE_EFFECTIVENESS_H
#define PMDSKY_TYPE_EFFECTIVENESS_H

#include "dungeon_mode.h"
#include "overlay_29_02308FBC.h"

s16 GetTypeMatchup(struct entity *attacker, struct entity *defender, s16 target_type_idx, enum type_id attack_type);
int CalcTypeBasedDamageEffects(struct fixed_point_64 *out, struct entity *attacker, struct entity *defender, s32 power, enum type_id attack_type, struct unk_02308FE0 *damage_data, bool8 is_projectile);

#endif //PMDSKY_TYPE_EFFECTIVENESS_H
