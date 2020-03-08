// datalab - Kyle Smith (kjsmith@wpi.edu)
/* 
 * CS:APP Data Lab 
 * 
 * <Please put your name and userid here>
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
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
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
 *   2. Use the BDD checker to formally verify that your solutions produce 
 *      the correct answers.
 */


#endif
/* Copyright (C) 1991-2016 Free Software Foundation, Inc.
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
/* wchar_t uses Unicode 8.0.0.  Version 8.0 of the Unicode Standard is
   synchronized with ISO/IEC 10646:2014, plus Amendment 1 (published
   2015-05-15).  */
/* We do not support C11 <threads.h>.  */
/* 
 * evenBits - return word with all even-numbered bits set to 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 1
 */
int evenBits(void) {
	int mask = 0x55;
	// Ox55000000 | 0x00550000 | 0x00005500 | 0x00000055 = 0x55555555 (01010101)
	return (mask << 24) | (mask << 16) | (mask << 8) | mask;
}
/*
 * isTmax - returns 1 if x is the maximum, two's complement number,
 *     and 0 otherwise 
 *   Legal ops: ! ~ & ^ | +
 *   Max ops: 10
 *   Rating: 1
 */
int isTmax(int x) {
	int i = x + 1; // assuming x is TMax, x + 1 = TMin
	x = x + i; // assuming x is TMax, TMax + TMin = -1 = UMax
	x = ~x; // assuming x is UMax, ~x = 0
	i = !i; // assuming i is TMin, !i = 1
	x += i; // assumign x is 0, x + i = 1
	return !x; // will return 1 if x is TMax, 0 otherwise
}
/* 
 * bitXor - x^y using only ~ and & 
 *   Example: bitXor(4, 5) = 1
 *   Legal ops: ~ &
 *   Max ops: 14
 *   Rating: 1
 */
int bitXor(int x, int y) {
  	int left = ~x & y;
	int right = x & ~y;
	// DeMorgans law, ~& = |
	return ~(~left & ~right);
}
/* 
 * conditional - same as x ? y : z 
 *   Example: conditional(2,4,5) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 16
 *   Rating: 3
 */
int conditional(int x, int y, int z) {
	// Negate x to switch it from true to false and vice versa
	// Shift x to the left 31 and to the right 31
	// If x is true, then desc will be 0xFFFFFFFF, if x is false desc will be 0x0
	// If desc is 0xFFFFFFFF, then y is returned, otherwise z is returned
  	int desc = ~((!x << 31) >> 31);
	return (desc & y) | (~desc & z);
}
/* 
 * greatestBitPos - return a mask that marks the position of the
 *               most significant 1 bit. If x == 0, return 0
 *   Example: greatestBitPos(96) = 0x40
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 70
 *   Rating: 4
 */
int greatestBitPos(int x) {
	// Fill rest of number to the right of the highest 1 with 1s
	x |= x >> 1;
	x |= x >> 2;
	x |= x >> 4;
	x |= x >> 8;
	x |= x >> 16;
	return x & ((~x >> 1) ^ (1 << 31)); // inverse x and right shift by 1 so the highest bit in the original number overlap, then AND it
										// include 1 << 31 (TMin) otherwise will return 0
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
	int offset = (x >> 31) & 1; // will be 1 if x is negative, must use AND because x >> 31 will be Umax and only want LSB
	int round = offset << n; // add 1 if number is negative to round towards 0
	round += (offset << 31) >> 31; // subtract 1 if number is positive
	return (round + x) >> n; // right shift by n to complete division
}
/* 
 * isNonNegative - return 1 if x >= 0, return 0 otherwise 
 *   Example: isNonNegative(-1) = 0.  isNonNegative(0) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 3
 */
int isNonNegative(int x) {
	return !(x >> 31); // shift sign bit all the way to the end, is 1 if negative and 0 if positive but must ! so 1 is returned if positive
}
/*
 * satMul3 - multiplies by 3, saturating to Tmin or Tmax if overflow
 *  Examples: satMul3(0x10000000) = 0x30000000
 *            satMul3(0x30000000) = 0x7FFFFFFF (Saturate to TMax)
 *            satMul3(0x70000000) = 0x7FFFFFFF (Saturate to TMax)
 *            satMul3(0xD0000000) = 0x80000000 (Saturate to TMin)
 *            satMul3(0xA0000000) = 0x80000000 (Saturate to TMin)
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 25
 *  Rating: 3
 */
int satMul3(int x) {
	int sign_mask = x >> 31; // will be all 1s if x is negative, or 0 if positive
	int sign = sign_mask & 1; // get the sign of x, 1 if negative 0 if positive
	int two = x + x; // computes x * 2
	int sign_two = (two >> 31) & 1;
	int three = two + x; // computes x * 3
	int sign_three = (three >> 31) & 1;
	int overflow = (sign ^ sign_two) | (sign_two ^ sign_three); // check if signs change
	int overflow_mask = (overflow << 31) >> 31; // will be all 1s if signs changed or 0 if signs stayed the same (no over/under flow)
	int didOverflow = (~sign_mask) ^ (1 << 31); // will be TMin if underflow and TMax if overflow
	return (overflow_mask & didOverflow) | (~overflow_mask & three); // see conditional(), return TMax or TMin if was overflow/underflow, or x*3
}
/* 
 * isGreater - if x > y  then return 1, else return 0 
 *   Example: isGreater(4,5) = 0, isGreater(5,4) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isGreater(int x, int y) {
	int x_sign = (x >> 31) & 1; // gets the sign of x
	int y_sign = (y >> 31) & 1; // . . . . y
	int sign_equal = !(x_sign ^ y_sign); // will be 1 if signs are equal and 0 otherwise
	int larger_mask = ((x + ~y) >> 31) & 1;
	int larger = sign_equal & larger_mask;
	int sign_notequal = x_sign & !y_sign;
	return !(larger | sign_notequal);
}
/* 
 * isAsciiDigit - return 1 if 0x30 <= x <= 0x39 (ASCII codes for characters '0' to '9')
 *   Example: isAsciiDigit(0x35) = 1.
 *            isAsciiDigit(0x3a) = 0.
 *            isAsciiDigit(0x05) = 0.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 3
 */
