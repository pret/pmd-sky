#ifndef PMDSKY_MAIN_0200D81C_H
#define PMDSKY_MAIN_0200D81C_H

#include "item.h"

void ItemZInit(struct item* item);
bool8 AreItemsEquivalent(struct item* item1, struct item* item2, s32 bitmask);
void sub_0200D894(struct item* item);

#endif //PMDSKY_MAIN_0200D81C_H
