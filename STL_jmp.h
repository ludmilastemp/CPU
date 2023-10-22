/* MAKE_COND_JMP (name, opCode, comparison sign) */

/// номер команды не должен превышать 0x20 == 64

MAKE_COND_JMP (JA,  0x0D, >  )

MAKE_COND_JMP (JAE, 0x0E, >= )

MAKE_COND_JMP (JB,  0x0F, <  )

MAKE_COND_JMP (JBE, 0x10, <= )

MAKE_COND_JMP (JE,  0x11, == )

MAKE_COND_JMP (JNE, 0x12, != )
