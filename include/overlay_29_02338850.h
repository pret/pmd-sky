#ifndef PMDSKY_OVERLAY_29_02338850_H
#define PMDSKY_OVERLAY_29_02338850_H

#include "dungeon.h"
#include "util.h"

enum hidden_stairs_type GetHiddenStairsField(void);
void SetHiddenStairsField(enum hidden_stairs_type value);
enum hidden_stairs_type GetHiddenFloorField(void);
void SetHiddenFloorField(enum hidden_stairs_type value);

#endif
