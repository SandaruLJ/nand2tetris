// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

    // initialize values
    @R2
    M=0
    @cmp  // Bitwise AND this with multiplier bits
    M=1   // starts with 1 and shifts left with each iteration
(LOOP)
    // if cmp is 0, exit loop
    @cmp
    D=M
    @END
    D;JEQ
    // accumilate (shifted) multiplicand for each multiplier bit that is 1
    // if cmp AND R1 is 0, skip adding the (shifted) multiplicand
    @cmp
    D=M
    @R1
    D=D&M
    @SKIP
    D;JEQ
    // add (shifted) multiplicand to sum
    @R2
    D=M
    @R0
    D=D+M
    @R2
    M=D
(SKIP)
    // left shift cmp bit and multiplicand (R0)
    @cmp
    D=M
    M=D+M
    @R0
    D=M
    M=D+M
    // continue to next loop iteration
    @LOOP
    0;JMP
(END)
    @END
    0;JMP
