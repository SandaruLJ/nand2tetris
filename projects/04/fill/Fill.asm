// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LOOP)
    // create pointer to use with registers in the screen memory map
    @SCREEN
    D=A
    @pointer
    M=D
    // if keyboard is not pressed, clear screen
    @KBD
    D=M
    @CLEAR
    D;JEQ
    // else, blacken it
    @val
    M=-1
    @DRAW
    0;JMP
(CLEAR)
    @val
    M=0
(DRAW)
    // check if pointer is still within screen memory map
    @pointer
    D=M
    @KBD
    D=D-A
    @END
    D;JGE
    // write to screen memory map
    @val
    D=M
    @pointer
    A=M
    M=D
    // increment pointer
    @pointer
    M=M+1
    // continue draw loop
    @DRAW
    0;JMP
(END)
    @LOOP
    0;JMP
