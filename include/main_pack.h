#ifndef PMDSKY_MAIN_PACK_H
#define PMDSKY_MAIN_PACK_H

#include <files/pack.h>

// Open the 6 files at PACK_FILE_PATHS_TABLE into PACK_FILE_OPENED. Called during game initialization.
void OpenAllPackFiles(void);

// Call GetFileLengthInPack after looking up the global Pack archive by its number
// pack_id: pack file number
// file_index: file number
// return: size of the file in bytes from the Pack Table of Content
u32 GetFileLengthInPackWithPackNb(enum pack_file_id pack_id, u32 file_index);

// Call LoadFileInPack after looking up the global Pack archive by its identifier
// pack_id: pack file identifier
// file_index: file index
// output_buffer: [output] target buffer
// return: number of read bytes (identical to the length of the pack from the Table of Content)
u32 LoadFileInPackWithPackId(enum pack_file_id pack_id, u32 file_index, void* output_buffer);

// Allocate a file and load a file from the pack archive inside.
// The data pointed by the pointer in the output need to be freed once is not needed anymore.
// pack_id: pack file identifier
// file_index: file index
// output: [output] result struct (will contain length and pointer)
// malloc_flags: allocation flags
void AllocAndLoadFileInPack(enum pack_file_id pack_id, u32 file_index, struct pack_alloc_and_load_result *output, u32 malloc_flags);

// Open a Pack file, to be read later. Initialise the output structure.
// pack_file: [output] pack file struct
// file_path: file name
void OpenPackFile(struct pack_file_opened *pack_file, char *file_path);

// Get the length of a file entry from a Pack archive
// pack_file: pack file struct
// file_index: file index
// return: size of the file in bytes from the Pack Table of Content
u32 GetFileLengthInPack(struct pack_file_opened* pack_file, u32 file_index);

// Load the indexed file from the Pack archive, itself loaded from the ROM.
// pack_file: pack file struct
// output_buffer: [output] target buffer
// file_index: file index
// return: number of read bytes (identical to the length of the pack from the Table of Content)
u32 LoadFileInPack(struct pack_file_opened *pack_file, void *output_buffer,u32 file_index);

#endif //PMDSKY_MAIN_PACK_H
