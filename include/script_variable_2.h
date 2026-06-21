#ifndef PMDSKY_SCRIPT_VARIABLE_2_H
#define PMDSKY_SCRIPT_VARIABLE_2_H

void InitWorldMapScriptVars();
void sub_0204CDB8(void);
s8 sub_0204CDCC(void);
void SetWorldMapLevel(s32 value);
bool8 sub_0204CE00(u32 idx);
void sub_0204CE48(u32 idx, s32 value);
void InitDungeonListScriptVars(void);
bool8 sub_0204CEE0(u32 idx);
bool8 sub_0204CF0C(u32 idx);
void SetDungeonConquest(u32 dungeon_id, s32 bit_value);

#endif PMDSKY_SCRIPT_VARIABLE_2_H
