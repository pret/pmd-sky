#ifndef PMDSKY_MAIN_02014CEC_H
#define PMDSKY_MAIN_02014CEC_H

#include "enums.h"
#include "util.h"

// Checks if a move ID is MOVE_REGULAR_ATTACK or MOVE_PROJECTILE.
bool8 IsRegularAttackOrProjectile(enum move_id move_id);

// Checks if the move is a two turn move
bool8 Is2TurnsMove(enum move_id move_id);

// Checks if the move is a punch move
bool8 IsPunchMove(enum move_id move_id);

// Checks if the move is a Healing Wish or Lunar Dance
bool8 IsHealingWishOrLunarDance(enum move_id move_id);

// Checks if the move is a copying move
bool8 IsCopyingMove(enum move_id move_id);

// Checks if the move is a trapping move
bool8 IsTrappingMove(enum move_id move_id);

// Checks if the move is a one hit KO move
bool8 IsOneHitKoMove(enum move_id move_id);

// Checks if the move is not a two turn move or sketch
bool8 IsNot2TurnsMoveOrSketch(enum move_id move_id);

bool8 IsRealMove(enum move_id move_id);

#endif //PMDSKY_MAIN_02014CEC_H
