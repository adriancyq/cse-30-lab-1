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

    @moving x and y into registers 4 and 5
    MOV r4, r0
    MOV r5, r1

    @left shifting r5 by 3 in hex
    lsl r5, r5, #0x03 

    @left shifting r4 by r5
    lsr r4, r4, r5

    @anding r4 with -1
    and r4, r4, #0xff

    @ put your return value in r0 here:

    MOV r0,r4

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

@ TO DO: Add the function definitions for all the following functions

.global logicalShift_ARM
.func logicalShift_ARM, logicalShift_ARM
.type logicalShift_ARM, %function

logicalShift_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @logical shifting can be done with the LSR command in ARM

    MOV r6, r0
    MOV r7, r1
    lsr r6, r6, r7 

    @ put your return value in r0 here:

    MOV r0,r6

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.global bitCount_ARM
.func bitCount_ARM, bitCount_ARM
.type bitCount_ARM, %function

bitCount_ARM:
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

    MOV r0, r8

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.global fitsBits_ARM
.func fitsBits_ARM, fitsBits_ARM
.type fitsBits_ARM, %function

 fitsBits_ARM:
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

.global negate_ARM
.func negate_ARM, negate_ARM
.type negate_ARM, %function

negate_ARM:
    @Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE 
    @ ARM negating can be done with NEG command
    MOV r5, r0
    NEG r5, r5

    
    @ put your return value in r0 here:

    MOV r0,r5

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.global isLessOrEqual_ARM
.func isLessOrEqual_ARM, isLessOrEqual_ARM
.type isLessOrEqual_ARM, %function

isLessOrEqual_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE 
    mov r4, r0          @r4 = x
    mov r5, r1          @r5 = y
    mvn r6, r4          @nots x stored in r6
    add r6, r6, #1      @(~x +1)
    add r7, r6, r5      @Ysum
    asr r8, r7, #31
    and r8, r8, #1      @sign checker
    mov r11, #1 
    lsl r9, r11, #31    @LSB = 1 << 31
    and r10, r9, r4     @leftx
    and r11, r9, r5     @lefty
    eor r6, r10, r11    @exclusive or
    asr r6, r6, #31     
    and r11, r6, #1     @(Exclusive or >>31) & 1
    asr r7, r10, #31    @(leftx >> 31)
    and r11, r11, r7    @(Exclusive or & (left x >> 31))

    mov r4, r8          @r4 = sign checker
    mvn r8, r8          @r8 = ~sign checker
    add r8, r8, #1      @~sign checker + 1
    asr r4, r4, #31     @(x >> 31)
    and r4, r4, #1      @(x>>31 &1)
    asr r8, r8, #31
    and r8, r8, #1
    orr r4, r4, r8      @(whole thing ORed)
    eor r4, r4, #1      @=!sign checker

    mov r5, r6          @r5 = exclusive or
    mvn r6, r6          @~exclusive or
    add r6, r6, #1      @ (~exclusive or +1)
    asr r6, r6, #31
    and r5, r5, #1
    asr r6, r6, #31
    and r5, r5, #1
    asr r6, r6, #31
    and r6, r6, #31
    orr r5, r5, r6
    eor r6, r6, #1      @ = !Exclusive or

    and r7, r6, r4
    orr r0, r11, r7 
    
    @ put your return value in r0 here:


    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

