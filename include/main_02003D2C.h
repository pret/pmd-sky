#ifndef PMDSKY_MAIN_02003D2C_H
#define PMDSKY_MAIN_02003D2C_H

// Probably aborts the program with some status code? It seems to serve a similar purpose to the exit(3) function.
// This function prints the debug string "card pull out %d" with the status code.
// status: status code
void CardPullOutWithStatus(u32 status);
// Sets some global flag that probably triggers system exit?
// This function prints the debug string "card pull out".
void CardPullOut(void);
// Sets some global flag that maybe indicates a save error?
// This function prints the debug string "card backup error".
void CardBackupError(void);

#endif //PMDSKY_MAIN_02003D2C_H
