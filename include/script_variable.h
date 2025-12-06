#ifndef PMDSKY_SCRIPT_VARIABLE_H
#define PMDSKY_SCRIPT_VARIABLE_H

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

void DefaultInitScriptVariable(union script_var_value sv_locals[], enum script_var_id sv_id);
void ZeroInitScriptVariable(union script_var_value sv_locals[], enum script_var_id sv_id);
void LoadScriptVariableRaw(struct script_var_raw* sv_raw, union script_var_value sv_val_local[], const enum script_var_id sv_id);
s32 LoadScriptVariableValue(union script_var_value sv_local[], enum script_var_id sv_id);
s32 LoadScriptVariableValueAtIndex(union script_var_value sv_local[], enum script_var_id id, u16 idx);
void SaveScriptVariableValue(union script_var_value sv_locals[], const enum script_var_id script_var_id, u32 new_val);
void SaveScriptVariableValueAtIndex(union script_var_value sv_locals[], const enum script_var_id script_var_id, u16 idx, s32 new_val);
s32 LoadScriptVariableValueSum(union script_var_value sv_local[], const enum script_var_id sv_id);
void LoadScriptVariableValueBytes(const enum script_var_id sv_id, u8* result, s32 num_bytes);
void LoadScriptVariableValueString(const enum script_var_id sv_id, u8* result, u8 num_bytes);
void SaveScriptVariableValueBytes(const enum script_var_id sv_id, u8* result, s32 num_bytes);
bool8 ScriptVariablesEqual(union script_var_value sv_val_ptr_local[], enum script_var_id sv_id_1, enum script_var_id sv_id_2);
s32 CalcScriptVariables(s32 param_1, s32 param_2, enum script_calc_operation operation);
bool8 CompareScriptVariables(s32 param_1, s32 param_2, enum compare_operation operation);
s32 CalcScriptVariablesVeneer(s32 param_1, s32 param_2, enum script_calc_operation operation);
void CalcAndUpdateScriptVarWithOtherValue(union script_var_value sv_local[], const enum script_var_id script_var_id, s32 param, enum script_calc_operation operation);
void CalcAndUpdateScriptVarWithOtherScriptVar(union script_var_value sv_local[], enum script_var_id sv_id_1, enum script_var_id sv_id_2, enum script_calc_operation operation);
bool8 CompareScriptVariablesVeneer(s32 param_1, s32 param_2, enum compare_operation operation);
bool8 LoadAndCompareScriptVarAndValue(union script_var_value sv_local[], enum script_var_id sv_id, s32 param, enum compare_operation op);
bool8 LoadAndCompareScriptVars(union script_var_value sv_local[], enum script_var_id sv_id_1, enum script_var_id sv_id_2, enum compare_operation op);
void EventFlagResume();
void EventFlagBackup();
bool8 DumpScriptVariableValues(u8* dest);
bool8 RestoreScriptVariableValues(u8* src);
void InitScenarioProgressScriptVars();
void LoadScriptVarValuePair(enum script_var_id script_var_id, s32* val_1, s32* val_2);

#endif //PMDSKY_SCRIPT_VARIABLE_H
