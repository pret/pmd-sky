#include "enums.h"
#include "scripting.h"

// Global script variable definitions
extern struct script_var_def SCRIPT_VARS[];
// Local script variable definitions
extern struct script_var_def SCRIPT_VARS_LOCALS[];
// Global script variable values
extern u8 SCRIPT_VARS_VALUES[];

extern s32 GetPartyMembers(s32 param1);
extern s32 GetMoneyCarried();
extern s32 GetMoneyStored();
extern s32 GetLanguageType();
extern s32 GetGameMode();
extern s32 sub_0204C918();
extern s32 GetSpecialEpisodeType();
extern s32 GetNotifyNote();

const short LOCAL_SCRIPT_VAR_OFFSET = 0x400;

void LoadScriptVariableRaw(struct script_var_raw* sv_raw,
    union script_var_value sv_val_local[],
    const enum script_var_id sv_id) {

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
                        case EPISODE_IGGLYBUFF_THE_PRODIGY:
                            return sub_0204C918();
                        case EPISODE_HERE_COMES_TEAM_CHARM:
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
