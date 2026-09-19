#ifndef PMDSKY_OVERLAY_29_022E4B8C_H
#define PMDSKY_OVERLAY_29_022E4B8C_H

#include "dungeon_mode.h"
#include "item.h"
#include "move.h"
#include "move_orb_effects.h"
#include "overlay_29_02308FBC.h"

void ov29_022E4B8C(struct entity *entity);
void ov29_022E4BA0(struct entity *entity);
void ov29_022E4BB4(struct entity *entity);
void PlayAttractHitEffect(struct entity *entity);
void ov29_022E4C4C(struct entity *entity);
void ov29_022E4C84(struct entity *entity);
void ov29_022E4CD4(struct entity *entity);
void ov29_022E4D24(void);
void PlayOffensiveStatDownEffect(struct entity *entity, struct StatIndex stat_index);
void PlayDefensiveStatDownEffect(struct entity *entity, struct StatIndex stat_index);
void PlayOffensiveStatUpEffect(struct entity *entity, struct StatIndex stat_index);
void PlayDefensiveStatUpEffect(struct entity *entity, struct StatIndex stat_index);
void PlayOffensiveStatMultiplierUpEffect(struct entity *entity, struct StatIndex stat_index);
void PlayOffensiveStatMultiplierDownEffect(struct entity *entity, struct StatIndex stat_index);
void PlayDefensiveStatMultiplierUpEffect(struct entity *entity, struct StatIndex stat_index);
void PlayDefensiveStatMultiplierDownEffect(struct entity *entity, struct StatIndex stat_index);
void PlayHitChanceUpEffect(struct entity *entity, struct StatIndex stat_index);
void PlayHitChanceDownEffect(struct entity *entity, struct StatIndex stat_index);
void PlayExclamationPointEffect__022E5D4C(struct entity *entity);
void ov29_022E53EC(void);
void ov29_022E53F0(struct entity *entity);
void ov29_022E543C(struct entity *entity);
void ov29_022E5474(void);
void ov29_022E5478(struct entity *entity, struct unk_02308FE0 *damage_data);
void ov29_022E550C(struct entity *entity);
void ov29_022E555C(void);
void ov29_022E5560(struct entity *a, struct entity *b, s32 c);
void ov29_022E55F0(struct entity *a, struct entity *b);

#endif
