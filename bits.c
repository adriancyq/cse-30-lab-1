/* 
 * CS:APP Data Lab 
 * 
 * <Adrian Cordova y Quiroz A12010305>
 * 
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.  
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */
You will provide your solution to the Data Lab by
editing the collection of functions in this source file.
INTEGER CODING RULES:
 
  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;
      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }
  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>
    
  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.
  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.
 
  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting an integer by more
     than the word size.
EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }
  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }
FLOATING POINT CODING RULES
For the problems that require you to implent floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants.
You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.
NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to 
     check the legality of your solutions.
  2. Each function has a maximum number of operators (! ~ & ^ | + << >>)
     that you are allowed to use for your implementation of the function. 
     The max operator count is checked by dlc. Note that '=' is not 
     counted; you may use as many of these as you want without penalty.
  3. Use the gradescope autograder and your own tester to check your functions for correctness.
  4. Use the dlc program to check if your functions meet the constraints on the
     maximum number of ops and permissible operators.
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies 
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.
/*
 * STEP 2: Modify the following functions according the coding rules.
 * 
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the gradescope autograder to check for logical correctness 
 */
#endif
/* Copyright (C) 1991-2014 Free Software Foundation, Inc.
   This file is part of the GNU C Library.
   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.
   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.
   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */
/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */
/* glibc's intent is to support the IEC 559 math functionality, real
   and complex.  If the GCC (4.9 and later) predefined macros
   specifying compiler intent are available, use them to determine
   whether the overall intent is to support these features; otherwise,
   presume an older compiler has intent to support these features and
   define these macros by default.  */
/* wchar_t uses ISO/IEC 10646 (2nd ed., published 2011-03-15) /
   Unicode 6.0.  */
/* We do not support C11 <threads.h>.  */
/* 
 * bitAnd - x&y using only ~ and | 
 *   Example: bitAnd(6, 5) = 4
 *   Legal ops: ~ |
 *   Max ops: 8
 *   Rating: 1
 */
int bitAnd(int x, int y) {
   x = ~x; //logical not X
   y = ~y; //logical not Y
   //logical NOT the OR of x and y
  return ~(x|y);
}
/* 
 * getByte - Extract byte n from word x
 *   Bytes numbered from 0 (LSB) to 3 (MSB)
 *   Examples: getByte(0x12345678,1) = 0x56
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2
 */
int getByte(int x, int n) {
   /*returns the number of bytes n in a word x 
    by shifting n to the left by 31 then shifting
    x to the right by that and ANDing it with 255*/
   return ((x >> (n << 3)) & 0xff);
}
/* 
 * logicalShift - shift x to the right by n, using a logical shift
 *   Can assume that 0 <= n <= 31
 *   Examples: logicalShift(0x87654321,4) = 0x08765432
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3 
 */
int logicalShift(int x, int n) {
    int ArShift = (x >> n); //arithmetic shift right of x by n

    //converts arithmetic shifts to logical
    int Conv = ((1 << ((~n + 1) + 32)) + ~0); 
  return (ArShift & Conv);
}
/*
 * bitCount - returns count of number of 1's in word
 *   Examples: bitCount(5) = 2, bitCount(7) = 3
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 40
 *   Rating: 4
 */
int bitCount(int x) {
  /*counts the number of 1s in a word and returns that value*/
  //gets 2 LSBs
  int coverone = (0x11 | (0x11 <<8)); 
  //gets final bytes
  int covertwo = coverone | (coverone << 16);
  //calulate amount of 1 bits in first 4 bits and stores in add
  int add = (x & covertwo);
  add = add + ((x>>1) & covertwo);
  add = add + ((x>>2) & covertwo);
  add = add + ((x>>3) & covertwo);
  //compensates for higher add value because of 1 bits after byte
  add = add + (add >> 16);
  //store add and cover next byte.
  coverone = 0xF | (0xF << 8);
  //adds alternating 4 bits to add and stores them
  add = (add & coverone) + ((add >> 4) & coverone);   
  //returns the value and keeps it withing the constraints of the problem          
  return ((add + (add >> 8)) & 0x3F);
}
/* 
 * bang - Compute !x without using !
 *   Examples: bang(3) = 0, bang(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4 
 */
int bang(int x) {
  /*reads in x and calculates !x using right shifts and XOR and OR*/
   //logical negative conversion of x
   x = x & (~x+1);
   x = ~x+1;
   //MSB of x or -x will be 1 if x does not equal 0
   //XOR sign bit of -x or x to produce !x
  return (~(x >> 31)) & 1;
}
/* 
 * tmin - return minimum two's complement integer 
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 *   Rating: 1
 */
