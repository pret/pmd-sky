#ifndef PMDSKY_MAIN_020517D4_H
#define PMDSKY_MAIN_020517D4_H

// Returns the player's bag capacity for a given point in the game.
u32 GetBagCapacity(s32 scenario_balance);
u32 GetBagCapacitySpecialEpisode(s32 se_type);
struct unk_020517F4 {
    u8 field_0x0[4];
    s32 field_0x4;
    s32 field_0x8;
    s16 field_0xc;
    u8 field_0xe[2];
};

struct unk_020517F4* GetRankUpEntry(s32 rank);

#endif //PMDSKY_MAIN_020517D4_H
