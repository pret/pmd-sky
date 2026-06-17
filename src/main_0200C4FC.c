#include "main_0200C4FC.h"
#include "moves_1.h"

#ifdef JAPAN
#define DUNGEON_RESULT_STRING 0x23B6
#else
#define DUNGEON_RESULT_STRING 0x9CB
#endif

extern u16 _0209E7A6[][2];

extern char* GetDungeonResultString(int string_number);
extern void FormatMoveString(char* string, struct move* move, u8* type_print);
extern char* StringFromId(int string_id);
extern int PreprocessString(char* output, int output_size, const char* format, u16 flags, struct preprocessor_args* args);

void GetDungeonResultMsg(s32 damage_source_or_result, char* buffer, int buffer_size, struct preprocessor_args* param_4)
{
    struct move move;
    struct preprocessor_args scratch_2;

    if (damage_source_or_result < 0x00000233) {
        InitMoveCheckId(&move, damage_source_or_result);
        char* rs = GetDungeonResultString(0);
        FormatMoveString(rs, &move, 0);
        scratch_2.unk1c = (u16) move.id;
        rs = StringFromId(DUNGEON_RESULT_STRING);
        PreprocessString(buffer, buffer_size, rs, 0, &scratch_2);
    } else {
        damage_source_or_result -= 0x00000233;
        char* rs = StringFromId(_0209E7A6[damage_source_or_result][0]);
        PreprocessString(buffer, buffer_size, rs, 0, param_4);
    }
}
