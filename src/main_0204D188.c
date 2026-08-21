#include "main_0204D188.h"

extern s16 FemaleToMaleForm(s16 monster_id);

extern struct unk_020AFE60 *GLOBAL_PROGRESS_PTR;

bool8 GetMonsterFlag1(s16 id)
{
    return (GLOBAL_PROGRESS_PTR->field_0x0[id / 32] & (1 << (id % 32))) != 0;
}

void SetMonsterFlag2(s16 id)
{
    s16 m;

    m = FemaleToMaleForm(id);
    GLOBAL_PROGRESS_PTR->field_0x98[m / 32] |= 1 << (m % 32);
}

bool8 HasMonsterBeenAttackedInDungeons(s16 id)
{
    s16 m;

    m = FemaleToMaleForm(id);
    return (GLOBAL_PROGRESS_PTR->field_0x98[m / 32] & (1 << (m % 32))) != 0;
}

void SetDungeonTipShown(s32 idx)
{
    GLOBAL_PROGRESS_PTR->field_0x94[idx / 32] |= 1 << (idx % 32);
}

bool8 GetDungeonTipShown(s32 idx)
{
    if (idx >= 0x1F) {
        return 0;
    }

    return (GLOBAL_PROGRESS_PTR->field_0x94[idx / 32] & (1 << (idx % 32))) != 0;
}

void SetMaxReachedFloor(u32 idx, u8 floor)
{
    if (idx < 0xB4) {
        GLOBAL_PROGRESS_PTR->field_0x143[idx] = floor;
    }
}

u8 GetMaxReachedFloor(u32 idx)
{
    if (idx >= 0xB4) {
        return 0;
    }

    return GLOBAL_PROGRESS_PTR->field_0x143[idx];
}

void IncrementNbAdventures(void)
{
    GLOBAL_PROGRESS_PTR->field_0x1F8 += 1;

    if (GLOBAL_PROGRESS_PTR->field_0x1F8 > 0xF423F) {
        GLOBAL_PROGRESS_PTR->field_0x1F8 = 0xF423F;
    }
}

u32 GetNbAdventures(void)
{
    return GLOBAL_PROGRESS_PTR->field_0x1F8;
}

s32 CanMonsterSpawn(void)
{
    return 1;
}
