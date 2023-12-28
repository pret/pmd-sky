#ifndef PMDSKY_DIRECTORY_FILE_H
#define PMDSKY_DIRECTORY_FILE_H

#include <file.h>

struct directory_entry {
    u32 offset; // The offset of the file relative to the start of the Pack file
    u32 length; // The size of the file
};

/*  Information for reading a .bin Pack file

    A pack file is an archive that contains multiple other files. They aren't named.

    File format documentation at
   https://projectpokemon.org/docs/mystery-dungeon-nds/pmd2-pack-file-format-r42 */
struct directory {
    struct directory_entry* table_of_content;
    u32 zero; // Loaded from file, but is always zero here. Seemingly unused.
    u32 nb_entry_table_of_content; // loaded from file
    struct file_stream opened_file;
};

// Open a Pack file, to be read later. Initialise the output structure.
// pack_file: [output] pack file struct
// file_path: file name
void DirectoryFile_ExtractDirectoryFile(struct directory *pack_file, char *file_path);

// Get the length of a file entry from a Pack archive
// pack_file: pack file struct
// file_index: file index
// return: size of the file in bytes from the Pack Table of Content
u32 DirectoryFile_GetDirectoryFileSize(struct directory* pack_file, u32 file_index);

// Load the indexed file from the Pack archive, itself loaded from the ROM.
// pack_file: pack file struct
// output_buffer: [output] target buffer
// file_index: file index
// return: number of read bytes (identical to the length of the pack from the Table of Content)
u32 DirectoryFile_LoadDirectoryFile(struct directory *pack_file, void *output_buffer,u32 file_index);

#endif //PMDSKY_DIRECTORY_FILE_H
