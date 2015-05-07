;------------- TRABALHO 1 - JOGO --------------

jmp main

;------------- variaveis --------------

Carachter : string "C"
Weapon : string "->"
Stone : string "x"
Invader : string "I"
Pos_Invaders : var #20
rand_StonePos : var #10
PosAnterior : var #1
PosNova : var #1
Tecla: var #1

static rand_StonePos + #0, #84
static rand_StonePos + #1, #146
static rand_StonePos + #2, #235
static rand_StonePos + #3, #328
static rand_StonePos + #4, #462
static rand_StonePos + #5, #557
static rand_StonePos + #6, #574
static rand_StonePos + #7, #750
static rand_StonePos + #8, #806
static rand_StonePos + #9, #902

;------------- inicio --------------

main:

	call PrintStonesAndInvaders
	loadn r0, #1140
	load r1, Carachter
	outchar r1, r0

	store PosAnterior, r0
	store PosNova, r0

	Loop:

		call LeTecla
		
		load r3, Tecla
		loadn r4, #255

		cmp r3, r4

		jeq Loop

		call ApagaPersonagem 

		call NovaPosicao

		call PrintPersonagem

		;call Delay

		jmp Loop
	
	halt

	halt

PrintStonesAndInvaders:

	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7

	loadn r0, #rand_StonePos
	loadn r1, #10 	; numero de pedras na tela
	loadn r2, #0	; contador
	loadn r5, #39
	loadn r6, #Pos_Invaders

	For_PrintStonesAndInvaders: 

		cmp r2, r1
		jeq Fim_PrintStonesAndInvaders
		loadi r3, r0
		;Imprime a primeira pos da pedra
		load r4, Stone
		outchar r4, r3
		;Imprime a segunda linha da pedra
		add r3, r3, r5
		outchar r4, r3
		inc r3
		outchar r4, r3
		inc r3
		outchar r4, r3
		inc r0
		inc r2
		jmp For_PrintStonesAndInvaders

		Fim_PrintStonesAndInvaders:
			pop r7
			pop r6
			pop r5
			pop r4
			pop r3
			pop r2
			pop r1
			pop r0
			rts

	
;#################################################
		
PrintPersonagem:
		
		push r0
		push r1

		load r0, PosNova
		load r1, Carachter

		outchar r1, r0

		store PosAnterior, r0

		pop r1
		pop r0

		rts

;#################################################

ApagaPersonagem:
		
	push r0
	push r1 

	load r0, PosAnterior
	loadn r1, #' '

	outchar r1, r0

	pop r1
	pop r0

	rts

;#################################################


LeTecla:

	push fr
	push r0

	LoopLeTecla:

		inchar r0
		
		store Tecla, r0

FimLeTecla:

	pop r0
	pop fr

	rts

;#################################################

NovaPosicao:
	
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5

	load r0, Tecla

	loadn r1, #'d'
	cmp r0, r1
	jeq MoveRIGHT

	loadn r1, #'a'
	cmp r0, r1
	jeq MoveLeft

	loadn r4, #1119
	loadn r5, #1160


	MoveRIGHT:

		loadn r0, #1
		load r1, PosAnterior
		load r2, PosNova

		;add r2, r1 , r0
		;cmp r2, r5
		;jeq MoveBeginLine

		store PosNova, r2

		jmp Fim

		MoveBeginLine:
			loadn r0, #1120
			store PosNova, r0
			jmp Fim

	MoveLeft:

		loadn r0, #1
		load r1, PosAnterior
		load r2, PosNova

		;sub r2, r1, r0
		;cmp r2, r4
		;jeg MoveEndLine

		store PosNova, r2

		jmp Fim

		MoveEndLine:
			loadn r0, #1159
			store PosNova, r0
			jmp Fim

	Fim:

		pop r5
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0

		rts



