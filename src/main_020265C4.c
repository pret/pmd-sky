#include "main_020265C4.h"

u8 GetColorCodePaletteOffset(char letter)
{
    switch (letter) {
        case 'T': return 0x0;
        case 'r': return 0x15;
        case 'E': return 0x18;
        case 'C': return 0x19;
        case 'W': return 0x1A;
        case 'X': return 0x1B;
        case 'Y': return 0x1C;
        case 'F': return 0x1D;
        case 'N': return 0x1E;
        case 'K': return 0x1F;
        case 'M': return 0x20;
        case 'P': case 'j': return 0x21;
        case 'V': return 0x22;
        case 'B': return 0x23;
        case 'S': return 0x24;
        case 'Q': return 0x25;
        case 'A': case 'I': return 0x26;
        case 'U': return 0x27;
        case 'Z': return 0x28;
        case 'G': return 0x29;
        case 'R': return 0x2A;
        case 'L': return 0x2B;
        case 'H': return 0x2C;
        case 'J': return 0x2D;
        case 'O': return 0x2E;
        default: return 0x17;
    }
}
