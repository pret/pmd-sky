#include "main_0201514C.h"

bool8 IsSameMove(struct move* moveset, struct move* move) {
    if (!GET_FLAG(move->flags0, MOVE_FLAG_EXISTS)) {
        return FALSE;
    }
    
    for (s16 i = 0; i < 4; i++) {
        if (!GET_FLAG(moveset[i].flags0, MOVE_FLAG_EXISTS)) {
            break;
        }
        
        if (move->id == moveset[i].id) {
            return TRUE;
        }
    }
    
    return FALSE;
}
