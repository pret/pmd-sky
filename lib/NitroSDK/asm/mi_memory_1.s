	.include "asm/macros.inc"
	.include "include/mi_memory.inc"

	.text

	arm_func_start AtomicExchange
AtomicExchange: ; 0x0207C648
	.word 0xE1010090
	bx lr
	arm_func_end AtomicExchange

