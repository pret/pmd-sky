#include "debug.h"
#include "enums.h"
#include "main_0200224C.h"
#include "main_0200330C.h"
#include "main_0200ECFC.h"
#include "scenario_flag.h"
#include "script_variable.h"
#include "script_variable_2.h"
#include "special_episode.h"
#include "story_progress.h"

#define LOCAL_SCRIPT_VAR_OFFSET (s16) 0x400

#ifdef JAPAN
#define VAR_GROUND_ENTER_VALUE 0x13C
#elif EUROPE
#define VAR_GROUND_ENTER_VALUE 0x143
#else
#define VAR_GROUND_ENTER_VALUE 0x137
#endif

// Global script variable definitions
extern struct script_var_def SCRIPT_VARS[];
// Local script variable definitions
extern struct script_var_def SCRIPT_VARS_LOCALS[];
// Global script variable values
extern u8 SCRIPT_VARS_VALUES[];
extern u8 EVENT_FLAG_EXPANSION_ERROR;
extern u8 EVENT_FLAG_COMPARE_SCRIPT_VARIABLES_ERROR;
extern const u8 EVENT_FLAG_GAME_MODE_DEBUG_MSG;
extern const u8 EVENT_FLAG_BACKUP_DEBUG_MSG;
extern u8 EVENT_FLAG_SIZE_DEBUG_MSG;
extern s16 _0209DF70[18];

extern s32 GetPartyMembers(s32 param1);
extern s32 GetMoneyStored();
extern s32 GetLanguageType();
extern enum game_mode GetGameMode();
extern s32 GetNotifyNote();
extern s32 SetMoneyStored(s32 arg0);
extern s32 SetNotifyNote(s32 arg0);
extern void InitDungeonListScriptVars();

const u8 EVENT_FLAG_FILE_NAME[] = "event_flag.c";
const struct prog_pos_info EVENT_FLAG_PROG_POS_INFO_CALC_SCRIPT_VARIABLES = {
    (u8*) EVENT_FLAG_FILE_NAME,
    1001
};
const struct prog_pos_info EVENT_FLAG_PROG_POS_INFO_COMPARE_SCRIPT_VARIABLES = {
    (u8*) EVENT_FLAG_FILE_NAME,
    1044
};

void DebugPrintEventFlagSize() {
    Debug_Print0(&EVENT_FLAG_SIZE_DEBUG_MSG, _0209DF70[18], 0x400);
}

void InitScriptVariableValues() {
    for(s32 sv_id = 0; sv_id < LOCAL_SCRIPT_VAR_OFFSET; sv_id++) {
        SCRIPT_VARS_VALUES[sv_id] = 0;
    }

    for (s16 sv_id = 0; sv_id < 114; sv_id++) {
        struct script_var_def* def = &SCRIPT_VARS[sv_id];
        s16 type = def->type;
        if (type != 0 && type != 9) {
            for (u16 idx = 0; idx < def->n_values; idx++) {
                SaveScriptVariableValueAtIndex(0, sv_id, idx, def->default_val);
            }
        }
    }
    
    SaveScriptVariableValue(0, VAR_ROM_VARIATION, 0);
    ZeroInitScriptVariable(0, 1);
    InitEventFlagScriptVars();
    
    for(s32 idx2 = 0; idx2 < 4; idx2++) {
        SaveScriptVariableValueAtIndex(0, VAR_GROUND_ENTER_BACKUP, idx2, VAR_GROUND_ENTER_VALUE);
        SaveScriptVariableValueAtIndex(0, VAR_GROUND_ENTER_LINK_BACKUP, idx2, 0);
        SaveScriptVariableValueAtIndex(0, VAR_GROUND_GETOUT_BACKUP, idx2, VAR_GROUND_ENTER_VALUE);
        SaveScriptVariableValueAtIndex(0, VAR_GROUND_MAP_BACKUP, idx2, -1);
        SaveScriptVariableValueAtIndex(0, VAR_GROUND_PLACE_BACKUP, idx2, 0xBB);
        SaveScriptVariableValueAtIndex(0, VAR_DUNGEON_ENTER_BACKUP, idx2, 0);
        SaveScriptVariableValueAtIndex(0, VAR_DUNGEON_ENTER_INDEX_BACKUP, idx2, -1);
        SaveScriptVariableValueAtIndex(0, VAR_DUNGEON_RESULT_BACKUP, idx2, 0);
        SaveScriptVariableValueAtIndex(0, VAR_GROUND_START_MODE_BACKUP, idx2, 0);
        SaveScriptVariableValueAtIndex(0, VAR_PLAYER_KIND_BACKUP, idx2, 0);
        SaveScriptVariableValueAtIndex(0, VAR_ATTENDANT1_KIND_BACKUP, idx2, 2);
        SaveScriptVariableValueAtIndex(0, VAR_ATTENDANT2_KIND_BACKUP, idx2, 0);
    }
    
    SaveScriptVariableValue(0, VAR_DUNGEON_SELECT, -1);
    SaveScriptVariableValue(0, VAR_REQUEST_CLEAR_COUNT, 0);
    SaveScriptVariableValue(0, VAR_TEAM_RANK_EVENT_LEVEL, 0);
    SaveScriptVariableValue(0, VAR_HERO_FIRST_KIND, 0);
    SaveScriptVariableValue(0, VAR_PARTNER_FIRST_KIND, 0);
    SaveScriptVariableValue(0, VAR_HERO_TALK_KIND, 4);
    SaveScriptVariableValue(0, VAR_PARTNER_TALK_KIND, 1);
    SaveScriptVariableValue(0, VAR_SPECIAL_EPISODE_TYPE, -1);
    ZeroInitScriptVariable(0, VAR_SPECIAL_EPISODE_OPEN);
    ZeroInitScriptVariable(0, VAR_SPECIAL_EPISODE_OPEN_OLD);
    ZeroInitScriptVariable(0, VAR_SPECIAL_EPISODE_CONQUEST);
    InitScenarioProgressScriptVars();
    InitWorldMapScriptVars();
    InitDungeonListScriptVars();
}

