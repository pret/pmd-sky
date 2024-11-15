#ifndef PMDSKY_MAIN_02054BE0_H
#define PMDSKY_MAIN_02054BE0_H

// Returns the ID of the first form of the specified monster if the specified ID corresponds to a secondary form with female gender and the first form has male gender. If those conditions don't meet, returns the same ID unchanged.
// monster_id: Monster ID
// return: ID of the male form of the monster if the requirements meet, same ID otherwise.
s16 FemaleToMaleForm(s16 monster_id);

#endif //PMDSKY_MAIN_02054BE0_H
