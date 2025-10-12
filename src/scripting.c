#include "enums.h"
#include "scripting.h"


extern struct script_var_definition SCRIPT_VARS[];
extern struct script_var_definition SCRIPT_VARS_LOCALS[];
extern struct script_var_global_value SCRIPT_VARS_VALUES[];

void LoadScriptVariableRaw(struct script_var_raw* sv_raw, 
    struct script_var_local_value sv_locals[], 
    const enum script_variables sv_id)
{
    if (sv_id < LOCAL_SCRIPT_VAR_OFFSET) {
        // script var is global
        sv_raw->def = &SCRIPT_VARS[sv_id];
        sv_raw->value.global = &SCRIPT_VARS_VALUES[sv_raw->def->value_offset];
    } else {
        // script var is local
        sv_raw->def = &SCRIPT_VARS_LOCALS[sv_id - LOCAL_SCRIPT_VAR_OFFSET]; 
        sv_raw->value.local = &sv_locals[sv_raw->def->value_offset];
    }
}
