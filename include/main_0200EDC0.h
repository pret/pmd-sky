#ifndef PMDSKY_MAIN_0200EDC0_H
#define PMDSKY_MAIN_0200EDC0_H

#include "util.h"

s32 GetCurrentBagCapacity();
// Implements SPECIAL_PROC_IS_BAG_FULL (see ScriptSpecialProcessCall).
bool8 IsBagFull();

#endif //PMDSKY_MAIN_0200EDC0_H
