;------------- TRABALHO 1 - JOGO --------------

jmp main

;------------- variaveis --------------

Carachter : string "C"
Weapon : string "->"
Stone : string "x"
Invader : string "I"
Pos_Invaders : var #20
MinPos_Invaders : var #20
MaxPos_Invaders : var #20
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
static Pos_Invaders + #1, #236
static Pos_Invaders + #2, #573
static Pos_Invaders + #3, #558
static Pos_Invaders + #4, #234
static Pos_Invaders + #5, #147
static Pos_Invaders + #6, #327
static Pos_Invaders + #7, #903
static Pos_Invaders + #8, #461
static Pos_Invaders + #9, #329
static Pos_Invaders + #10, #556
static Pos_Invaders + #11, #85
static Pos_Invaders + #12, #805
static Pos_Invaders + #13, #751
static Pos_Invaders + #14, #749
static Pos_Invaders + #15, #575
static Pos_Invaders + #16, #145
static Pos_Invaders + #17, #807
static Pos_Invaders + #18, #901
static Pos_Invaders + #19, #463

static MinPos_Invaders + #0, #81
static MinPos_Invaders + #1, #236
static MinPos_Invaders + #2, #571
static MinPos_Invaders + #3, #558
static MinPos_Invaders + #4, #232
static MinPos_Invaders + #5, #147
static MinPos_Invaders + #6, #325
static MinPos_Invaders + #7, #903
static MinPos_Invaders + #8, #459
static MinPos_Invaders + #9, #329
static MinPos_Invaders + #10, #554
static MinPos_Invaders + #11, #85
static MinPos_Invaders + #12, #803
static MinPos_Invaders + #13, #751
static MinPos_Invaders + #14, #747
static MinPos_Invaders + #15, #575
static MinPos_Invaders + #16, #143
static MinPos_Invaders + #17, #807
static MinPos_Invaders + #18, #899
static MinPos_Invaders + #19, #463

static MaxPos_Invaders + #0, #83
static MaxPos_Invaders + #1, #238
static MaxPos_Invaders + #2, #573
static MaxPos_Invaders + #3, #560
static MaxPos_Invaders + #4, #234
static MaxPos_Invaders + #5, #149
static MaxPos_Invaders + #6, #327
static MaxPos_Invaders + #7, #905
static MaxPos_Invaders + #8, #461
static MaxPos_Invaders + #9, #331
static MaxPos_Invaders + #10, #556
static MaxPos_Invaders + #11, #87
static MaxPos_Invaders + #12, #805
static MaxPos_Invaders + #13, #753
static MaxPos_Invaders + #14, #749
static MaxPos_Invaders + #15, #577
static MaxPos_Invaders + #16, #145
static MaxPos_Invaders + #17, #809
static MaxPos_Invaders + #18, #901
static MaxPos_Invaders + #19, #465


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

		call AtualizaInvaders

		call Delay

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

AtualizaInvaders:
	
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6

	loadn r0, #Pos_Invaders
	load r1, Invader
	loadn r2, #' '
	loadn r3, #10
	loadn r4, #0

	LoopAtualizaInvaders:
		cmp r3, r4
		jeq FimAtualizaInvaders
		loadi r5, r0
		outchar r2, r5
		dec r5
		outchar r1, r5
		
		storei r0, r5
		inc r0
		loadi r6, r0
		outchar r2, r6
		inc r6
		outchar r1, r6
		
		storei r0, r6
		inc r0
		inc r4
		jmp LoopAtualizaInvaders

	FimAtualizaInvaders:

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

;----------------------------------
Delay:
						;Utiliza Push e Pop para nao afetar os Ristradores do programa principal
	push r0
	push r1
	
	loadn r1, #5  ; a
   Delay_volta2:				; contador de tempo quebrado em duas partes (dois loops de decremento)
	loadn r0, #3000	; b
   Delay_volta: 
	dec r0					; (4*a + 6)b = 1000000  == 1 seg  em um clock de 1MHz
	jnz Delay_volta	
	Dec R1
	jnz Delay_volta2
	
	pop r1
	pop r0
	
	rts

