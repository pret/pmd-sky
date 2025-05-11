#ifndef PMDSKY_DUNGEON_LOGIC_H
#define PMDSKY_DUNGEON_LOGIC_H

#include "dungeon_mode.h"

// Checks if a monster has the sleep, nightmare, or yawning status. Note that this excludes the napping status.
bool8 IsMonsterDrowsy(struct entity *monster);
// Checks if a monster has one of the statuses in the "burn" group, which includes the traditionally non-volatile status conditions (except sleep) in the main series: STATUS_BURN, STATUS_POISONED, STATUS_BADLY_POISONED, STATUS_PARALYSIS, and STATUS_IDENTIFYING.
// STATUS_IDENTIFYING is probably included based on enum status_id? Unless it's handled differently somehow.
bool8 MonsterHasNonvolatileNonsleepStatus(struct entity *monster);
// Checks if a monster has one of the non-self-inflicted statuses in the "freeze" group, which includes status conditions that immobilize the monster: STATUS_FROZEN, STATUS_SHADOW_HOLD, STATUS_WRAPPED, STATUS_PETRIFIED, STATUS_CONSTRICTION, and STATUS_FAMISHED.
bool8 MonsterHasImmobilizingStatus(struct entity *monster);
// Checks if a monster has one of the statuses in the "cringe" group, which includes status conditions that interfere with the monster's ability to attack: STATUS_CRINGE, STATUS_CONFUSED, STATUS_PAUSED, STATUS_COWERING, STATUS_TAUNTED, STATUS_ENCORE, STATUS_INFATUATED, and STATUS_DOUBLE_SPEED.
// STATUS_DOUBLE_SPEED is probably included based on enum status_id? Unless it's handled differently somehow.
bool8 MonsterHasAttackInterferingStatus(struct entity *monster);
// Checks if a monster has one of the non-self-inflicted statuses in the "curse" group, which loosely includes status conditions that interfere with the monster's skills or ability to do things: STATUS_CURSED, STATUS_DECOY, STATUS_GASTRO_ACID, STATUS_HEAL_BLOCK, STATUS_EMBARGO.
bool8 MonsterHasSkillInterferingStatus(struct entity *monster);
// Checks if a monster is afflicted with Leech Seed.
bool8 MonsterHasLeechSeedStatus(struct entity *monster);
// Checks if a monster has the whiffer status.
bool8 MonsterHasWhifferStatus(struct entity *monster);
// Checks if a monster's vision is impaired somehow. This includes the checks in IsBlinded, as well as STATUS_CROSS_EYED and STATUS_DROPEYE.
bool8 IsMonsterVisuallyImpaired(struct entity *monster, bool8 check_held_item);
// Checks if a monster has the muzzled status.
bool8 IsMonsterMuzzled(struct entity *monster);
// Checks if a monster has the Miracle Eye status.
bool8 MonsterHasMiracleEyeStatus(struct entity *monster);
// Checks if a monster has any "negative" status conditions. This includes a wide variety of non-self-inflicted statuses that could traditionally be viewed as actual "status conditions", as well as speed being lowered and moves being sealed.
// monster: entity pointer
// check_held_item: flag for whether to check for the held item (see IsMonsterVisuallyImpaired)
bool8 MonsterHasNegativeStatus(struct entity *monster, bool8 check_held_item);

#endif //PMDSKY_DUNGEON_LOGIC_H
