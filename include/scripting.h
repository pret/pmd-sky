#ifndef PMDSKY_SCRIPTING_H
#define PMDSKY_SCRIPTING_H

#include "enums.h"
#include "util.h"

struct script_var_def {
    enum script_var_type type; // 0x0: type of data contained in this script variable
    u16 field_0x1;           // 0x2
    // 0x4: value's offset into struct script_var_value_table, if type != VARTYPE_SPECIAL
    s16 mem_offset;
    s16 bitshift; // 0x6: bit position if type == VARTYPE_BIT
    s16 n_values; // 0x8: number of values (>1 means this variable is an array)
    // 0xA: 0 for every variable except VAR_VERSION, which has a default value of 1.
    s16 default_val;
    char* name; // 0xC: variable name
};

union script_var_value {
    u8 u8;
    u16 u16;
    u32 u32;
    s8 s8;
    s16 s16;
};

struct script_var_raw {
    struct script_var_def *def;
    union script_var_value *value;
};

extern const short LOCAL_SCRIPT_VAR_OFFSET;

void LoadScriptVariableRaw(struct script_var_raw* sv_raw, union script_var_value sv_val_local[], const enum script_var_id sv_id);
s32 LoadScriptVariableValue(union script_var_value sv_local[], enum script_var_id sv_id);
s32 LoadScriptVariableValueAtIndex(union script_var_value sv_local[], enum script_var_id id, u16 idx);
void SaveScriptVariableValue(union script_var_value sv_locals[], const enum script_var_id script_var_id, u32 new_val);
void SaveScriptVariableValueAtIndex(union script_var_value sv_locals[], const enum script_var_id script_var_id, int idx, s32 new_val);
s32 LoadScriptVariableValueSum(union script_var_value sv_local[], const enum script_var_id sv_id);
void LoadScriptVariableValueBytes(const enum script_var_id sv_id, u8* result, s32 num_bytes);
void LoadScriptVariableValueString(const enum script_var_id sv_id, u8* result, u8 num_bytes);
void SaveScriptVariableValueBytes(const enum script_var_id sv_id, u8* result, s32 num_bytes);
s32 ScriptVariablesEqual(union script_var_value sv_val_ptr_local[], enum script_var_id sv_id_1, enum script_var_id sv_id_2);

#endif //PMDSKY_SCRIPTING_H
