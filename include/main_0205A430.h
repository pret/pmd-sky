#ifndef PMDSKY_MAIN_0205A430_H
#define PMDSKY_MAIN_0205A430_H

#include "dungeon_mode.h"

struct stat_boosts {
    s16 unk0;
    s16 attack_boost;
    s16 special_attack_boost;
    s16 defense_boost;
    s16 special_defense_boost;
};

// Gets the string corresponding to a given string ID and copies it to the specified buffer.
// This function won't write more than 64 bytes.
void CopyTacticString(char* buffer, enum tactic_id tactic_id);
void GetStatBoostsForMonsterSummary(struct monster_summary *monster_summary, enum monster_id monster_id, struct item *item, s32 iq, bool8 klutz_active);

#endif //PMDSKY_MAIN_0205A430_H
