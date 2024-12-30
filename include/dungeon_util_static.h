#ifndef PMDSKY_DUNGEON_UTIL_STATIC_H
#define PMDSKY_DUNGEON_UTIL_STATIC_H

#include "dungeon.h"

static inline struct monster *GetEntInfo(struct entity *ent)
{
    return ent->info;
}

static inline bool8 ItemSticky(u8 flags)
{
    // Double bang is needed to match for some reason.
    return !!(flags & ITEM_FLAG_STICKY);
}

static inline bool8 ItemExists(u8 flags)
{
    return !!(flags & ITEM_FLAG_EXISTS);
}

#endif // PMDSKY_DUNGEON_UTIL_STATIC_H