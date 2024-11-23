#include "joined_at_checks.h"

bool8 IsSpecialStoryAlly(struct monster *pokemon_info)
{
    if (pokemon_info->joined_at >= DUNGEON_JOINED_AT_BIDOOF && pokemon_info->joined_at < DUNGEON_DUMMY_0xE4)
        return TRUE;

    return FALSE;
}

bool8 IsExperienceLocked(struct monster *pokemon_info)
{
    if (pokemon_info->joined_at == DUNGEON_CLIENT)
        return TRUE;

    if (IsSpecialStoryAlly(pokemon_info))
        return TRUE;

    return FALSE;
}