void InitEventFlagScriptVars() {
    SaveScriptVariableValue(0, VAR_GROUND_ENTER, VAR_GROUND_ENTER_VALUE);
    SaveScriptVariableValue(0, VAR_GROUND_ENTER_LINK, 0);
    SaveScriptVariableValue(0, VAR_GROUND_GETOUT, VAR_GROUND_ENTER_VALUE);
    SaveScriptVariableValue(0, VAR_GROUND_MAP, -1);
    SaveScriptVariableValue(0, VAR_GROUND_PLACE, 0xBB);
    SaveScriptVariableValue(0, VAR_DUNGEON_ENTER, 0);
    SaveScriptVariableValue(0, VAR_DUNGEON_ENTER_INDEX, -1);
    SaveScriptVariableValue(0, VAR_DUNGEON_RESULT, 0);
    SaveScriptVariableValue(0, VAR_GROUND_START_MODE, 0);
    SaveScriptVariableValue(0, VAR_PLAYER_KIND, 0);
    SaveScriptVariableValue(0, VAR_ATTENDANT1_KIND, 2);
    SaveScriptVariableValue(0, VAR_ATTENDANT2_KIND, 0);
}

void DefaultInitScriptVariable(union script_var_value sv_locals[], s16 sv_id) {
    struct script_var_def* def;

    if (sv_id < LOCAL_SCRIPT_VAR_OFFSET) {
        def = &SCRIPT_VARS[sv_id];
    } else {
        def = &SCRIPT_VARS_LOCALS[sv_id - LOCAL_SCRIPT_VAR_OFFSET];
    }

    for(u16 idx = 0; idx < def->n_values; idx++) {
        SaveScriptVariableValueAtIndex(sv_locals, sv_id, idx, def->default_val);
    }
}

void ZeroInitScriptVariable(union script_var_value sv_locals[], s16 sv_id) {
    struct script_var_def* def;

    if (sv_id < LOCAL_SCRIPT_VAR_OFFSET) {
        def = &SCRIPT_VARS[sv_id];
    } else {
        def = &SCRIPT_VARS_LOCALS[sv_id - LOCAL_SCRIPT_VAR_OFFSET];
    }

    for(u16 idx = 0; idx < def->n_values; idx++) {
        SaveScriptVariableValueAtIndex(sv_locals, sv_id, idx, 0);
    }
}

