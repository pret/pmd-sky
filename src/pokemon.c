#include "pokemon.h"

bool8 IqSkillFlagTest(u32 *iq_skill_flags, u32 iq_id)
{
    u32 flags_index = iq_id >> 5;
    u32 flags_section = iq_skill_flags[flags_index];
    u32 flag_bit_index = iq_id - (flags_index << 5);
    return (flags_section & (1 << flag_bit_index)) != 0;
}
