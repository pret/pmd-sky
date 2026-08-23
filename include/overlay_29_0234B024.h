#ifndef PMDSKY_OVERLAY_29_0234B024_H
#define PMDSKY_OVERLAY_29_0234B024_H

#include "util.h"
#include "main_0200C4FC.h"
#include "dungeon_mode.h"

// Contains information for the "popup alert" messages at the bottom of the screen, which are also
// printed to the message log.
struct alert_box_info {
    char alert_box_messages[10][320];
    // 0xC80: Whether the message specified by the index is the start of a group
    bool8 message_starts_group[10];
    u8 field_0xc8a;
    u8 field_0xc8b;
    u16 alert_box_current_idx; // 0xC8C: Index of current message in alert_box_messages
    // 0xC8E: Index of current fully loaded message in alert_box_messages
    // (i.e. for which the scrolling is finished)
    u16 alert_box_current_loaded_idx;
    s16 frames_until_close; // 0xC90
    u8 field_0xc92;
    u8 field_0xc94;
    u8 field_0xc95;
    u8 field_0xc96;
    u8 field_0xc97;
    // 0xC98: 0 means nothing is being loaded, 1 means a message is about to start loading,
    // 2 means a message is currently loading/scrolling.
    u32 loading_status;
    struct preprocessor_args preprocessor_args;
    u8 alert_box_window_id; // 0xCEC
    u8 field_0xced;
    u8 field_0xcee;
    u8 field_0xcef;
};

// Contains the alert_box_info struct as well as information related to the current message group.
struct message_log_info {
    // 0x0: If true, a new message group will start on the next LogMessage call, even if the user
    // matches the last user. A "group" of messages is separated by a horizontal line.
    bool8 should_start_group;
    u8 field_0x1;
    u8 field_0x2;
    u8 field_0x3;
    struct alert_box_info *alert_box_info;
    // 0x8: If this does not match the current user, a new group will always start
    struct entity *last_user;
};

void SetMessageLogGroupStartFlag(bool8 should_start_group);
struct preprocessor_args* GetMessageLogPreprocessorArgs(void);
void InitMessageLogPreprocessorArgs(void);
void SetMessageLogPreprocessorArgsFlagVal(s32 pos, u32 val);
void SetPreprocessorArgsIdVal(s32 pos, u32 val);
void SetMessageLogPreprocessorArgsNumberVal(s32 pos, s32 val);
void SetMessageLogPreprocessorArgsString(s32 pos, char *string);
void SetMessageLogPreprocessorArgsStringToName(u8 pos, enum monster_id monster_id);

#endif
