#ifndef PMDSKY_MAIN_0205A430_H
#define PMDSKY_MAIN_0205A430_H

#include "enums.h"

// Gets the string corresponding to a given string ID and copies it to the specified buffer.
// This function won't write more than 64 bytes.
void CopyTacticString(char* buffer, enum tactic_id tactic_id);

#endif //PMDSKY_MAIN_0205A430_H
