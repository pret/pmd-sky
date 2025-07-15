#ifndef PMDSKY_OVERLAY_29_023000E4_H
#define PMDSKY_OVERLAY_29_023000E4_H

#include "dungeon_mode.h"
#include "dungeon.h"
#include "common.h"
#include "main_0202593C.h"

// Checks if an entity pointer points to a valid entity (not entity type 0, which represents no entity).
bool8 EntityIsValid__023000E4(struct entity *entity);
#ifndef JAPAN
// Used when determining how a monster's name should be displayed.
enum display_name_type {
    DISPLAY_NAME_NORMAL = 0,  // Display the name as usual
    DISPLAY_NAME_UNKNOWN = 1, // Display "(?)"
    DISPLAY_NAME_DECOY = 2,   // Display "Decoy"
};
enum display_name_type GetMonsterDisplayNameType(struct monster *monster);
#endif
void GetMonsterName(char *buffer, struct monster *target_info);

#endif //PMDSKY_OVERLAY_29_023000E4_H