void LoadScriptVariableRaw(struct script_var_raw* sv_raw,
    union script_var_value sv_val_local[],
    const s16 sv_id) {

    if (sv_id < (s16) LOCAL_SCRIPT_VAR_OFFSET) {
        // global script var
        sv_raw->def = &SCRIPT_VARS[sv_id];
        sv_raw->value = (union script_var_value*)
                         &SCRIPT_VARS_VALUES[sv_raw->def->mem_offset];
    } else {
        // local script var
        sv_raw->def = &SCRIPT_VARS_LOCALS[sv_id - LOCAL_SCRIPT_VAR_OFFSET];
        sv_raw->value = &sv_val_local[sv_raw->def->mem_offset];
    }
}

s32 LoadScriptVariableValue(union script_var_value sv_local[], s16 sv_id)
{
    struct script_var_raw result;
    LoadScriptVariableRaw(&result, sv_local, sv_id);

    switch((s16)result.def->type) {
        case VARTYPE_NONE:
            break;
        case VARTYPE_BIT:
            // Return true if the value has a particular bit set
            if(result.value->u8 & (u8)(1 << result.def->bitshift)) {
                return TRUE;
            }
            return FALSE;
        case VARTYPE_STRING:
        case VARTYPE_UINT8:
            return result.value->u8;
        case VARTYPE_INT8:
            return result.value->s8;
        case VARTYPE_UINT16:
            return result.value->u16;
        case VARTYPE_INT16:
            return result.value->s16;
        case VARTYPE_UINT32:
        case VARTYPE_INT32:
            return result.value->u32;
        case VARTYPE_SPECIAL:
            switch(sv_id) {
                case VAR_FRIEND_SUM:
                    return 1;
                case VAR_UNIT_SUM:
                    return GetPartyMembers(0);
                case VAR_CARRY_GOLD:
                    return GetMoneyCarried();
                case VAR_BANK_GOLD:
                    return GetMoneyStored();
                case VAR_LANGUAGE_TYPE:
                    return GetLanguageType();
                case VAR_GAME_MODE:
                    return GetGameMode();
                case VAR_EXECUTE_SPECIAL_EPISODE_TYPE:
                    switch(GetGameMode()) {
                        case GAME_MODE_1:
                            return GetDebugSpecialEpisodeNumber();
                        case GAME_MODE_SPECIAL_EPISODE:
                            return GetSpecialEpisodeType();
                        default:
                            return -1;
                    }
                case VAR_NOTE_MODIFY_FLAG:
                    return GetNotifyNote();
            }
    }

    return 0;
}

s32 LoadScriptVariableValueAtIndex(union script_var_value sv_local[], s16 id, u16 idx)
{
    struct script_var_raw result;
    LoadScriptVariableRaw(&result, sv_local, id);

    switch ((s16)result.def->type) {
        case VARTYPE_NONE:
            break;
        case VARTYPE_BIT: {
            u16 offset = idx + result.def->bitshift;
            u8 val = ((u8*)result.value)[offset / 8];
            u8 bit = (1 << (offset & (8 - 1)));
            return (val & bit) != 0;
        }
        case VARTYPE_STRING:
        case VARTYPE_UINT8:
            return ((u8*)result.value)[idx];
        case VARTYPE_INT8:
            return ((s8*)result.value)[idx];
        case VARTYPE_UINT16:
            return ((u16*)result.value)[idx];
        case VARTYPE_INT16:
            return ((s16*)result.value)[idx];
        case VARTYPE_UINT32:
        case VARTYPE_INT32:
            return ((u32*)result.value)[idx];
        case VARTYPE_SPECIAL:
            switch (id) {
                case VAR_FRIEND_SUM:
                    return 1;
                case VAR_UNIT_SUM:
                    return GetPartyMembers(0);
                case VAR_CARRY_GOLD:
                    return GetMoneyCarried();
                case VAR_BANK_GOLD:
                    return GetMoneyStored();
                case VAR_LANGUAGE_TYPE:
                    return GetLanguageType();
                case VAR_GAME_MODE:
                    return GetGameMode();
                case VAR_EXECUTE_SPECIAL_EPISODE_TYPE:
                    switch (GetGameMode()) {
                        case GAME_MODE_1:
                            return GetDebugSpecialEpisodeNumber();
                        case GAME_MODE_SPECIAL_EPISODE:
                            return GetSpecialEpisodeType();
                        default:
                            return -1;
                    }
                case VAR_NOTE_MODIFY_FLAG:
                    return GetNotifyNote();
            }
    }
    return 0;
}

