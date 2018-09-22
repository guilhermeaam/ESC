// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Limpa o conteudo do registrador 2
@R2
M=0

// Armazena no registrador D o valor contido no registrador 0
@R0
D=M

// Subitrai do valor contido em D (valor do registrador 0)
// o valor contido no registrador 1
@R1
D=D-M

// Se o resultado da subtra��o for positivo, o valor contido em R0
// � maior do que o valor contido em R1
@R0MAIOR
D; JGE

// Se n�o, o valor contido em R1 � maior do que o valor contido em R0
@R1MAIOR
0; JMP

(LOOP)

// Se o valor contido em i for 0, encerra a multiplica��o
@i
D=M

@END
D; JEQ

@temp
D=M

// Ao R2, � adicionado o valor contido no local tempor�rio
@R2
M=M+D

// Decrementa- o contador i
@i
M=M-1

// Retorna ao in�cio do loop
@LOOP
0; JMP

(END)
@END
0; JEQ

// Para o valor contido em R0 maior ou igual
(R0MAIOR)

// O valor contido em R0 � copiado para um local tempor�rio na mem�ria
@R0
D=M

@temp
M=D

// Define-se um contador i com valor de R1
@R1
D=M

@i
M=D

// Pula para a execu��o do loop
@LOOP
0; JMP

// Para o valor contido em R1 maior
(R1MAIOR)

// O valor contido em R1 � copiado para um local tempor�rio na mem�ria
@R1
D=M

@temp
M=D

// Define-se um contador i com valor de R0
@R0
D=M

@i
M=D

// Pula para a execu��o do loop
@LOOP
0; JMP