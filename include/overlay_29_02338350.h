#ifndef PMDSKY_OVERLAY_29_02338350_H
#define PMDSKY_OVERLAY_29_02338350_H

#include "dungeon_mode.h"

s16 ov29_0233804C(void);
s32 ov29_023380FC(struct entity *entity, struct entity **targets);
struct entity* ov29_023381C0(struct entity *entity, enum iq_skill_id iq_skill, bool8 param_3);
bool8 NearbyAllyIqSkillIsEnabled(struct entity *entity, enum iq_skill_id iq_skill);
struct entity* FindAdjacentEnemy(struct entity *monster);
bool8 IsAdjacentToEnemyIgnoreTreatment(struct entity *monster);

#endif //PMDSKY_OVERLAY_29_02338350_H
