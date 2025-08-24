#include "overlay_11_022EBB40.h"
#include "file_rom.h"

#define FILE_BG_LIST_ENTRY_SIZE (BG_NAME_LEN * (BPA_MAX_ENTRIES + 3))

extern const char ov11_02320C44[];
extern void FileClose(struct file_stream*);

void LoadBackgroundAttributes(struct bg_list_entry *entry, s32 bg_id)
{
    s32 i;
    struct file_stream file;

    FileRom_InitDataTransfer();
    FileRom_Veneer_FileInit(&file);
    FileRom_HandleOpen(&file, ov11_02320C44);
    FileRom_HandleSeek(&file, FILE_BG_LIST_ENTRY_SIZE * bg_id, 0);

    FileRom_HandleRead(&file, entry->bpl.name, BG_NAME_LEN);
    entry->bpl.name[BG_NAME_LEN] = '\0';
    FileRom_HandleRead(&file, entry->bpc.name, BG_NAME_LEN);
    entry->bpc.name[BG_NAME_LEN] = '\0';
    FileRom_HandleRead(&file, entry->bma.name, BG_NAME_LEN);
    entry->bma.name[BG_NAME_LEN] = '\0';

    for (i = 0; i < BPA_MAX_ENTRIES; i++) {
        FileRom_HandleRead(&file, entry->others_bpa[i].name, BG_NAME_LEN);
        entry->others_bpa[i].name[BG_NAME_LEN] = '\0';
    }

    FileClose(&file);
    FileRom_StopDataTransfer();
}
