#include "main_0205A430.h"
#include "main_0202593C.h"

extern u16 TACTIC_NAME_STRING_IDS[];

extern void sub_0205B120(struct stat_boosts *boosts, enum monster_id monster_id, struct item *item, s32 iq, bool8 klutz_active);

void CopyTacticString(char* buffer, enum tactic_id tactic_id)
{
#ifdef JAPAN
    CopyNStringFromId(buffer, TACTIC_NAME_STRING_IDS[tactic_id], 0x28);
#else
    CopyNStringFromId(buffer, TACTIC_NAME_STRING_IDS[tactic_id], 0x40);
#endif
}

void GetStatBoostsForMonsterSummary(struct monster_summary *monster_summary, enum monster_id monster_id, struct item *item, s32 iq, bool8 klutz_active)
{
    struct stat_boosts boosts;

    sub_0205B120(&boosts, monster_id, item, iq, klutz_active);

    monster_summary->attack_boost += boosts.attack_boost;
    monster_summary->special_attack_boost += boosts.special_attack_boost;
    monster_summary->defense_boost += boosts.defense_boost;
    monster_summary->special_defense_boost += boosts.special_defense_boost;
}
