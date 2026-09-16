#include "main_0204FA24.h"
#include "adventure_log.h"

void SetAdventureLogStructLocation(void)
{
    ADVENTURE_LOG_PTR = &_022AB69C;
}

void SetAdventureLogDungeonFloor(struct dungeon_floor_pair *floor)
{
    ADVENTURE_LOG_PTR->current_floor = *floor;
}

struct dungeon_floor_pair* GetAdventureLogDungeonFloor(void)
{
    return &ADVENTURE_LOG_PTR->current_floor;
}

void ClearAdventureLogStruct(void)
{
    s32 i;

    for (i = 0; i < 4; i++) {
        ADVENTURE_LOG_PTR->completion_flags[i] = 0;
    }
    ADVENTURE_LOG_PTR->pokemon_joined_counter = 0;
    ADVENTURE_LOG_PTR->pokemon_battled_counter = 0;
    ADVENTURE_LOG_PTR->moves_learned_counter = 0;
    ADVENTURE_LOG_PTR->nb_victories_on_one_floor = 0;
    ADVENTURE_LOG_PTR->nb_dungeons_cleared = 0;
    ADVENTURE_LOG_PTR->nb_friend_rescues = 0;
    ADVENTURE_LOG_PTR->nb_evolutions = 0;
    ADVENTURE_LOG_PTR->nb_eggs_hatched = 0;
    ADVENTURE_LOG_PTR->successful_steals = 0;
    ADVENTURE_LOG_PTR->nb_faints = 0;
    ADVENTURE_LOG_PTR->nb_big_treasure_wins = 0;
    ADVENTURE_LOG_PTR->nb_recycled = 0;
    ADVENTURE_LOG_PTR->nb_gifts_sent = 0;
    for (i = 0; i < 37; i++) {
        ADVENTURE_LOG_PTR->pokemon_joined_flags[i] = 0;
        ADVENTURE_LOG_PTR->pokemon_battled_flags[i] = 0;
    }
    for (i = 0; i < 17; i++) {
        ADVENTURE_LOG_PTR->moves_learned_flags[i] = 0;
    }
    for (i = 0; i < 44; i++) {
        ADVENTURE_LOG_PTR->items_acquired_flags[i] = 0;
    }
    ADVENTURE_LOG_PTR->special_challenge_flags = 0;
    for (i = 0; i < 5; i++) {
        ADVENTURE_LOG_PTR->sentry_duty_game_points[i] = (5 - i) * 1000;
    }
}
