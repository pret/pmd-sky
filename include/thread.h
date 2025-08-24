#ifndef PMDSKY_THREAD_H
#define PMDSKY_THREAD_H

// Specifies a function called when a thread exits
typedef void (*thread_exit_fn_t)(void);

// Contains information about a running thread
struct thread {
    s32 flags;                // Probably a flags field. Usually 0x1F.
    struct thread* field_0x4; // r2 parameter in ThreadStart
    u32 field_0x8;     // Initialized to 0
    u32 field_0xC;     // Initialized to 0
    u32 field_0x10;    // Initialized to 0
    u32 field_0x14;    // Initialized to 0
    u32 field_0x18;    // Initialized to 0
    u32 field_0x1C;    // Initialized to 0
    u32 field_0x20;    // Initialized to 0
    u32 field_0x24;    // Initialized to 0
    u32 field_0x28;    // Initialized to 0
    u32 field_0x2C;    // Initialized to 0
    u32 field_0x30;    // Initialized to 0
    u32 field_0x34;    // Initialized to 0
    // 0x38: Points to the area of the allocated stack area that can actually be used to store data.
    // This is equal to stack_pointer - 0x44, with an additional - 4 if the resulting addess is not
    // aligned to 8 bytes.
    void* usable_stack_pointer;
    // 0x3C: Address of the function to return to once the thread exits. Usually ThreadExit.
    thread_exit_fn_t exit_function;
    void* function_address_plus_4; // 0x40: Pointer to the function to run + 4
    void* stack_pointer_minus_4;   // 0x44: Pointer to the start of the stack area - 4
    u8 field_0x48;
    u8 field_0x49;
    u8 field_0x4A;
    u8 field_0x4B;
    u8 field_0x4C;
    u8 field_0x4D;
    u8 field_0x4E;
    u8 field_0x4F;
    u8 field_0x50;
    u8 field_0x51;
    u8 field_0x52;
    u8 field_0x53;
    u8 field_0x54;
    u8 field_0x55;
    u8 field_0x56;
    u8 field_0x57;
    u8 field_0x58;
    u8 field_0x59;
    u8 field_0x5A;
    u8 field_0x5B;
    u8 field_0x5C;
    u8 field_0x5D;
    u8 field_0x5E;
    u8 field_0x5F;
    u8 field_0x60;
    u8 field_0x61;
    u8 field_0x62;
    u8 field_0x63;
    u32 field_0x64; // Initialized to 0
    // 0x68: Pointer to the next thread. This forms a linked list sorted in ascending order
    // according to sorting_order
    struct thread* next_thread;
    // 0x6C: Seems to be a thread ID that gets incremented for each new thread created.
    s32 thread_id;
    s32 sorting_order;       // 0x70: Unknown. Used to sort threads.
    u32 field_0x74;   // Initialized to 0
    u32 field_0x78;   // Initialized to 0
    u32 field_0x7C;   // Initialized to 0
    u32 field_0x80;   // Initialized to 0
    u32 field_0x84;   // Initialized to 0
    u32 field_0x88;   // Initialized to 0
    u32 field_0x8C;   // Initialized to 0
    void* stack_end_pointer; // 0x90: Pointer to the end of the stack area (exclusive)
    void* stack_pointer;     // 0x94: Pointer to the start of the stack area (inclusive)
    u32 field_0x98;   // Initialized to 0
    u32 field_0x9C;   // Initialized to 0
    u32 field_0xA0;   // Initialized to 0
    // Initialized to 0. Actually part of a separate struct alongside field_0xA8 and field_0xAC.
    u32 field_0xA4;
    u32 field_0xA8; // Initialized to 0
    u32 field_0xAC; // Initialized to 0
    u32 field_0xB0; // Initialized to 0
    u32 field_0xB4; // Initialized to 0
    u8 field_0xB8;
    u8 field_0xB9;
    u8 field_0xBA;
    u8 field_0xBB;
    u8 field_0xBC;
    u8 field_0xBD;
    u8 field_0xBE;
    u8 field_0xBF;
};

#endif //PMDSKY_THREAD_H
