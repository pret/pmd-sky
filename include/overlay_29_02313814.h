#ifndef PMDSKY_OVERLAY_29_02313814_H
#define PMDSKY_OVERLAY_29_02313814_H

#define STAT_INDEX_PHYSICAL 0 // Atk, Def
#define STAT_INDEX_SPECIAL 1 // Sp Atk, Sp Def
#define STAT_INDEX_ACCURACY STAT_INDEX_PHYSICAL
#define STAT_INDEX_EVASION STAT_INDEX_SPECIAL

struct StatIndex
{
    int id;
};

void LowerOffensiveStat(struct entity *user, struct entity *target, struct StatIndex stat, s32 nStagesRaw, bool8 checkProtected, bool8 logMsgProtected);
void LowerDefensiveStat(struct entity *user, struct entity *target, struct StatIndex stat, s32 increment, bool8 checkProtected, bool8 logMsgProtected);
void BoostOffensiveStat(struct entity *user, struct entity *target, struct StatIndex stat, s32 nStagesRaw);
void BoostDefensiveStat(struct entity *user, struct entity *target, struct StatIndex stat, s32 nStagesRaw);

#endif //PMDSKY_OVERLAY_29_02313814_H
