#include "debug.h"
#include "enums.h"
#include "main_0200224C.h"
#include "scripting.h"

// Global script variable definitions
extern struct script_var_def SCRIPT_VARS[];
// Local script variable definitions
extern struct script_var_def SCRIPT_VARS_LOCALS[];
// Global script variable values
extern u8 SCRIPT_VARS_VALUES[];

struct prog_pos_info prog_pos_info = {
    0, // file name
    0   // line number
} ;

#define DEBUG_LOC_PTR(file, line)((&((prog_pos_info){file, line})))
#define FATAL_ERROR_ARGS(file, line, ...) Debug_FatalError(DEBUG_LOC_PTR(file, line), __VA_ARGS__ )
#define FATAL_ERROR(...) FATAL_ERROR_ARGS(__FILE__, __LINE__, __VA_ARGS__)

extern s32 GetPartyMembers(s32 param1);
extern s32 GetMoneyCarried();
extern s32 GetMoneyStored();
extern s32 GetLanguageType();
extern enum game_mode GetGameMode();
extern s32 sub_0204C918();
extern s32 GetSpecialEpisodeType();
extern s32 GetNotifyNote();
extern s32 AddMoneyCarried(s32 arg0);
extern s32 SetMoneyCarried(s32 arg0);
extern s32 SetMoneyStored(s32 arg0);
extern s32 SetNotifyNote(s32 arg0);
extern s32 sub_0204C928(s32 arg0);


// extern struct prog_pos_info EVENT_FLAG_PROG_POS_INFO;
extern u8 EVENT_FLAG_EXPANSION_ERROR;
// const u8 EVENT_FLAG_EXPANSION_ERROR[] = "event flag expansion error %d";

// @ 	.global EVENT_FLAG_PROG_POS_INFO
// @ EVENT_FLAG_PROG_POS_INFO:
// @ 	.word _0209CEBC
// @ 	.byte 0xE9, 0x03, 0x00, 0x00
// @ 	.word _0209CEBC
// @ 	.byte 0x14, 0x04, 0x00, 0x00
// @ 	.global _0209CEBC
// @ _0209CEBC:
// @ 	.byte 0x65, 0x76, 0x65, 0x6E, 0x74, 0x5F, 0x66, 0x6C
// @ 	.byte 0x61, 0x67, 0x2E, 0x63, 0x00, 0x00, 0x00, 0x00

struct EVENT_FLAG_PROG_POS_INFO_TYPE {
    const u8* file1;
    s32 line1;
    const u8* file2;
    s32 line2;
};

// const struct EVENT_FLAG_PROG_POS_INFO_TYPE EVENT_FLAG_PROG_POS_INFO = {
//     (u8*) 0x0209cebc,
//     1001,
//     (u8*) 0x0209cebc,
//     1044
// };

const u8 EVENT_FLAG[] = "event_flag.c"; // _0209CEBC
const struct EVENT_FLAG_PROG_POS_INFO_TYPE EVENT_FLAG_PROG_POS_INFO = {
    EVENT_FLAG,
    1001,
    EVENT_FLAG,
    1044
};


        
void LoadScriptVariableRaw(struct script_var_raw* sv_raw,
union script_var_value sv_val_local[],
const enum script_var_id sv_id) {
    short LOCAL_SCRIPT_VAR_OFFSET = 0x400;
    
    if (sv_id < LOCAL_SCRIPT_VAR_OFFSET) {
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

s32 LoadScriptVariableValue(union script_var_value sv_local[], enum script_var_id sv_id)
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
                            return sub_0204C918();
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

s32 LoadScriptVariableValueAtIndex(union script_var_value sv_local[], enum script_var_id id, u16 idx)
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
                            return sub_0204C918();
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

void SaveScriptVariableValue(union script_var_value sv_locals[], const enum script_var_id script_var_id, u32 new_val)
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
                         sub_0204C928(new_val);
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

void SaveScriptVariableValueAtIndex(union script_var_value sv_locals[], const enum script_var_id script_var_id, int idx, s32 new_val)
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
                         sub_0204C928(new_val);
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

s32 LoadScriptVariableValueSum(union script_var_value sv_local[], const enum script_var_id sv_id)
{
    struct script_var_raw script_var_raw;
    s32 total = 0;
    
    LoadScriptVariableRaw(&script_var_raw, 0, sv_id);
    
    for(s32 idx = 0; idx < (s16) script_var_raw.def->n_values; idx++) {
        total += LoadScriptVariableValueAtIndex(sv_local, sv_id, (u16) idx);
    }
    
    return total;
}

void LoadScriptVariableValueBytes(const enum script_var_id sv_id, u8* result, s32 num_bytes)
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

void LoadScriptVariableValueString(const enum script_var_id sv_id, u8* result, u8 num_bytes)
{
    LoadScriptVariableValueBytes(sv_id, result, num_bytes);
    result[num_bytes] = 0;
}

void SaveScriptVariableValueBytes(const enum script_var_id sv_id, u8* result, s32 num_bytes)
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

s32 ScriptVariablesEqual(union script_var_value sv_val_ptr_local[], enum script_var_id sv_id_1, enum script_var_id sv_id_2)
{
    struct script_var_raw script_var_raw_1, script_var_raw_2;

    LoadScriptVariableRaw(&script_var_raw_1, sv_val_ptr_local, sv_id_1);
    LoadScriptVariableRaw(&script_var_raw_2, sv_val_ptr_local, sv_id_2);
    
    s32 n_values = script_var_raw_1.def->n_values;
    
    for(int idx = 0; idx < n_values; idx++) {
        if (LoadScriptVariableValueAtIndex(sv_val_ptr_local, sv_id_1, idx) != 
            LoadScriptVariableValueAtIndex(sv_val_ptr_local, sv_id_2, idx)) {
            return 0;
        }
    }

    return 1;
}

s32 FlagCalc(s32 param_1, s32 param_2, enum FlagCalcOperation operation)
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
            // EVENT_FLAG_PROG_POS_INFO contains a pointer to the filename event_flag.c
            // and a line number of 1001
            // struct prog_pos_info prog_pos_info = *(struct prog_pos_info*) &EVENT_FLAG_PROG_POS_INFO;
            // EVENT_FLAG_EXPANSION_ERROR contains the string "event flag expansion error %d"
            struct prog_pos_info p = {
                 .file = (u8*)EVENT_FLAG_PROG_POS_INFO.file1,
                 .line = EVENT_FLAG_PROG_POS_INFO.line1
            };

            // Debug_FatalError(((&((prog_pos_info){EVENT_FLAG_PROG_POS_INFO.filename1, EVENT_FLAG_PROG_POS_INFO.line1}))), EVENT_FLAG_EXPANSION_ERROR, operation);
            //FATAL_ERROR_ARGS(EVENT_FLAG_PROG_POS_INFO.filename1, EVENT_FLAG_PROG_POS_INFO.line1, EVENT_FLAG_EXPANSION_ERROR, operation);

            Debug_FatalError(&p, &EVENT_FLAG_EXPANSION_ERROR, operation);
    }
}