void SaveScriptVariableValue(union script_var_value sv_locals[], const s16 script_var_id, u32 new_val)
{
    struct script_var_raw script_var_raw;
    LoadScriptVariableRaw(&script_var_raw, sv_locals, script_var_id);

    switch ((s16)script_var_raw.def->type) {
        case VARTYPE_BIT:
            u32 bitmask = 1 << script_var_raw.def->bitshift;
            u8 truncated_bitmask = bitmask & 0xff;
            if (new_val != FALSE) {
                // the new value is true, so we set the bits specified in the bitmask
                script_var_raw.value->u8 |= truncated_bitmask;
                return;
            }
            // the new value is false, so we unset the bits specified in bitmask
            u8 current_val;
            current_val = script_var_raw.value->u8;
            current_val |= truncated_bitmask;
            script_var_raw.value->u8 = truncated_bitmask ^ current_val;
            return;
        case VARTYPE_STRING:
        case VARTYPE_UINT8:
            script_var_raw.value->u8 = (u8)new_val;
            return;
        case VARTYPE_INT8:
            script_var_raw.value->s8 = (s8)new_val;
            return;
        case VARTYPE_UINT16:
            script_var_raw.value->u16 = (u16)new_val;
            return;
        case VARTYPE_INT16:
            script_var_raw.value->s16 = (s16)new_val;
            return;
        case VARTYPE_UINT32:
        case VARTYPE_INT32:
            script_var_raw.value->u32 = new_val;
            return;
        case VARTYPE_SPECIAL:
            switch (script_var_id) {
                case VAR_CARRY_GOLD:
                    SetMoneyCarried(new_val);
                    AddMoneyCarried(0);
                    return;
                case VAR_BANK_GOLD:
                    SetMoneyStored(new_val);
                    return;
                case VAR_EXECUTE_SPECIAL_EPISODE_TYPE:
                    if (GetGameMode() == GAME_MODE_1) {
                         SetDebugSpecialEpisodeNumber(new_val);
                         return;
                    }
                    return;
                case VAR_NOTE_MODIFY_FLAG:
                    u8 param;
                    if (new_val != FALSE) {
                        param = TRUE;
                    } else {
                        param = FALSE;
                    }
                    SetNotifyNote(param);
                    break;
            }
            break;

        default:
            return;
        }

    return;
}

void SaveScriptVariableValueAtIndex(union script_var_value sv_locals[], s16 script_var_id, u16 idx, s32 new_val)
{
    struct script_var_raw script_var_raw;
    LoadScriptVariableRaw(&script_var_raw, sv_locals, script_var_id);

    switch ((s16)script_var_raw.def->type) {
        case VARTYPE_BIT:
            // For VARTYPE_BIT, idx specifies a number of bits
            u16 offset = idx + script_var_raw.def->bitshift;
            u8 *val = &((u8*)script_var_raw.value)[offset / 8];
            u8 bitmask = (1 << (offset & (8 - 1)));
            if (new_val != FALSE) {
                // new value is true, so we set the bits specified in the bitmask
                *val = *val | bitmask;
                return;
            }
            // new value is false, so we unset the bits specified in bitmask
            *val = bitmask ^ (*val | bitmask);
            return;
        case VARTYPE_STRING:
        case VARTYPE_UINT8:
            ((u8*)script_var_raw.value)[idx] = new_val;
            return;
        case VARTYPE_INT8:
            ((s8*)script_var_raw.value)[idx] = new_val;
            return;
        case VARTYPE_UINT16:
            ((u16*)script_var_raw.value)[idx] = (u16)new_val;
            return;
        case VARTYPE_INT16:
            ((s16*)script_var_raw.value)[idx] = (s16)new_val;
            return;
        case VARTYPE_UINT32:
        case VARTYPE_INT32:
            ((s32*)script_var_raw.value)[idx] = (s32)new_val;
            return;
        case VARTYPE_SPECIAL:
            switch (script_var_id) {
                case VAR_CARRY_GOLD:
                    SetMoneyCarried(new_val);
                    AddMoneyCarried(0);
                    return;
                case VAR_BANK_GOLD:
                    SetMoneyStored(new_val);
                    return;
                case VAR_EXECUTE_SPECIAL_EPISODE_TYPE:
                    if (GetGameMode() == GAME_MODE_1) {
                         SetDebugSpecialEpisodeNumber(new_val);
                         return;
                    }
                    return;
                case VAR_NOTE_MODIFY_FLAG:
                    SetNotifyNote((u8)(new_val != FALSE));
                    break;
            }
            break;

        default:
            return;
        }

    return;
}

