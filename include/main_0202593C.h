#ifndef PMDSKY_MAIN_0202593C_H
#define PMDSKY_MAIN_0202593C_H

// return: Pointer to byte buffer
u8* AllocateTemp1024ByteBufferFromPool(void);
// Likely a linker-generated veneer for GetStringFromFile.
// See https://developer.arm.com/documentation/dui0474/k/image-structure-and-generation/linker-generated-veneers/what-is-a-veneer-
// buf: Buffer
// string_id: String ID
void GetStringFromFileVeneer(u8* buf, s32 string_id);
// Gets the string corresponding to a given string ID.
// u32: string ID
// return: string from the string files with the given string ID
u8* StringFromId(u32 id);
// Gets the string corresponding to a given string ID and copies it to the buffer specified in r0.
// buf: buffer
// string_id: string ID
void CopyStringFromId(u8* buf, u32 string_id);
// Gets the string corresponding to a given string ID and copies it to the buffer specified in r0.
// This function won't write more than <buffer length> bytes.
// buf: buffer
// string_id: string ID
// buf_len: buffer length
void CopyNStringFromId(char* buf, int string_id, int buf_len);
void LoadTblTalk(void);

#endif //PMDSKY_MAIN_0202593C_H
