#ifndef PMDSKY_OVERLAY_11_022EBB40_H
#define PMDSKY_OVERLAY_11_022EBB40_H

#define BG_NAME_LEN 8

struct bg_list_entry_sub_struct {
    char name[BG_NAME_LEN + 2]; // Null-terminated string
};

#define BPA_MAX_ENTRIES 8

// Represents an entry in the bg_list.dat file, after being loaded by LoadBgListEntry
struct bg_list_entry {
    struct bg_list_entry_sub_struct bpl;
    struct bg_list_entry_sub_struct bpc;
    struct bg_list_entry_sub_struct bma;
    struct bg_list_entry_sub_struct others_bpa[BPA_MAX_ENTRIES];
};

void LoadBackgroundAttributes(struct bg_list_entry* entry, int bgId);

#endif //PMDSKY_OVERLAY_11_022EBB40_H
