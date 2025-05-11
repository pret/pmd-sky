#include "dungeon_logic.h"
#include "dungeon_util_static.h"

// This file cannot be combined with dungeon_logic.c, as this causes all the functions in dungeon_logic.c to be inlined within MonsterHasNegativeStatus.

bool8 MonsterHasNegativeStatus(struct entity *monster, bool8 check_held_item)
{
    struct monster *pokemon_info = GetEntInfo(monster);

    if (IsMonsterDrowsy(monster))
        return TRUE;

    if (MonsterHasNonvolatileNonsleepStatus(monster))
        return TRUE;

    if (MonsterHasImmobilizingStatus(monster))
        return TRUE;

    if (MonsterHasAttackInterferingStatus(monster))
        return TRUE;

    if (MonsterHasSkillInterferingStatus(monster))
        return TRUE;

    if (MonsterHasLeechSeedStatus(monster))
        return TRUE;

    if (MonsterHasWhifferStatus(monster))
        return TRUE;

    if (IsMonsterVisuallyImpaired(monster, check_held_item))
        return TRUE;

    if (IsMonsterMuzzled(monster))
        return TRUE;

    if (MonsterHasMiracleEyeStatus(monster))
        return TRUE;

    if (pokemon_info->exposed)
        return TRUE;

    if (pokemon_info->perish_song_turns != 0)
        return TRUE;

    for (s32 i = 0; i < MAX_MON_MOVES; i++)
    {
        bool8 move_exists;
        struct move *move = &pokemon_info->moves.moves[i];
        if (move->flags0 & MOVE_FLAG_EXISTS)
            move_exists = TRUE;
        else
            move_exists = FALSE;

        if (move_exists && move->flags2 & MOVE_FLAG_SEALED)
            return TRUE;
    }

    for (s32 i = 0; i < NUM_SPEED_COUNTERS; i++)
    {
        if (pokemon_info->speed_down_counters[i] != 0)
            return TRUE;
    }

    return FALSE;
}
