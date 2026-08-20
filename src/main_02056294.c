#include "main_02056294.h"

bool8 IsMonsterIdInNormalRange(s16 id)
{
    if (id >= 0 && id < 0x22B) {
        return TRUE;
    }
    return FALSE;
}