s32 LoadScriptVariableValueSum(union script_var_value sv_local[], const s16 sv_id)
{
    struct script_var_raw script_var_raw;
    s32 total = 0;

    LoadScriptVariableRaw(&script_var_raw, 0, sv_id);

    for(s32 idx = 0; idx < (s16) script_var_raw.def->n_values; idx++) {
        total += LoadScriptVariableValueAtIndex(sv_local, sv_id, (u16) idx);
    }

    return total;
}

void LoadScriptVariableValueBytes(const s16 sv_id, u8* result, s32 num_bytes)
{
    struct script_var_raw sv_raw;
    LoadScriptVariableRaw(&sv_raw, 0, sv_id);

    s32 i = 0;
    u8* val_ptr = (u8*) sv_raw.value;

    for(i = 0; i < num_bytes; i++) {
        u8 val = *val_ptr;
        *result = val;
        val_ptr += 1;
        result += 1;
    }
}

void LoadScriptVariableValueString(const s16 sv_id, u8* result, u8 num_bytes)
{
    LoadScriptVariableValueBytes(sv_id, result, num_bytes);
    result[num_bytes] = 0;
}

void SaveScriptVariableValueBytes(const s16 sv_id, u8* result, s32 num_bytes)
{
    struct script_var_raw sv_raw;
    LoadScriptVariableRaw(&sv_raw, 0, sv_id);

    s32 i = 0;
    u8* val_ptr = (u8*) sv_raw.value;

    for(i = 0; i < num_bytes; i++) {
        u8 val = *result;
        *val_ptr = val;
        val_ptr += 1;
        result += 1;
    }
}

bool8 ScriptVariablesEqual(union script_var_value sv_val_ptr_local[], s16 sv_id_1, s16 sv_id_2)
{
    struct script_var_raw script_var_raw_1, script_var_raw_2;

    LoadScriptVariableRaw(&script_var_raw_1, sv_val_ptr_local, sv_id_1);
    LoadScriptVariableRaw(&script_var_raw_2, sv_val_ptr_local, sv_id_2);

    s32 n_values = script_var_raw_1.def->n_values;

    for(int idx = 0; idx < n_values; idx++) {
        if (LoadScriptVariableValueAtIndex(sv_val_ptr_local, sv_id_1, idx) !=
            LoadScriptVariableValueAtIndex(sv_val_ptr_local, sv_id_2, idx)) {
            return FALSE;
        }
    }

    return TRUE;
}

s32 CalcScriptVariables(s32 param_1, s32 param_2, enum script_calc_operation operation)
{
    switch (operation) {
        case CALC_SET:
            return param_2;
        case CALC_SUB:
            return param_1 - param_2;
        case CALC_ADD:
            return param_1 + param_2;
        case CALC_MUL:
            return param_1 * param_2;
        case CALC_DIV:
            return param_1 / param_2;
        case CALC_MOD:
            return param_1 % param_2;
        case CALC_AND:
            return param_1 & param_2;
        case CALC_OR:
            return param_1 | param_2;
        case CALC_XOR:
            return param_1 ^ param_2;
        case CALC_SETBIT:
            return (1 << param_2) | param_1;
        case CALC_CLEARBIT:
            return param_1 & ~(1 << param_2);
        case CALC_RANDOM:
            return RandInt(param_2);
        default:
            struct prog_pos_info ppi = EVENT_FLAG_PROG_POS_INFO_CALC_SCRIPT_VARIABLES;
            Debug_FatalError(&ppi, &EVENT_FLAG_EXPANSION_ERROR, operation);
    }
}

