#ifndef PMDSKY_OVERLAY_29_022FBBEC_H
#define PMDSKY_OVERLAY_29_022FBBEC_H

#include "dungeon_mode.h"

struct entity* FindMonsterWithBehavior(enum monster_behavior monster_behavior);
bool8 CountActiveMonsters(void);
bool8 ov29_022FBC94(s16 monster_id);
#ifndef JAPAN
void ov29_022FBD08(void);
bool8 ov29_022FBD24(struct entity *entity);
bool8 ov29_022FBD80(struct entity *entity);
#endif

#endif //PMDSKY_OVERLAY_29_022FBBEC_H
