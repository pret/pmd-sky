#ifndef PMDSKY_OVERLAY_29_023018AC_H
#define PMDSKY_OVERLAY_29_023018AC_H

#include "dungeon_mode.h"
#include "targeting.h"

enum monster_treatment GetTreatmentBetweenMonstersIgnoreStatus(struct entity *entity1, struct entity *entity2);
bool8 SafeguardIsActive(struct entity *user, struct entity *target, bool8 log_message);
bool8 LeafGuardIsActive(struct entity *user, struct entity *target, bool8 log_message);

#endif //PMDSKY_OVERLAY_29_023018AC_H
