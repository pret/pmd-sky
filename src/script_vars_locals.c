#include "script_variable.h"

extern u8* _0209CE9C[];
extern u8* _0209CEA4[];
extern u8* _0209CE8C[];
extern u8* _0209CE94[];

const struct script_var_def SCRIPT_VARS_LOCALS[] = {
    /* 1st entry */
    {
        .type        = (enum script_var_type)0x06,   /* from first byte */
        .field_0x1   = 0x0007,                       /* bytes 0x01‑0x02 */
        .mem_offset  = 0x0000,                       /* bytes 0x03‑0x04 (s16) */
        .bitshift    = 0x0000,                       /* bytes 0x05‑0x06 */
        .n_values    = 0x0001,                       /* bytes 0x07‑0x08 */
        .default_val = 0x0000,                       /* bytes 0x09‑0x0A */
        .name        = (char *)_0209CE9C               /* .word _0209CE9C → points to "LOCAL0" */
    },
    /* 2nd entry */
    {
        .type        = (enum script_var_type)0x06,
        .field_0x1   = 0x0007,
        .mem_offset  = 0x0002,
        .bitshift    = 0x0000,
        .n_values    = 0x0001,
        .default_val = 0x0000,
        .name        = (char *)_0209CEA4               /* .word _0209CEA4 → "LOCAL1" */
    },
    /* 3rd entry */
    {
        .type        = (enum script_var_type)0x06,
        .field_0x1   = 0x0007,
        .mem_offset  = 0x0004,
        .bitshift    = 0x0000,
        .n_values    = 0x0001,
        .default_val = 0x0000,
        .name        = (char *)_0209CE8C               /* .word _0209CE8C → "LOCAL2" */
    },
    /* 4th entry */
    {
        .type        = (enum script_var_type)0x06,
        .field_0x1   = 0x0007,
        .mem_offset  = 0x0006,
        .bitshift    = 0x0000,
        .n_values    = 0x0001,
        .default_val = 0x0000,
        .name        = (char *)_0209CE94               /* .word _0209CE94 → "LOCAL3" */
    }
};

const u8 EVENT_FLAG_SIZE_DEBUG_MSG[] = "EventFlagSize %04x/%04x\n";
