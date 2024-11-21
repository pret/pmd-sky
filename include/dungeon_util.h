#ifndef PMDSKY_DUNGEON_UTIL_H
#define PMDSKY_DUNGEON_UTIL_H

#include "dungeon.h"

static inline struct monster *GetEntInfo(struct entity *ent)
{
    return ent->info;
}

#endif // PMDSKY_DUNGEON_UTIL_H