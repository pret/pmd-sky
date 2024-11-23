#include "overlay_29_022FBAF0.h"

bool8 IsSpecialStoryAlly(struct monster *pokemon_info);

bool8 IsExperienceLocked(struct monster *pokemon_info)
{
    if (pokemon_info->joined_at == DUNGEON_CLIENT)
        return TRUE;

    if (IsSpecialStoryAlly(pokemon_info))
        return TRUE;

    return FALSE;
}
