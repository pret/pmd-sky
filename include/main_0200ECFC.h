#ifndef PMDSKY_MAIN_0200ECFC_H
#define PMDSKY_MAIN_0200ECFC_H

typedef struct {
    u8 fill1[0x388];
    u8 unk388;
    u8 fill2[0x1009];
    u32 maybeMoney[]; // Unknown size, but indexed with an u8
} bag_items;

// Gets the amount of money the player is carrying.
// return: value
u32 GetMoneyCarried(void);

#endif //PMDSKY_MAIN_0200ECFC_H