int tmin(void) {
  /*returns the smallest 2s comp integer by shifting the '1' bit
   to achieve 0x80000000*/
  return (1<<31);
}
/* 
 * fitsBits - return 1 if x can be represented as an 
 *  n-bit, two's complement integer.
 *   1 <= n <= 32
 *   Examples: fitsBits(5,3) = 0, fitsBits(-4,3) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int fitsBits(int x, int n) {
    /*cover the sign bit vs ~x and ~cover to grab max bit in x.
    Shift right n+~0 and not that to check*/
    int notX = ~x;
    int cover = x >> 31;
    int notCover = ~cover;
  return !(((notX & cover) + (x & notCover)) >> (n + ~0));
}
/* 
 * divpwr2 - Compute x/(2^n), for 0 <= n <= 30
 *  Round toward zero
 *   Examples: divpwr2(15,1) = 7, divpwr2(-33,4) = -2
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int divpwr2(int x, int n) {
    //resolves 2^n -1 
    int cover = (1 << n) + ~0;
    //shift x right 31 and AND cover for sign bit
    int adjuster = (x >> 31) & cover;
    //if x was positive adds 0
    //if x was negative adds 1
    return (x + adjuster) >> n;
}
/* 
 * negate - return -x 
 * You may handle results that fall out of signed int range in any way that you
 * like
 *   Example: negate(1) = -1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
int negate(int x) {
    /*2s comp definiton states that negation is fulfilled
    by NOTing and adding 1*/
   int y = 0;
   y = ~x +1;
  return y;
}
/* 
 * isPositive - return 1 if x > 0, return 0 otherwise 
 *   Example: isPositive(-1) = 0.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 3
 */
int isPositive(int x) {
   //x cannot be positive when less or equal to 0
   int NegX = (~x + 1);
   //negate x and sign bit is 0
   int signBit = ((NegX >> 31) & 1);
   //x is the smallest number and a sign bit
   int tmin_checker = !(x ^ (1<<31));
  return (signBit ^ tmin_checker);
}
/* 
 * isLessOrEqual - if x <= y  then return 1, else return 0 
 *   Example: isLessOrEqual(4,5) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isLessOrEqual(int x, int y) {
  //negative value of x
   int negativeX = ~x + 1;
   //only negative if x is greater than y
   int Ysum = negativeX + y;
   //sign bit gets shifted all the way to the right
   int Signchecker = Ysum >> 31 & 1;
   //stores LSB
   int LSB = 1 << 31;
   //ands LSB and x
   int LeftX = LSB & x;
   //ands LSB and y
   int LeftY = LSB & y;
   //ExOR leftX bit and leftY bit 
   int ExclusiveOr = LeftX ^ LeftY;
   //right shifts ExOr value and ANDs with 1
   ExclusiveOr = (ExclusiveOr >> 31) & 1;
   //returns 1 if x<=y or else 0
  return (ExclusiveOr & (LeftX >> 31)) | (!Signchecker & !ExclusiveOr);
}
/*
 * ilog2 - return floor(log base 2 of x), where x > 0
 *   Example: ilog2(16) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 90
 *   Rating: 4
 */
int ilog2(int x) {
  //initializes unsigned ints r and q
   unsigned int r, q;
   //shifts x bit left until gets to log base 2 of x and returns floor
   q = (x > 0xffff) << 4; x >>= q;
   r = (x > 0xff) <<3; x>>= r, q |=r;
   r = (x > 0xf) << 2; x>>=r, q |= r;
   r = (x > 0x3) << 1; x >>= r, q |= r;
  return (q | (x >>1));
}
/* 
 * float_neg - Return bit-level equivalent of expression -f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representations of
 *   single-precision floating point values.
 *   When argument is NaN, return argument.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 10
 *   Rating: 2
 */
unsigned float_neg(unsigned uf) {
 //adjust sign bit of value
   unsigned changer = (0x80000000 ^ uf);
   //checks the 8 exponent bits
   unsigned checker = 0xff << 23;
   //if exponent bits have 1s
   if(((checker & uf) == checker) && (uf & ((1<<23) + (~0)))) {
    return uf;
   }
 return changer;
}
/* 
 * float_i2f - Return bit-level equivalent of expression (float) x
 *   Result is returned as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point values.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned float_i2f(int x) {
  return 2;
}
/* 
 * float_twice - Return bit-level equivalent of expression 2*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned float_twice(unsigned uf) {
  unsigned int negone = 0xff;

  //checks that 2 zero cases are returned correctly
  if (uf == 0 || 0x800000000){
    return uf;
  }
  //same as zero if all exponents are 1s
  if (((uf >> 23) & negone) == negone){
    return uf;
  }
  //exponent bits are 0 then check if negative and OR the values
  if (((uf >> 23) & negone) == 0x00){
    return (uf & (1<<31)) | (uf<<1);
  }
  return uf + (1<<23);
}
