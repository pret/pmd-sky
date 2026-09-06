#ifndef PMDSKY_OVERLAY_29_0230BBAC_H
#define PMDSKY_OVERLAY_29_0230BBAC_H

#include "dungeon_mode.h"
#include "enums.h"
#include "overlay_29_02308FBC.h"

void CalcDamage(struct entity *attacker, struct entity *defender, enum type_id attack_type,
                s32 power, s32 crit_chance, struct unk_02308FE0 *damage_out,
                s32 damage_mult, enum move_id move_id, s32 a9);

#endif
