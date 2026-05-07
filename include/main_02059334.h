#ifndef PMDSKY_MAIN_02059334_H
#define PMDSKY_MAIN_02059334_H

#include "common.h"
#include "save.h"

void WriteMonsterToSave(struct bitstream *stream, struct ground_monster *monster);
void ReadMonsterFromSave(struct bitstream *stream, struct ground_monster *monster);

#endif //PMDSKY_MAIN_02059334_H