bool8 CompareScriptVariables(s32 param_1, s32 param_2, enum compare_operation operation)
{
    switch (operation) {
        case CMP_TRUE:
            return TRUE;
        case CMP_FALSE:
            return FALSE;
        case CMP_EQ:
            return param_1 == param_2;
        case CMP_NE:
            return param_1 != param_2;
        case CMP_GT:
            return param_1 > param_2;
        case CMP_GE:
            return param_1 >= param_2;
        case CMP_LT:
            return param_1 < param_2;
        case CMP_LE:
            return param_1 <= param_2;
        case CMP_AND_NONZERO:
            return (param_1 & param_2) != 0;
        case CMP_XOR_NONZERO:
            return (param_1 ^ param_2) != 0;
        case CMP_BIT_SET:
            if(param_1 & (1 << param_2)) {
                return 1;
            } else {
                return 0;
            }
        default:
            struct prog_pos_info ppi = EVENT_FLAG_PROG_POS_INFO_COMPARE_SCRIPT_VARIABLES;
            Debug_FatalError(&ppi, &EVENT_FLAG_COMPARE_SCRIPT_VARIABLES_ERROR, operation);
        }
}

s32 CalcScriptVariablesVeneer(s32 param_1, s32 param_2, enum script_calc_operation operation)
{
    return CalcScriptVariables(param_1, param_2, operation);
}

void CalcAndUpdateScriptVarWithOtherValue(union script_var_value sv_local[], const s16 script_var_id, s32 param, enum script_calc_operation operation)
{
    s32 value = LoadScriptVariableValue(sv_local, script_var_id);
    s32 result = CalcScriptVariables(value, param, operation);
    SaveScriptVariableValue(sv_local, script_var_id, result);
}

void CalcAndUpdateScriptVarWithOtherScriptVar(union script_var_value sv_local[], s16 sv_id_1, s16 sv_id_2, enum script_calc_operation op)
{
    s32 value_1 = LoadScriptVariableValue(sv_local, sv_id_1);
    s32 value_2 = LoadScriptVariableValue(sv_local, sv_id_2);
    s32 result = CalcScriptVariables(value_1, value_2, op);
    SaveScriptVariableValue(sv_local, sv_id_1, result);
}

bool8 CompareScriptVariablesVeneer(s32 param_1, s32 param_2, enum compare_operation op)
{
    return CompareScriptVariables(param_1, param_2, op);
}

bool8 LoadAndCompareScriptVarAndValue(union script_var_value sv_local[], s16 sv_id, s32 param, enum compare_operation op)
{
    s32 value = LoadScriptVariableValue(sv_local, sv_id);
    return CompareScriptVariables(value, param, op);
}

bool8 LoadAndCompareScriptVars(union script_var_value sv_local[], s16 sv_id_1, s16 sv_id_2, enum compare_operation op)
{
    s32 value_1 = LoadScriptVariableValue(sv_local, sv_id_1);
    s32 value_2 = LoadScriptVariableValue(sv_local, sv_id_2);
    return CompareScriptVariables(value_1, value_2, op);
}

// This inline allows EventFlagResume to match
static inline s32 LoadScriptVariableValueAtIndexInline(s16 sv_id, u32 idx)
{
    return LoadScriptVariableValueAtIndex(0, sv_id, idx);
}

