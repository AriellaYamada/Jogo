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

static Pos_Invaders + #0, #83
static Pos_Invaders + #5, #236
static Pos_Invaders + #1, #573
static Pos_Invaders + #11, #558
static Pos_Invaders + #3, #147
static Pos_Invaders + #4, #234
static Pos_Invaders + #6, #327
static Pos_Invaders + #7, #329
static Pos_Invaders + #8, #461
static Pos_Invaders + #19, #903
static Pos_Invaders + #10, #556
static Pos_Invaders + #16, #805
static Pos_Invaders + #12, #85
static Pos_Invaders + #14, #749
static Pos_Invaders + #2, #145
static Pos_Invaders + #15, #751
static Pos_Invaders + #13, #575
static Pos_Invaders + #17, #807
static Pos_Invaders + #18, #901
static Pos_Invaders + #9, #463


;------------- inicio --------------

main:

	call PrintStones
	call PrintInvaders
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

PrintStones:

	push r0
	push r1
	push r2
	push r3
	push r4
	push r5


	loadn r0, #rand_StonePos
	loadn r1, #10 	; numero de pedras na tela
	loadn r2, #0	; contador
	loadn r5, #39

	For_PrintStones: 

		cmp r2, r1
		jeq Fim_PrintStones
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
		jmp For_PrintStones

		Fim_PrintStones:
			pop r5
			pop r4
			pop r3
			pop r2
			pop r1
			pop r0
			rts

	
;#################################################
PrintInvaders:

	push r0
	push r1
	push r2
	push r3
	push r4

	loadn r0, #Pos_Invaders
	load r1, Invader
	loadn r2, #20
	loadn r3, #0

	LoopPrintInvaders:

		cmp r3, r2
		jeq FimPrintInvaders
		loadi r4, r0
		outchar r1, r4
		inc r0
		inc r3
		jmp LoopPrintInvaders

FimPrintInvaders:
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



