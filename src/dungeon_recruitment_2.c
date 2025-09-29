#include "dungeon_recruitment_2.h"

#include "dungeon.h"
#include "enums.h"
#include "util.h"

extern struct dungeon_restriction DUNGEON_RESTRICTIONS[];

bool8 IsRecruitingAllowed(enum dungeon_id dungeon_id)
{
    bool8 return_val;

    if (DUNGEON_RESTRICTIONS[dungeon_id].flags & ALLOW_RECRUITING) {
        return_val = TRUE;
    } else {
        return_val = FALSE;
    }
    return return_val;
}