void EventFlagResume()
{
    u32 game_mode = GetGameMode();
    if (game_mode <= 1U) {
        return;
    }
    u32 idx = game_mode - 2;
    Debug_Print0(&EVENT_FLAG_GAME_MODE_DEBUG_MSG, idx);

    SaveScriptVariableValue(0, VAR_GROUND_ENTER, LoadScriptVariableValueAtIndexInline(VAR_GROUND_ENTER_BACKUP, idx));
    SaveScriptVariableValue(0, VAR_GROUND_ENTER_LINK, LoadScriptVariableValueAtIndexInline(VAR_GROUND_ENTER_LINK_BACKUP, idx));
    SaveScriptVariableValue(0, VAR_GROUND_GETOUT, LoadScriptVariableValueAtIndexInline(VAR_GROUND_GETOUT_BACKUP, idx));
    SaveScriptVariableValue(0, VAR_GROUND_MAP, LoadScriptVariableValueAtIndexInline(VAR_GROUND_MAP_BACKUP, idx));
    SaveScriptVariableValue(0, VAR_GROUND_PLACE, LoadScriptVariableValueAtIndexInline(VAR_GROUND_PLACE_BACKUP, idx));
    SaveScriptVariableValue(0, VAR_DUNGEON_ENTER, LoadScriptVariableValueAtIndexInline(VAR_DUNGEON_ENTER_BACKUP, idx));
    SaveScriptVariableValue(0, VAR_DUNGEON_ENTER_MODE, LoadScriptVariableValueAtIndexInline(VAR_DUNGEON_ENTER_MODE_BACKUP, idx));
    SaveScriptVariableValue(0, VAR_DUNGEON_ENTER_INDEX, LoadScriptVariableValueAtIndexInline(VAR_DUNGEON_ENTER_INDEX_BACKUP, idx));
    SaveScriptVariableValue(0, VAR_DUNGEON_ENTER_FREQUENCY, LoadScriptVariableValueAtIndexInline(VAR_DUNGEON_ENTER_FREQUENCY_BACKUP, idx));
    SaveScriptVariableValue(0, VAR_DUNGEON_RESULT, LoadScriptVariableValueAtIndexInline(VAR_DUNGEON_RESULT_BACKUP, idx));
    SaveScriptVariableValue(0, VAR_GROUND_START_MODE, LoadScriptVariableValueAtIndexInline(VAR_GROUND_START_MODE_BACKUP, idx));
    SaveScriptVariableValue(0, VAR_PLAYER_KIND, LoadScriptVariableValueAtIndexInline(VAR_PLAYER_KIND_BACKUP, idx));
    SaveScriptVariableValue(0, VAR_ATTENDANT1_KIND, LoadScriptVariableValueAtIndexInline(VAR_ATTENDANT1_KIND_BACKUP, idx));
    SaveScriptVariableValue(0, VAR_ATTENDANT2_KIND, LoadScriptVariableValueAtIndexInline(VAR_ATTENDANT2_KIND_BACKUP, idx));

    ScenarioFlagRestore();
}

// This inline allows EventFlagBackup to match
static inline s32 SaveScriptVariableValueAtIndexInline(s16 sv_id, u32 idx, u32 new_val)
{
    SaveScriptVariableValueAtIndex(0, sv_id, idx, new_val);
}

void EventFlagBackup()
{
    u32 game_mode;
    u32 idx;

    game_mode = GetGameMode();
    if (game_mode <= 1U) {
        return;
    }
    idx = game_mode - 2;
    Debug_Print0(&EVENT_FLAG_BACKUP_DEBUG_MSG, idx);

    SaveScriptVariableValueAtIndexInline(VAR_GROUND_ENTER_BACKUP, idx, LoadScriptVariableValue(0, VAR_GROUND_ENTER));
    SaveScriptVariableValueAtIndexInline(VAR_GROUND_ENTER_LINK_BACKUP, idx, LoadScriptVariableValue(0, VAR_GROUND_ENTER_LINK));
    SaveScriptVariableValueAtIndexInline(VAR_GROUND_GETOUT_BACKUP, idx, LoadScriptVariableValue(0, VAR_GROUND_GETOUT));
    SaveScriptVariableValueAtIndexInline(VAR_GROUND_MAP_BACKUP, idx, LoadScriptVariableValue(0, VAR_GROUND_MAP));
    SaveScriptVariableValueAtIndexInline(VAR_GROUND_PLACE_BACKUP, idx, LoadScriptVariableValue(0, VAR_GROUND_PLACE));
    SaveScriptVariableValueAtIndexInline(VAR_DUNGEON_ENTER_BACKUP, idx, LoadScriptVariableValue(0, VAR_DUNGEON_ENTER));
    SaveScriptVariableValueAtIndexInline(VAR_DUNGEON_ENTER_MODE_BACKUP, idx, LoadScriptVariableValue(0, VAR_DUNGEON_ENTER_MODE));
    SaveScriptVariableValueAtIndexInline(VAR_DUNGEON_ENTER_INDEX_BACKUP, idx, LoadScriptVariableValue(0, VAR_DUNGEON_ENTER_INDEX));
    SaveScriptVariableValueAtIndexInline(VAR_DUNGEON_ENTER_FREQUENCY_BACKUP, idx, LoadScriptVariableValue(0, VAR_DUNGEON_ENTER_FREQUENCY));
    SaveScriptVariableValueAtIndexInline(VAR_DUNGEON_RESULT_BACKUP, idx, LoadScriptVariableValue(0, VAR_DUNGEON_RESULT));
    SaveScriptVariableValueAtIndexInline(VAR_GROUND_START_MODE_BACKUP, idx, LoadScriptVariableValue(0, VAR_GROUND_START_MODE));
    SaveScriptVariableValueAtIndexInline(VAR_PLAYER_KIND_BACKUP, idx, LoadScriptVariableValue(0, VAR_PLAYER_KIND));
    SaveScriptVariableValueAtIndexInline(VAR_ATTENDANT1_KIND_BACKUP, idx, LoadScriptVariableValue(0, VAR_ATTENDANT1_KIND));
    SaveScriptVariableValueAtIndexInline(VAR_ATTENDANT2_KIND_BACKUP, idx, LoadScriptVariableValue(0, VAR_ATTENDANT2_KIND));

    ScenarioFlagBackup();
}

