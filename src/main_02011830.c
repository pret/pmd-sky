#include "main_02011830.h"
#include "common.h"
#include "main_02054BE0.h"

u32 IsMonsterAffectedByGravelyrockGroundMode(struct ground_monster* monster)
{
    s16 id = FemaleToMaleForm(monster->id);

    return id == 0x1e0 || id == 0xb9;
}
