#ifndef PMDSKY_FILES_PACK_H
#define PMDSKY_FILES_PACK_H

#include <io.h>

struct pack_file_table_of_content {
    u32 offset; // The offset of the file relative to the start of the Pack file
    u32 length; // The size of the file
};

/*  Information for reading a .bin Pack file

    A pack file is an archive that contains multiple other files. They aren't named.

    File format documentation at
   https://projectpokemon.org/docs/mystery-dungeon-nds/pmd2-pack-file-format-r42 */
struct pack_file_opened {
    struct pack_file_table_of_content* table_of_content;
    u32 zero; // Loaded from file, but is always zero here. Seemingly unused.
    u32 nb_entry_table_of_content; // loaded from file
    struct file_stream opened_file;
};

#endif