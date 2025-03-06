#include "joined_at_checks.h"

bool8 IsSpecialStoryAlly(struct monster *monster)
{
    if (monster->joined_at >= DUNGEON_JOINED_AT_BIDOOF && monster->joined_at < DUNGEON_DUMMY_0xE4)
        return TRUE;

    return FALSE;
}

bool8 IsExperienceLocked(struct monster *monster)
{
    if (monster->joined_at == DUNGEON_CLIENT)
        return TRUE;

    if (IsSpecialStoryAlly(monster))
        return TRUE;

    return FALSE;
}
