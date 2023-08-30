#include "main_pack.h"

u32 GetFileLengthInPack(struct pack_file_opened* pack_file, u32 file_index) {
    struct pack_file_table_of_content* element = &pack_file->table_of_content[file_index];
    return element->length;
}
