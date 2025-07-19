#include "overlay_29_023000E4.h"

bool8 EntityIsValid__023000E4(struct entity *entity)
{
    if (entity == NULL)
        return FALSE;

    return entity->type != ENTITY_NOTHING;
}

#ifndef JAPAN
enum display_name_type GetMonsterDisplayNameType(struct monster *monster) {
    struct dungeon *dungeon = DUNGEON_PTR[0];
    if ( dungeon->display_data.blinded || dungeon->display_data.hallucinating || (!dungeon->display_data.can_see_traps && (monster->invisible_class_status.status == 1))) {
        if (monster->is_not_team_member) return DISPLAY_NAME_UNKNOWN;
    }
    if (monster->curse_class_status.curse == STATUS_CURSE_DECOY) return DISPLAY_NAME_DECOY;
    return DISPLAY_NAME_NORMAL;
}
#endif

extern void GetNameWithGender(char *dst, s16 monster_id, char color_id);
extern struct ground_monster *GetExplorerMazeMonster(u8 entry_number);
extern void sub_02056084(char *dst, struct ground_monster *ground_monster, u8 unk);
extern void sub_020585B4(char *dst, struct team_member *team_member);
extern struct team_member *GetActiveTeamMember(int roster_idx);

void GetMonsterName(char *buffer, struct monster *target_info) {
#ifndef JAPAN
    int display_name_type = GetMonsterDisplayNameType(target_info);
    if (display_name_type == DISPLAY_NAME_UNKNOWN) CopyStringFromId(buffer, 3124);
    else if (display_name_type == DISPLAY_NAME_DECOY) CopyStringFromId(buffer, 3122);
#else
    struct dungeon *dungeon = DUNGEON_PTR[0];
    if ( dungeon->display_data.blinded || dungeon->display_data.hallucinating || (!dungeon->display_data.can_see_traps && (target_info->invisible_class_status.status == 1))) {
        if (target_info->is_not_team_member) {
            CopyStringFromId(buffer, 2419);
            return;
        }
    }
    if (target_info->curse_class_status.curse == STATUS_CURSE_DECOY) CopyStringFromId(buffer, 2417);
#endif
    else if (target_info->is_not_team_member) {
        enum monster_behavior behavior = target_info->monster_behavior;
        if (behavior == BEHAVIOR_EXPLORER_MAZE_1) sub_02056084(buffer, GetExplorerMazeMonster(0), 0x4e);
        else if (behavior == BEHAVIOR_EXPLORER_MAZE_2) sub_02056084(buffer, GetExplorerMazeMonster(1), 0x4e);
        else if (behavior == BEHAVIOR_EXPLORER_MAZE_3) sub_02056084(buffer, GetExplorerMazeMonster(2), 0x4e);
        else if (behavior == BEHAVIOR_EXPLORER_MAZE_4) sub_02056084(buffer, GetExplorerMazeMonster(3), 0x4e);
        else GetNameWithGender(buffer, target_info->apparent_id, 'N');
    }
    else sub_020585B4(buffer, GetActiveTeamMember(target_info->team_index));
}
