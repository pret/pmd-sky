#ifndef PMDSKY_TYPE_EFFECTIVENESS_H
#define PMDSKY_TYPE_EFFECTIVENESS_H

#include "dungeon_mode.h"

s16 GetTypeMatchup(struct entity *attacker, struct entity *defender, s16 target_type_idx, enum type_id attack_type);

#endif //PMDSKY_TYPE_EFFECTIVENESS_H
