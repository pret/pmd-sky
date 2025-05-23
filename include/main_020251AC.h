#ifndef PMDSKY_MAIN_020251AC_H
#define PMDSKY_MAIN_020251AC_H

void SetQuestionMarks(char *s);
void StrcpySimple(unsigned char* dest, const unsigned char* src);
void StrncpySimple(unsigned char* dest, const unsigned char* src, s32 n);
void StrncpySimpleNoPad(unsigned char* dest, const unsigned char* src, s32 n);
int StrncmpSimple(const unsigned char* c1, const unsigned char* c2, s32 n);

#endif //PMDSKY_MAIN_020251AC_H
