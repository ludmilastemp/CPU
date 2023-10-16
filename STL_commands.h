/* DEF_CMD( name, opCode, nArgs, actoin) */

DEF_CMD(PUSH, 0x01, 1,
    {
    int error = ParseArg (str + *index, &var1, command & (T_ARG_INT | T_ARG_REG));
    if (error) return error;

    if (command & T_ARG_INT)
    {
        *index += sizeof (int); // ip -- instruction pointer pc -- program counter
    }
    else if (command & T_ARG_REG)
    {
        *index += sizeof (char);
        var1 = spu->registers[var1];
    }
    else
    {
        return ERROR_INCORRECT_FUNC;
    }

    DO_PUSH (var1);
    })

DEF_CMD(POP, 0x02, 1,
    {
    int error = ParseArg (str + *index, &var1, command & (T_ARG_INT | T_ARG_REG));
    if (error) return error;

    if (command & T_ARG_REG)
    {
        *index += sizeof (char);
    }
    else
    {
        return ERROR_INCORRECT_FUNC;
    }

    DO_POP (&(spu->registers[var1]));
    })

DEF_CMD(ADD, 3, 0,
    {
    DO_POP (&var2);
    DO_POP (&var1);
    DO_PUSH (var1 + var2);
    })

DEF_CMD(SUB, 4, 0,
    {
    DO_POP (&var2);
    DO_POP (&var1);
    DO_PUSH (var1 - var2);
    })

DEF_CMD(MUL, 5, 0,
    {
    DO_POP (&var2);
    DO_POP (&var1);
    DO_PUSH (var1 * var2);
    })

DEF_CMD(DIV, 6, 0,
    {
    DO_POP (&var2);
    DO_POP (&var1);
    if (var2 == 0) return ERROR_INCORRECT_VALUE;
    DO_PUSH (var1 / var2);
    })

DEF_CMD(SQRT, 7, 0,
    {
    DO_POP (&var1);
    DO_PUSH (sqrt(var1));
    })

DEF_CMD(SIN, 8, 0,
    {
    DO_POP (&var1);
    DO_PUSH (sin(var1));
    })

DEF_CMD(COS, 9, 0, {
    DO_POP (&var1);
    DO_PUSH (cos(var1));
    })

DEF_CMD(IN,  10, 0,
    {
    printf ("\nPlease, enter var: ");
    scanf ("%d", &var1);
    DO_PUSH (var1);
    })

DEF_CMD(OUT, 11, 0,
    {
    DO_POP (&var1);
    printf ("OUT = %d\n", var1);
    })

DEF_CMD(HLT, 0, 0,
    {
    return 0;
    })

