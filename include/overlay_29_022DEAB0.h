#ifndef PMDSKY_OVERLAY_29_022DEAB0_H
#define PMDSKY_OVERLAY_29_022DEAB0_H

// Allocates a new dungeon struct.
// This updates the master dungeon pointer and returns a copy of that pointer.
// return: pointer to a newly allocated dungeon struct
struct dungeon* DungeonAlloc(void);
// Returns the master dungeon pointer (a global, see DUNGEON_PTR_MASTER).
// return: pointer to a newly allocated dungeon struct
struct dungeon* GetDungeonPtrMaster(void);
// Zero-initializes the dungeon struct pointed to by the master dungeon pointer.
void DungeonZInit(void);
// Frees the dungeons struct pointer to by the master dungeon pointer, and nullifies the pointer.
void DungeonFree(void);

#endif //PMDSKY_OVERLAY_29_022DEAB0_H
