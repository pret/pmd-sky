#include "main_0205A430.h"
#include "main_0202593C.h"

extern u16 TACTIC_NAME_STRING_IDS[];

void CopyTacticString(char* buffer, enum tactic_id tactic_id)
{
#ifdef JAPAN
    CopyNStringFromId(buffer, TACTIC_NAME_STRING_IDS[tactic_id], 0x28);
#else
    CopyNStringFromId(buffer, TACTIC_NAME_STRING_IDS[tactic_id], 0x40);
#endif
}
