#ifndef PMDSKY_MAIN_02014A4C_H
#define PMDSKY_MAIN_02014A4C_H
#include "common.h"
#include "save.h"

void CopyMoveToStream(struct bitstream * stream, struct ground_move * move );
void CopyMoveFromStream(struct bitstream * stream, struct ground_move * move );

#endif //PMDSKY_MAIN_02014A4C_H
