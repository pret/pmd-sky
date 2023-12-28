#ifndef PMDSKY_DIRECTORY_FILE_MNGR_H
#define PMDSKY_DIRECTORY_FILE_MNGR_H

// Correspond to a .bin pack archive
enum directory_id {
    PACK_ARCHIVE_MONSTER = 0,
    PACK_ARCHIVE_M_ATTACK = 1,
    PACK_ARCHIVE_M_GROUND = 2,
    PACK_ARCHIVE_EFFECT = 3,
    PACK_ARCHIVE_DUNGEON = 4,
    PACK_ARCHIVE_M_LEVEL = 5
};

// Contain return result of the DirectoryFileMngr_OpenDirectoryFile function
struct directory_open_result {
    void* data;
    u32 length;
};

// Open the 6 files at DIRECTORY_FILE_TABLE into DIRECTORY_FILES_EXTRACTED. Called during game initialization.
void DirectoryFileMngr_ExtractAllDirectoryFiles(void);

// Call DirectoryFile_GetDirectoryFileSize after looking up the global Pack archive by its number
// pack_id: pack file number
// file_index: file number
// return: size of the file in bytes from the Pack Table of Content
u32 DirectoryFileMngr_GetDirectoryFileSize(enum directory_id pack_id, u32 file_index);

// Call DirectoryFile_LoadDirectoryFile after looking up the global Pack archive by its identifier
// pack_id: pack file identifier
// file_index: file index
// output_buffer: [output] target buffer
// return: number of read bytes (identical to the length of the pack from the Table of Content)
u32 DirectoryFileMngr_LoadDirectoryFile(enum directory_id pack_id, u32 file_index, void* output_buffer);

// Allocate a file and load a file from the pack archive inside.
// The data pointed by the pointer in the output need to be freed once is not needed anymore.
// pack_id: pack file identifier
// file_index: file index
// output: [output] result struct (will contain length and pointer)
// malloc_flags: allocation flags
void DirectoryFileMngr_OpenDirectoryFile(enum directory_id pack_id, u32 file_index, struct directory_open_result *output, u32 malloc_flags);

#endif //PMDSKY_DIRECTORY_FILE_MNGR_H
