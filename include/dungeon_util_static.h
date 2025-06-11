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

static inline bool8 MoveExists(struct move *move)
{
    return move->flags0 & MOVE_FLAG_EXISTS ? TRUE : FALSE;
}

#define ENTITY_POISONED(entity_info)((entity_info->burn_class_status.burn == STATUS_BURN_POISONED || entity_info->burn_class_status.burn == STATUS_BURN_BADLY_POISONED))

#endif // PMDSKY_DUNGEON_UTIL_STATIC_H