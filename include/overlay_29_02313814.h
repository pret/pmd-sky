#ifndef PMDSKY_OVERLAY_29_02313814_H
#define PMDSKY_OVERLAY_29_02313814_H

struct StatIndex
{
    int id;
};

void LowerDefensiveStat(struct entity *pokemon, struct entity *target, struct StatIndex stat, s32 increment, bool8 checkProtected, bool8 logMsgProtected);

#endif //PMDSKY_OVERLAY_29_02313814_H
