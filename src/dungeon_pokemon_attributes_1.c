#include "dungeon_pokemon_attributes_1.h"
#include "dungeon_logic_7.h"
#include "dungeon_parameters_3.h"
#include "dungeon_parameters_4.h"
#include "dungeon_util_static.h"
#include "overlay_29_022FF898.h"
#include "overlay_29_023000E4.h"
#include "pokemon.h"

extern bool8 CanLearnIqSkill(s32 iq_amount, enum iq_skill_id iq_id);
extern void DisableIqSkill(u32 *iq_skills_flags, enum iq_skill_id iq_id);
extern void EnableIqSkill(u32 *iq_skills_flags, enum iq_skill_id iq_id);
extern bool8 GetPerformanceFlagWithChecks(s32 flag_id);
extern enum iq_skill_id GetSpeciesIqSkill(s16 monster_id, u8 index);

bool8 CanSeeInvisibleMonsters(struct entity *entity)
{
    if (GetEntInfo(entity)->blinker_class_status.blinded == STATUS_BLINKER_EYEDROPS)
        return TRUE;

    if (ItemIsActive__022FF898(entity, ITEM_GOGGLE_SPECS))
        return TRUE;

    return FALSE;
}

bool8 IsTacticSet(struct entity *entity, enum tactic_id tactic_id)
{
    struct monster *pokemon_info = GetEntInfo(entity);
    if (pokemon_info->is_team_leader)
        return tactic_id == TACTIC_YOU_GO_THE_OTHER_WAY;

    return pokemon_info->tactic == tactic_id;
}

bool8 HasDropeyeStatus(struct entity* entity)
{
    if (EntityIsValid__023000E4(entity) && GetEntInfo(entity)->blinker_class_status.blinded == STATUS_BLINKER_DROPEYE)
        return TRUE;

    return FALSE;
}

bool8 IqSkillIsEnabled(struct entity *entity, enum iq_skill_id iq_skill)
{
    struct monster *entity_info = GetEntInfo(entity);
    if (!entity_info->is_not_team_member && DUNGEON_PTR[0]->iq_disabled)
        return FALSE;

    return IqSkillFlagTest(entity_info->iq_skill_flags.flags, iq_skill);
}

void UpdateIqSkills(struct monster *monster)
{
    if (monster->is_not_team_member)
    {
        monster->iq_skill_flags.flags[0] = 0;
        monster->iq_skill_flags.flags[1] = 0;
        monster->iq_skill_flags.flags[2] = 0;

        for (s32 i = 0; i < MAX_NUM_IQ_SKILLS; i++)
        {
            enum iq_skill_id iq_skill = GetSpeciesIqSkill(monster->id, i);
            if (iq_skill == IQ_NONE_2)
                break;

            if (CanLearnIqSkill(monster->iq, iq_skill))
            {
                EnableIqSkill(monster->iq_skill_menu_flags.flags, iq_skill);
                EnableIqSkill(monster->iq_skill_flags.flags, iq_skill);
            }
        }

        if (monster->iq < MIN_IQ_EXCLUSIVE_MOVE_USER && IqSkillFlagTest(monster->iq_skill_flags.flags, IQ_EXCLUSIVE_MOVE_USER))
            DisableIqSkill(monster->iq_skill_flags.flags, IQ_EXCLUSIVE_MOVE_USER);

        if ((IsMonsterLoneOutlaw(monster) || monster->iq < MIN_IQ_ITEM_MASTER) && IqSkillFlagTest(monster->iq_skill_flags.flags, IQ_ITEM_MASTER))
            DisableIqSkill(monster->iq_skill_flags.flags, IQ_ITEM_MASTER);

        if (IqSkillFlagTest(monster->iq_skill_flags.flags, IQ_DEDICATED_TRAVELER))
            DisableIqSkill(monster->iq_skill_flags.flags, IQ_DEDICATED_TRAVELER);

        if (IqSkillFlagTest(monster->iq_skill_flags.flags, IQ_LAVA_EVADER))
            DisableIqSkill(monster->iq_skill_flags.flags, IQ_LAVA_EVADER);

        if (IqSkillFlagTest(monster->iq_skill_flags.flags, IQ_WEAK_TYPE_PICKER))
            DisableIqSkill(monster->iq_skill_flags.flags, IQ_WEAK_TYPE_PICKER);

        monster->tactic = TACTIC_GO_AFTER_FOES;
    }
    else
    {
        monster->iq_skill_flags.flags[0] = 0;
        monster->iq_skill_flags.flags[1] = 0;
        monster->iq_skill_flags.flags[2] = 0;
        for (s32 i = 0; i < MAX_NUM_IQ_SKILLS; i++)
        {
            enum iq_skill_id iq_skill = GetSpeciesIqSkill(monster->id, i);
            if (iq_skill == IQ_NONE_2)
                break;

            if (CanLearnIqSkill(monster->iq, iq_skill) && IqSkillFlagTest(monster->iq_skill_menu_flags.flags, iq_skill))
                EnableIqSkill(monster->iq_skill_flags.flags, iq_skill);
        }

        if (GetPerformanceFlagWithChecks(PERFORMANCE_PROGRESS_FLAG_RANDOM_MISSION))
        {
            EnableIqSkill(monster->iq_skill_menu_flags.flags, IQ_ESCAPIST);
            EnableIqSkill(monster->iq_skill_flags.flags, IQ_ESCAPIST);
        }

        if (IqSkillFlagTest(monster->iq_skill_menu_flags.flags, IQ_BRICK_TOUGH))
            EnableIqSkill(monster->iq_skill_flags.flags, IQ_BRICK_TOUGH);

        if (IqSkillFlagTest(monster->iq_skill_menu_flags.flags, IQ_MULTITALENT))
            EnableIqSkill(monster->iq_skill_flags.flags, IQ_MULTITALENT);
    }
}
