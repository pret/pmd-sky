#ifndef PMDSKY_OVERLAY_29_02349208_H
#define PMDSKY_OVERLAY_29_02349208_H

#include "dungeon.h"
#include "util.h"

bool8 IsDestinationFloor(void);
bool8 IsCurrentMissionType(enum mission_type type);
bool8 IsCurrentMissionTypeExact(enum mission_type type, u8 subtype);

#endif