// This dumps the global script variables (up to 0x400 bytes),
// but doesn't dump the local script variables (0x400 onwards).
bool8 DumpScriptVariableValues(u8* dest)
{
    EventFlagBackup();
    MemcpySimple(dest, &SCRIPT_VARS_VALUES[0], LOCAL_SCRIPT_VAR_OFFSET);
    return TRUE;
}

// This restores the global script variables (up to 0x400 bytes),
// but doesn't restore the local script variables (0x400 onwards).
bool8 RestoreScriptVariableValues(u8* src)
{
    struct script_var_raw sv_raw;
    u8 ret_val;

    LoadScriptVariableRaw(&sv_raw, 0, VAR_VERSION);
    MemcpySimple(&SCRIPT_VARS_VALUES[0], src, 0x400);

    // If these values are not equal, then the save file
    // will be treated as corrupted, which thus gets deleted.
    if (sv_raw.def->default_val == sv_raw.value->u32) {
        ret_val = TRUE;
    } else {
        ret_val = FALSE;
    }

    return ret_val;
}

void InitScenarioProgressScriptVars()
{
    SetScenarioProgressScriptVar(VAR_SCENARIO_SELECT, 0, 0);
    SetScenarioProgressScriptVar(VAR_SCENARIO_MAIN, 0, 0);
    SetScenarioProgressScriptVar(VAR_SCENARIO_SIDE, 0, 0);
    SetScenarioProgressScriptVar(VAR_SCENARIO_SUB1, 0, 0);
    SetScenarioProgressScriptVar(VAR_SCENARIO_SUB2, 0, 0);
    SetScenarioProgressScriptVar(VAR_SCENARIO_SUB3, 0, 0);
    SetScenarioProgressScriptVar(VAR_SCENARIO_SUB4, 0, 0);
    SetScenarioProgressScriptVar(VAR_SCENARIO_SUB5, 0, 0);
    SetScenarioProgressScriptVar(VAR_SCENARIO_SUB6, 0, 0);
    SetScenarioProgressScriptVar(VAR_SCENARIO_SUB7, 0, 0);
    SetScenarioProgressScriptVar(VAR_SCENARIO_SUB8, 0, 0);
    ZeroInitScriptVariable(0, VAR_SCENARIO_MAIN_BIT_FLAG);
    ZeroInitScriptVariable(0, VAR_SCENARIO_MAIN_BIT_FLAG_BACKUP);
    s32 idx = 0;
    do {
        SaveScriptVariableValueAtIndex(0, VAR_SCENARIO_SELECT_BACKUP, idx, 0);
        SaveScriptVariableValueAtIndex(0, VAR_SCENARIO_SELECT_BACKUP, (u16) (idx + 4), 0);
        idx += 1;
    } while (idx < 4);
    SaveScriptVariableValue(0, VAR_SCENARIO_BALANCE_FLAG, 0);
    SaveScriptVariableValue(0, VAR_SCENARIO_BALANCE_DEBUG, -1);
    SaveScriptVariableValue(0, VAR_PLAY_OLD_GAME, 0);
}

void LoadScriptVarValuePair(s16 script_var_id, s32* val_1, s32* val_2)
{
    *val_1 = LoadScriptVariableValueAtIndex(0, script_var_id, 0);
    *val_2 = LoadScriptVariableValueAtIndex(0, script_var_id, 1);
}
