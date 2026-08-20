#include "main_0204FB9C.h"
#include "adventure_log.h"

void SetAdventureLogCompleted(s32 id)
{
    ADVENTURE_LOG_PTR->completion_flags[id >> 5] |= 1 << (id & 0x1F);
}

s32 IsAdventureLogNotEmpty(void)
{
    s32 i;
    struct adventure_log *log = ADVENTURE_LOG_PTR;

    for (i = 0; i < 4; i++) {
        if (log->completion_flags[i] != 0) {
            return 1;
        }
    }
    return 0;
}

bool8 GetAdventureLogCompleted(s32 id)
{
    return (ADVENTURE_LOG_PTR->completion_flags[id >> 5] & (1 << (id & 0x1F))) != 0;
}

void IncrementNbDungeonsCleared(void)
{
    ADVENTURE_LOG_PTR->nb_dungeons_cleared++;
    ADVENTURE_LOG_PTR->completion_flags[0] |= 0x10;
    if ((s32) ADVENTURE_LOG_PTR->nb_dungeons_cleared > 999999) {
        ADVENTURE_LOG_PTR->nb_dungeons_cleared = 999999;
    }
}

u32 GetNbDungeonsCleared(void)
{
    return ADVENTURE_LOG_PTR->nb_dungeons_cleared;
}

void IncrementNbFriendRescues(void)
{
    ADVENTURE_LOG_PTR->nb_friend_rescues++;
    if ((s32) ADVENTURE_LOG_PTR->nb_friend_rescues > 999999) {
        ADVENTURE_LOG_PTR->nb_friend_rescues = 999999;
    }
    ADVENTURE_LOG_PTR->completion_flags[0] |= 0x40;
}

u32 GetNbFriendRescues(void)
{
    return ADVENTURE_LOG_PTR->nb_friend_rescues;
}

void IncrementNbEvolutions(void)
{
    ADVENTURE_LOG_PTR->nb_evolutions++;
    if ((s32) ADVENTURE_LOG_PTR->nb_evolutions > 999999) {
        ADVENTURE_LOG_PTR->nb_evolutions = 999999;
    }
    ADVENTURE_LOG_PTR->completion_flags[0] |= 0x80;
}

u32 GetNbEvolutions(void)
{
    return ADVENTURE_LOG_PTR->nb_evolutions;
}

void IncrementNbSteals(void)
{

}
