#ifndef PMDSKY_MAIN_0204FA24_H
#define PMDSKY_MAIN_0204FA24_H

#include "adventure_log.h"
#include "util.h"

void SetAdventureLogStructLocation(void);
void SetAdventureLogDungeonFloor(struct dungeon_floor_pair* floor);
struct dungeon_floor_pair* GetAdventureLogDungeonFloor(void);

#endif
