#include "dg_random.h"
#include "dungeon_util_static.h"
#include "dungeon_pokemon_attributes.h"
#include "dungeon_pokemon_attributes_1.h"
#include "main_02001894.h"

extern prng_state DUNGEON_PRNG_STATE;
extern u32 DUNGEON_PRNG_STATE_SECONDARY_VALUES[];
#define DUNGEON_PRNG_LCG_MULTIPLIER 0x5d588b65
#define DUNGEON_PRNG_LCG_INCREMENT_SECONDARY 0x00269ec3

void InitDungeonRng(u32 seed) {
    DUNGEON_PRNG_STATE.last_value_primary = seed|1;
    s32 scratch_0 = 0;
    DUNGEON_PRNG_STATE.seq_num_primary = scratch_0;
    do {
        DUNGEON_PRNG_STATE_SECONDARY_VALUES[scratch_0]=seed;
        scratch_0++;
    } while (scratch_0<5);
}

u16 DungeonRand16Bit(void) {
    u32 mult = DUNGEON_PRNG_LCG_MULTIPLIER;

    if (DUNGEON_PRNG_STATE.use_secondary) {
        u32 increment = DUNGEON_PRNG_LCG_INCREMENT_SECONDARY;
        s32 idx = DUNGEON_PRNG_STATE.idx_secondary;
        u32 val = DUNGEON_PRNG_STATE_SECONDARY_VALUES[idx];
        
        u64 temp = (u64)val * mult;
        temp += increment; 
        
        u32 result = (u32)temp;
        DUNGEON_PRNG_STATE_SECONDARY_VALUES[idx] = result;
        
        return (u16)result;
    } else {
        // Accessing the global directly often changes register allocation
        DUNGEON_PRNG_STATE.seq_num_primary++;
        
        u32 result = (DUNGEON_PRNG_STATE.last_value_primary * mult) + 1;
        DUNGEON_PRNG_STATE.last_value_primary = result;
        
        return (u16)(result >> 16);
    }
}

s32 DungeonRandInt(s32 end)
{
    s32 entropy = DungeonRand16Bit();
    entropy &= 0xffff;
    entropy *= end;
    return (((s32) entropy) >> 0x10) & 0xffff;
}

s32 DungeonRandRange(s32 from, s32 to)
{
    s32 entropy;
    if (from == to) {
        return from;
    } else if (from<to) {
        entropy = DungeonRand16Bit();
        return from + ((s32)((entropy & 0xffff) * (to - from)) >> 0x10 & 0xffffU);
    } else {
        entropy = DungeonRand16Bit();
        return to + ((s32)((entropy & 0xffff) * (from - to)) >> 0x10 & 0xffffU);
    }
}

bool8 DungeonRandOutcome__022EAB20(s32 percentChance)
{
    if ((((DungeonRand16Bit() & 0xFFFF) * 100) >> 16) < percentChance)
    {
        return TRUE;
    }
    return FALSE;
}

bool8 DungeonRandOutcome__022EAB50(s32 percentChance)
{
    if ((((DungeonRand16Bit() & 0xFFFF) * 100) >> 16) < percentChance)
    {
        return TRUE;
    }
    return FALSE;
}

s32 CalcStatusDuration(struct entity *entity, const s16 *turn_range, bool8 iq_skill_effects)
{
    bool8 valid;
    s32 duration = DungeonRandRange(turn_range[0], turn_range[1]);

    if (entity == NULL)
        valid = FALSE;
    else
        valid = GetEntityType(entity) != ENTITY_NOTHING;

    if (valid && GetEntityType(entity) == ENTITY_MONSTER && iq_skill_effects)
    {
        if (IqSkillIsEnabled(entity, IQ_SELF_CURER) && duration != 127)
            duration = RoundUpDiv256(duration * 256 / 2);

        if (AbilityIsActiveVeneer(entity, ABILITY_NATURAL_CURE) && duration != 127)
        {
            if (duration >= 5)
                duration = 5;
        }
    }

    if (duration < 1)
        duration = 1;

    return duration;
}
