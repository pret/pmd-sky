#include "overlay_29_022DEAB0.h"

extern struct dungeon* DUNGEON_PTR[];

void MemFree(void* ptr);
void MemZero(void* ptr, u32 len);
void* MemAlloc(u32 len, u32 flags);

struct dungeon* DungeonAlloc(void)
{
    #ifdef JAPAN
    void* buf = MemAlloc(0x0002CA70,0);
    #else
    void* buf = MemAlloc(0x0002CB14,0);
    #endif
    
    DUNGEON_PTR[1]=buf;
}

struct dungeon* GetDungeonPtrMaster(void)
{
    return DUNGEON_PTR[1];
}

void DungeonZInit(void)
{
    #ifdef JAPAN
    MemZero(DUNGEON_PTR[1],0x0002CA70);
    #else
    MemZero(DUNGEON_PTR[1],0x0002CB14);
    #endif
}

void DungeonFree(void)
{
    if (DUNGEON_PTR[1] == 0) {
        return;
    }
    MemFree(DUNGEON_PTR[1]);
    DUNGEON_PTR[1]=0;
}
