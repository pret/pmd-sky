#ifndef PMDSKY_OVERLAY_29_02338350_H
#define PMDSKY_OVERLAY_29_02338350_H

#include "dungeon_mode.h"

bool8 NearbyAllyIqSkillIsEnabled(struct entity *entity, enum iq_skill_id iq_skill);
struct entity* FindAdjacentEnemy(struct entity *monster);
bool8 IsAdjacentToEnemyIgnoreTreatment(struct entity *monster);

#endif //PMDSKY_OVERLAY_29_02338350_H
