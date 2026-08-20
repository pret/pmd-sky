#ifndef PMDSKY_MAIN_0200F798_H
#define PMDSKY_MAIN_0200F798_H

#include "item.h"

struct item *GetFirstUnequippedItemOfType(s16 type);
u32 RemoveItemNoHoleCheck(struct item *item);

u32 RemoveFirstUnequippedItemOfType(s16 type);

#endif
