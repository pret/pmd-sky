#ifndef PMDSKY_SCRIPTING_H
#define PMDSKY_SCRIPTING_H

#include "enums.h"
#include "util.h"

struct script_var_definition {
    s16 p1;
    s16 p2;
    s16 value_offset; // offset within SCRIPT_VAR_VALUES, or local script var values.
    s16 p4;
    s16 p5;
    s16 p6;
    s16 p7;
    s16 p8;
};

struct script_var_local_value {
    u32 p1;
};

struct script_var_global_value {
    u8 p1;
};

struct script_var_raw {
    struct script_var_definition* def;
    union {
        struct script_var_local_value*  local;
        struct script_var_global_value* global;
    } value;
};

const short LOCAL_SCRIPT_VAR_OFFSET = 0x400;

void LoadScriptVariableRaw(struct script_var_raw* sv_raw, 
    struct script_var_local_value sv_locals[], 
    const enum script_variables sv_id);

#endif //PMDSKY_SCRIPTING_H