int isAsciiDigit(int x) {
	int sign_bit = 1 << 31;
	int upper_bound = ~(sign_bit | 0x39); // upper bound, adding anything > 0x39 will cause result to be negative
	int lower_bound = ~0x30; // lower bound, adding anything < 0x30 will cause result to be negative
	int upper_result = sign_bit & (x + upper_bound) >> 31;
	int lower_result = sign_bit & (1 + x + lower_bound) >> 31; // need to add one because adding 0x30 will give -1, which is in range
	return !(upper_result | lower_result);
}
/*
 * trueFiveEighths - multiplies by 5/8 rounding toward 0,
 *  avoiding errors due to overflow
 *  Examples: trueFiveEighths(11) = 6
 *            trueFiveEighths(-9) = -5
 *            trueFiveEighths(0x30000000) = 0x1E000000 (no overflow)
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 25
 *  Rating: 4
 */
int trueFiveEighths(int x) {
	int div8 = x >> 3; // divide x by 8
	int rem = x & 7; // find remainder, 7 = 0111 shift 3 to the right but still need those bits
	int mul5 = (div8 << 2) + div8; // multiplies div8 by 5 (multiplies by 4 and adds)
	int rem5 = (rem << 2) + rem; // multiplies rem by 5 (multiplies by 4 and adds)
	int signrem = (x >> 31) & 7; // remainder of the sign
	return mul5 + ((rem5 + signrem) >> 3);
}
/*
 * ilog2 - return floor(log base 2 of x), where x > 0
 *   Example: ilog2(16) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 90
 *   Rating: 4
 */
int ilog2(int x) {
	// Masks
	int a = 0x55;
	int b = 0x33;
	int c = 0x0f;
	int d = 0xff;
	int e = d;

	// Fill all bits to the right of the MSB with 1s, similar to greatest bit pos
	x |= x >> 1;
	x |= x >> 2;
	x |= x >> 4;
	x |= x >> 8;
	x |= x >> 16;

	// Copy all the 8-bit patterns to be 32-bit patterns
	a |= a << 8;
	b |= b << 8;
	c |= c << 8;
	d |= d << 16;
	e |= e << 8;
	a |= a << 16;
	b |= b << 16;
	c |= c << 16;

	x = (x & a) + ((x >> 1) & a);
	x = (x & b) + ((x >> 2) & b);
	x = (x & c) + ((x >> 4) & c);
	x = (x & d) + ((x >> 8) & d);
	x = (x & e) + ((x >> 16) & e);

	x = x + ~0; // remove last bit, same as doing -1
	return x;
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
	int exponent = (uf >> 23) & 0xFF; // get exponent
	int mantissa = uf & 0x7FFFFF; // get mantissa
	if(exponent == 0xFF && mantissa) { // check if NaN (exponent is all 1s and mantissa is NOT all 0s)
		return uf;
	}
	return uf ^ 0x80000000; // flip last bit
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
	int sign, acc, exp, frac, end; // dlc requires variables defined at top-level
	if(x == 0) {
		return 0; // 0 is the same as a float as an int
	}
	else if(x == 0x80000000) {
		return 0xcf000000; // if x is TMin then trying to round will cause an overflow so just calc value manually and return
	}
	else {
		sign = (x >> 31) & 1; // get sign bit
		if(sign) {
			x = -x; // if num is negative then negate x
		}
		acc = 1; // shift counter
		while(x >> acc) { // while x is not 0 i.e. all the bits aren't shifted out yet
			acc++;
		}
		acc--; // subtract 1, because x is shifted as long as there are still bits, but we don't want all the bits gone
		exp = acc + 127; // 127 bits in a 32-bit single-precision float
		x <<= (31 - acc); // get rid of 0s to the right of the most significant bit
		frac = (x >> 8) & 0x7fffff;
		if(acc > 23) { // round to even
			end = x & 0xff; // select the byte that needs to be rounded (changed)
			if((end > 128) || ((end == 128) && (frac & 1))) {
				frac++;
				if(frac >> 23) {
					exp++; // increase exp by 1 (because rounding even) and making fraction 0 (because are truncating the decimal)
					frac = 0;
				}
			}
		}
		return (sign << 31) | (exp << 23) | frac; // shift sign and exp to their places and put all parts together
	}
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
	int exp = (uf >> 23) & 0xff; // get exponent part
	int frac = uf & 0x7fffff; // get fractional part
	int sign = (uf >> 31) & 1; // get sign bit (1 if neg)
	if(!(uf << 1) || exp == 0xff) { // NaN or infinity
		return uf;
	}
	if(exp == 0) { // shift fraction over to normalize
		frac = frac << 1;
	}
	else {
		exp++; // increase exp by 1 to multiply by 2
	}
	return (sign << 31) | (exp << 23) | frac; // shift sign and exp to their places and put all parts together
}

