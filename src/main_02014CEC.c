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

bool8 IsRealMove(enum move_id move_id)
{
    if (move_id == MOVE_NOTHING) return FALSE;
    if (move_id == MOVE_JUDGMENT) return FALSE;
    if (move_id == MOVE_STRUGGLE) return FALSE;
    
    // MOVE_REGULAR_ATTACK
    // MOVE_IS_WATCHING
    // MOVE_BIDE_UNLEASH
    // MOVE_REVENGE_UNLEASH
    // MOVE_AVALANCHE_UNLEASH
    if ((move_id >= MOVE_REGULAR_ATTACK) && (move_id < MOVE_WIDE_SLASH)) {
        return FALSE;
    }

    // MOVE_UNNAMED_0x169
    // MOVE_UNNAMED_0x16A
    // MOVE_SEE_TRAP
    // MOVE_TAKEAWAY
    // MOVE_REBOUND
    // MOVE_BLOOP_SLASH
    // MOVE_SWITCHER
    // MOVE_BLOWBACK
    // MOVE_WARP
    // MOVE_TRANSFER
    // MOVE_SLOW_DOWN
    // MOVE_SPEED_BOOST
    // MOVE_SEARCHLIGHT
    // MOVE_PETRIFY
    // MOVE_STAY_AWAY
    // MOVE_POUNCE
    // MOVE_TRAWL
    // MOVE_CLEANSE
    // MOVE_OBSERVER
    // MOVE_DECOY_MAKER
    // MOVE_SIESTA
    // MOVE_TOTTER
    // MOVE_TWO_EDGE
    // MOVE_NO_MOVE
    // MOVE_ESCAPE
    // MOVE_SCAN
    // MOVE_POWER_EARS
    // MOVE_DROUGHT
    // MOVE_TRAP_BUSTER
    // MOVE_WILD_CALL
    // MOVE_INVISIFY
    // MOVE_ONE_SHOT
    // MOVE_HP_GAUGE
    if ((move_id > MOVE_WIDE_SLASH) && (move_id < MOVE_VACUUM_CUT)) {
        return FALSE;
    }

    // MOVE_REVIVER
    // MOVE_SHOCKER
    // MOVE_ECHO
    // MOVE_FAMISH
    // MOVE_ONE_ROOM
    // MOVE_FILL_IN
    // MOVE_TRAPPER
    // MOVE_POSSESS
    // MOVE_ITEMIZE
    // MOVE_TAG_0x194
    // MOVE_PROJECTILE
    // MOVE_HURL
    // MOVE_MOBILE
    // MOVE_ITEM_TOSS
    // MOVE_SEE_STAIRS
    // MOVE_LONG_TOSS
    // MOVE_TAG_0x19B
    // MOVE_PIERCE
    // MOVE_TAG_0x19D
    // MOVE_TAG_0x19E
    // MOVE_TAG_0x19F
    // MOVE_TAG_0x1A0
    // MOVE_TAG_0x1A1
    // MOVE_TAG_0x1A2
    // MOVE_TAG_0x1A3
    // MOVE_TAG_0x1A4
    // MOVE_TAG_0x1A5
    // MOVE_TAG_0x1A6
    // MOVE_TAG_0x1A7
    // MOVE_TAG_0x1A8
    // MOVE_TAG_0x1A9
    // MOVE_TAG_0x1AA
    // MOVE_TAG_0x1AB
    // MOVE_TAG_0x1AC
    // MOVE_TAG_0x1AD
    if ((move_id > MOVE_VACUUM_CUT) && (move_id <= MOVE_TAG_0x1AD)) {
        return FALSE;
    }

    // MOVE_TAG_0x21F
    // MOVE_TAG_0x220
    // MOVE_TAG_0x221
    // MOVE_TAG_0x222
    // MOVE_TAG_0x223
    // MOVE_TAG_0x224
    // MOVE_TAG_0x225
    // MOVE_TAG_0x226
    // MOVE_TAG_0x227
    // MOVE_TAG_0x228
    // MOVE_TAG_0x229
    // MOVE_TAG_0x22A
    // MOVE_TAG_0x22B
    // MOVE_TAG_0x22C
    // MOVE_TAG_0x22D
    // MOVE_TAG_0x22E
    // ...
    if (move_id >= MOVE_TAG_0x21F) {
        return FALSE;
    }
    
    return TRUE;
}

bool8 IsMovesetValid(struct ground_move* move)
{
    for (s16 i = 0; i < 4; i++) {
        if (GetFlag(move[i].flags0, ITEM_FLAG_EXISTS) && !IsRealMove(move[i].id)) {
            return FALSE;
        }
    }
    
    return TRUE;
}
