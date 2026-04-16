#include "main_0205D11C.h"

#include "debug.h"
#include "dungeon.h"
#include "item_util.h"
#include "item_util_4.h"
#include "mission.h"

extern u8 _020A39C0;
extern u8 _020A39D4;
extern u8 _020A39F0;
extern u8 _020A3A08;
extern u8 _020A3A24;
extern u8 _020A3A44;
extern u8 _020A3A6C;
extern u8 _020A3AA0;
extern const char _020A3AD4[];
extern const char _020A3AF4[];
extern const char _020A3B18[];

extern enum monster_id GetBaseForm(enum monster_id);
extern s32 GetBodySize(enum monster_id);
extern bool8 IsForbiddenFloor(struct dungeon_floor_pair*);
extern bool8 IsInvalidForMission(enum dungeon_id);
extern bool8 IsItemValidVeneer(s16 item_id);
extern bool8 IsMissionValid(struct mission *mission);
extern bool8 IsMonsterIllegalForMissions(enum monster_id);
extern bool8 IsMonsterMissionAllowed(enum monster_id);
extern s32 sub_02063424(enum mission_type, union mission_subtype*, enum dungeon_id);

bool8 sub_0205CF58(enum mission_type type, union mission_subtype* subtype, struct dungeon_floor_pair* df_pair)
{
    if (type != MISSION_FIND_ITEM || subtype->find_item != MISSION_TOGETIC_GABITE_SCALE) {
        if (type != MISSION_TYPE_CONSUMABLE) {
            if (IsInvalidForMission(df_pair->dungeon_id)) {
                Debug_Print0(&_020A39C0, df_pair->dungeon_id);
                return FALSE;
            }
            
            if (df_pair->floor_id > sub_02063424(type, subtype, df_pair->dungeon_id)) {
                Debug_Print0(&_020A39D4, df_pair->floor_id);
                return FALSE;
            }
            
            if (IsForbiddenFloor(df_pair) != 0) {
                Debug_Print0(&_020A39F0);
                return FALSE;
            }
        }
    }
    
    return TRUE;
}

bool8 sub_0205D008(enum mission_type type, union mission_subtype* subtype, enum monster_id outlaw_backup_species, bool8 arg3)
{
    if (arg3 && outlaw_backup_species == MONSTER_NONE) {
        Debug_Print0(&_020A3A08);
        return FALSE;
    }
    
    if ((s32)outlaw_backup_species >= 0x483) {
        Debug_Print0(&_020A3A24);
        return FALSE;
    }
    
    if (outlaw_backup_species != GetBaseForm(outlaw_backup_species)) {
        Debug_Print0(&_020A3A44, outlaw_backup_species);
        return FALSE;
    }
    
    if (IsMonsterIllegalForMissions(outlaw_backup_species)) {
        Debug_Print0(&_020A3A6C, outlaw_backup_species);
        return FALSE;
    }
    
    if (arg3 &&
        (type == MISSION_ESCORT_TO_TARGET ||
         type == MISSION_EXPLORE_WITH_CLIENT ||
         type == MISSION_PROSPECT_WITH_CLIENT ||
         type == MISSION_GUIDE_CLIENT) &&
        GetBodySize(outlaw_backup_species) != 1) {
        return FALSE;
    }
    
    if (arg3 && type != MISSION_ARREST_OUTLAW && type != MISSION_TYPE_CONSUMABLE && type != MISSION_CHALLENGE_REQUEST) {
        if (!IsMonsterMissionAllowed(outlaw_backup_species)) {
            Debug_Print0(&_020A3AA0, outlaw_backup_species);
            return FALSE;
        }
    }
    
    return TRUE;
}

bool8 sub_0205D11C(u32 r0, u32 r1, s16 r2)
{
    if (r2 == 0) {
        Debug_Print0(_020A3AD4, r2);
        return FALSE;
    }

    if (IsValidTargetItem(r2)) {
        Debug_Print0(_020A3AD4, r2);
        return FALSE;
    }

    if (!IsItemValidVeneer(r2)) {
        Debug_Print0(_020A3AD4, r2);
        return FALSE;
    }

    if (IsThrownItem(r2) && r0 == 4 && r2 != 10 && r2 != 9) {
        Debug_Print0(_020A3AF4, r2);
        return FALSE;
    }

    if (IsStorableItem(r2)) {
        return TRUE;
    }

    Debug_Print0(_020A3B18, r2);
    return FALSE;
}

bool8 sub_0205D1F4(struct mission *mission) {
    if (!IsMissionValid(mission) || ((mission->status >= NUM_MISSIONS_STATUS))) {
        return FALSE;
    }
    return TRUE; 
}
