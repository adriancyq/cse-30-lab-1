.syntax unified

.text

.align 8
.global bitAnd_ARM
.func bitAnd_ARM, bitAnd_ARM
.type bitAnd_ARM, %function

bitAnd_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE 
    @-----------------------

    mov r4, r0
    mov r5, r1
    and r4, r4, r5

    @ put your return value in r0 here:

    MOV r0,r4

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc



.global getByte_ARM
.func getByte_ARM, getByte_ARM
.type getByte_ARM, %function

getByte_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE 
    @-----------------------

    MOV r4, r0
    MOV r5, r1
    lsl r5, r5, #0x03 
    lsr r4, r4, r5
    and r4, r4, #0xff
    @ put your return value in r0 here:

    MOV r0,r4

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

@ TO DO: Add the function definitions for all the following functions

@ logicalShift_ARM
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    MOV r4, r0
    MOV r5, r1
    lsr r4, r4, r4 

    @ put your return value in r0 here:

    MOV r0,r4

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

@ bitCount_ARM
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE 
    
    @move value into r5
    MOV r5, r0

    @ANDing last bit with one and left shifting by 1
    AND r8, r5, #1
    LSR r5, r5, #1

    @ANDing by 1 and shifting over to next bit
    @repeat process 31 times until all 32 bits have been read
    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    AND r9, r5, #1
    ADD r8, r8, r9
    LSR r5, r5, #1

    @ put your return value in r0 here:

    MOV r0, r5

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

@ fitsBits_ARM
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE 

    MOV r4, r0 @x
    MOV r5, r1 @n
    MVN r10, r4 @not x
    LSR r6, r4, #31 @cover variable
    MVN r7, r6 @not cover variable
    AND r8, r7, r4 @x and not cover
    AND r9, r10, r6 @cover and not x
    ADD r8, r8, r9 @adding r8 and r9 into r8
    SUB r11, r5, #1 @(n + ~0)
    LSR r8, r8, r11 @shift right of sum by (n +~0)
    
    @ put your return value in r0 here:

    EOR r0,r8, #1

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

@ negate_ARM
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE 
    @ARM negating can be done with NEG command
    MOV r5, r0
    NEG r5, r5

    
    @ put your return value in r0 here:

    MOV r0,r5

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

@ isLessOrEqual_ARM
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE 
    mov r4, r0          @r4 = x
    mov r5, r1          @r5 = y
    mvn r6, r4          @nots x stored in r6
    add r6, r6, #1      
    add r7, r6, r5
    asr r8, r7, #31
    and r8, r8, #1
    mov r11, #1
    lsl r9, r11, #31
    and r10, r9, r4
    and r11, r9, r5
    eor r6, r10, r11
    asr r6, r6, #31
    and r11, r6, #1
    asr r7, r10, #31
    and r11, r11, r7

    mov r4, r8
    mvn r8, r8
    add r8, r8, #1
    asr r4, r4, #31
    and r4, r4, #1
    asr r8, r8, #31
    and r8, r8, #1
    orr r4, r4, r8
    eor r4, r4, #1

    mov r5, r6
    mvn r6, r6
    add r6, r6, #1
    asr r6, r6, #31
    and r5, r5, #1
    asr r6, r6, #31
    and r5, r5, #1
    asr r6, r6, #31
    and r6, r6, #31
    orr r5, r5, r6
    eor r6, r6, #1

    and r7, r6, r4
    orr r0, r11, r7
    
    @ put your return value in r0 here:


    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

