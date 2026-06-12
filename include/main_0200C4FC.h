#ifndef PMDSKY_MAIN_0200C4FC_H
#define PMDSKY_MAIN_0200C4FC_H

#include "enums.h"

struct preprocessor_args {
    u8 buf00[0x10];
    u32 unk1c;
    u8 buf1e[0x50-0x10-0x4];
};

// Gets the message that is shown on the dungeon results ("The Last Outing") screen, right after the leader's name.
// damage_source_or_result: Damage source value to use when displaying the cause of fainting or the result of the expedition
// buffer: [output] Buffer where the resulting message will be stored
// buffer_size: Buffer size
// param_4: Seems to point to a buffer
void GetDungeonResultMsg(s32 damage_source_or_result, char* buffer, int buffer_size, struct preprocessor_args* param_4);

#endif //PMDSKY_MAIN_0200C4FC_H
