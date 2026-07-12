#ifndef PMDSKY_MAIN_0201514C_H
#define PMDSKY_MAIN_0201514C_H

#include "common.h"
#include "enums.h"
#include "move_data.h"
#include "util.h"

bool8 IsSameMove(struct move* moveset, struct move* move);
u8 GetMoveCategory(enum move_id move_id);

#endif //PMDSKY_MAIN_0201514C_H
