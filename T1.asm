;------------- TRABALHO 1 - JOGO --------------

tela0  : string "                                        "
tela1  : string "                           x            "
tela2  : string "      x                   xxx           "
tela3  : string "     xxx                                "
tela4  : string "                   x                    "
tela5  : string "                  xxx                   "
tela6  : string "                                        "
tela7  : string "                                        "
tela8  : string "            x                           "
tela9  : string "           xxx                          "
tela10 : string "                             x          "
tela11 : string "                            xxx         "
tela12 : string "                                        "
tela13 : string "                   x                    "
tela14 : string "                  xxx                   "
tela15 : string "     x                                  "
tela16 : string "    xxx                           x     "
tela17 : string "                                 xxx    "
tela18 : string "                                        "
tela19 : string "                                        "
tela20 : string "                                        "
tela21 : string " ====================================== "
tela22 : string "                                        "
tela23 : string "                                        "
tela24 : string "                                        "
tela25 : string "                                        "
tela26 : string "                                        "
tela27 : string "                                        "
tela28 : string "                                        "
tela29 : string "                                        "



jmp main

;------------- variaveis --------------

Pos_Invaders : var #20

PosAnterior : var #1
PosNova : var #1

Tecla: var #1

PosNovaTiro: var #1
PosAnteriorTiro: var #1

rand_StonePos : var #10

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


;------------- inicio --------------

main:
	
	call PrintStones

	call PrintInvaders

	loadn r2, #'l'
	loadn r0, #1140
	loadn r1, #8

	outchar r1, r0

	store PosAnterior, r0
	store PosNova, r0

	Loop:

		call LeTecla
		
		load r3, Tecla
		loadn r4, #255

		cmp r3, r4

		jeq Loop

		cmp r3, r2

		jeq Tiro

		call ApagaPersonagem 

		call NovaPosicao

		call PrintPersonagem

		call AtualizaInvaders

		;call Delay

		jmp Loop
	
	halt

;#################################################

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
		loadn r4, #6
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
	loadn r1, #7
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
	loadn r1, #7
	loadn r2, #' '
	loadn r3, #10
	loadn r4, #0

	LoopAtualizaInvaders:
		cmp r3, r4
		jeq FimAtualizaInvaders
		loadi r5, r0
		outchar r2, r5
		inc r0
		loadi r6, r0
		outchar r2, r6
		dec r5
		inc r6
		;storei r0, r5
		;dec r0
		;storei r0, r6
		outchar r1, r5
		outchar r1, r6
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
		loadn r1, #9

		outchar r1, r0

		store PosAnterior, r0
		store PosAnteriorTiro, r0

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

	load r0, Tecla

	loadn r1, #'w' 
	cmp r0, r1
	jeq MoveUP

	loadn r1, #'s'
	cmp r0, r1
	jeq MoveDOWN

	loadn r1, #'d'
	cmp r0, r1
	jeq MoveRIGHT

	loadn r1, #'a'
	cmp r0, r1
	jeq MoveLeft

	MoveUP:

		loadn r0, #40
		load r1, PosAnterior
		load r2, PosNova

		sub r2, r1, r0

		store PosNova, r2

		jmp Fim

	MoveDOWN:

		loadn r0, #40
		load r1, PosAnterior
		load r2, PosNova

		add r2, r1 , r0

		store PosNova, r2

		jmp Fim

	MoveRIGHT:

		loadn r0, #1
		load r1, PosAnterior
		load r2, PosNova

		add r2, r1 , r0

		store PosNova, r2

		jmp Fim

	MoveLeft:

		loadn r0, #1
		load r1, PosAnterior
		load r2, PosNova

		sub r2, r1, r0

		store PosNova, r2

		jmp Fim

	Fim:

		pop r2
		pop r1
		pop r0

		rts

;#################################################

Tiro:
	
	push r0
	push r1

	load r0, PosAnteriorTiro
	loadn r1, #8

	outchar r1, r0

	LoopTiro:

		jmp ApagaTiro

ApagaTiro:
	
	push r0
	push r1 

	load r0, PosAnteriorTiro
	loadn r1, #' '

	outchar r1, r0

	jmp IncrementaTiro

IncrementaTiro:
	
	loadn r0, #40
	load r1, PosAnteriorTiro
	load r2, PosNovaTiro

	sub r2, r1, r0

	store PosNovaTiro, r2

	jmp PrintTiro

PrintTiro:
	
	push r0
	push r1

	load r0, PosNovaTiro
	loadn r1, #8

	outchar r1, r0

	store PosAnteriorTiro, r0

	jmp LoopTiro

Sai:

	pop r1
	pop r0

	rts

;#################################################
