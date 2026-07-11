#include "main_02014CEC.h"
#include "enums.h"

extern u16 PUNCH_MOVE_LIST[];

bool8 Is2TurnsMove(enum move_id move_id)
{
    if (move_id == MOVE_SOLARBEAM) return TRUE;
    else if (move_id == MOVE_SKY_ATTACK) return TRUE;
    else if (move_id == MOVE_RAZOR_WIND) return TRUE;
    else if (move_id == MOVE_FOCUS_PUNCH) return TRUE;
    else if (move_id == MOVE_SKULL_BASH) return TRUE;
    else if (move_id == MOVE_FLY) return TRUE;
    else if (move_id == MOVE_BOUNCE) return TRUE;
    else if (move_id == MOVE_DIVE) return TRUE;
    else if (move_id == MOVE_DIG) return TRUE;
    else if (move_id == MOVE_SHADOW_FORCE) return TRUE;
    else return FALSE;
}

bool8 IsRegularAttackOrProjectile(enum move_id move_id)
{
    if (move_id == MOVE_REGULAR_ATTACK)
        return TRUE;

    return move_id == MOVE_PROJECTILE;
}

bool8 IsPunchMove(enum move_id move_id)
{
    for (s16 i = 0; PUNCH_MOVE_LIST[i] != 0; i++) {
        if (PUNCH_MOVE_LIST[i] == move_id) {
            return TRUE;
        }
    }
    return FALSE;
}

bool8 IsHealingWishOrLunarDance(enum move_id move_id)
{
    if (move_id == MOVE_HEALING_WISH) return TRUE;
    if (move_id == MOVE_LUNAR_DANCE) return TRUE;
    
    return FALSE;
}

bool8 IsCopyingMove(enum move_id move_id)
{
    if (move_id == MOVE_MIMIC) return TRUE;
    if (move_id == MOVE_SKETCH) return TRUE;
    if (move_id == MOVE_COPYCAT) return TRUE;
    
    return FALSE;
}

bool8 IsTrappingMove(enum move_id move_id)
{
    if (move_id == MOVE_SPIKES) return TRUE;
    if (move_id == MOVE_TOXIC_SPIKES) return TRUE;
    if (move_id == MOVE_STEALTH_ROCK) return TRUE;
    if (move_id == MOVE_TRAPPER) return TRUE;
    
    return FALSE;
}

bool8 IsOneHitKoMove(enum move_id move_id)
{
    if (move_id == MOVE_FISSURE) return TRUE;
    if (move_id == MOVE_SHEER_COLD) return TRUE;
    if (move_id == MOVE_HORN_DRILL) return TRUE;
    if (move_id == MOVE_GUILLOTINE) return TRUE;

    return FALSE;
}

bool8 IsNot2TurnsMoveOrSketch(enum move_id move_id)
{
    if (Is2TurnsMove(move_id)) return FALSE;
    if (move_id == MOVE_SKETCH) return FALSE;
    
    return TRUE;
}
