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


PosAnterior : var #1
PosNova : var #1

Tecla: var #1

PosNovaTiro: var #1
PosAnteriorTiro: var #1
FlagTiro: var #1

Contador: var #1
ContadorFim: var #1



;------------- inicio --------------

main:
	
	
	loadn r0, #1140
	loadn r1, #9
	loadn r2, #0
	loadn r3, #16

	outchar r1, r0

	store PosAnterior, r0
	store PosNova, r0
	store Contador, r2
	store ContadorFim, r3

	LoopMain:

		load r0, Contador
		loadn r1, #65530
		cmp r0, r1
		jeq EstouroContador

		loadn r1, #10
		loadn r2, #0
		mod r1, r0, r1
		cmp r1, r2

		jeq LoopPersonagem

		;loadn r1, #5
		;loadn r2, #0
		;mod r1, r0, r1
		;cmp r1, r2

		;jeq LoopAlien

		loadn r1, #2
		loadn r2, #0
		mod r1, r0, r1
		cmp r1, r2

		jeq LoopTiro
		
		load r0, ContadorFim
		cmp r0, r3

		;jeq LoopFim

		call Delay

		load r0, Contador
		inc r0

		jmp LoopMain
	
	LoopFim:
		
		halt

	LoopPersonagem:

		call LeTecla

		call ApagaPersonagem

		call AtualizaPersonagem

		call PrintPersonagem

		jmp LoopMain

	;LoopAlien:

	LoopTiro:

		call AtualizaTiro

		call PrintTiro

		jmp LoopMain

		
;#################################################


EstouroContador:

	loadn r0, #0
	store Contador, r0
	jmp LoopMain


;#################################################


Delay:
	
	loadn r1, #20
 
	Delay2:

		loadn r0, #300

	Delay1: 

		dec r0
		jnz Delay1
		dec r1
		jnz Delay2

		rts


;#################################################
		
PrintPersonagem:
		
		push r0
		push r1

		load r0, PosNova
		loadn r1, #9

		outchar r1, r0

		store PosAnterior, r0
		;store PosAnteriorTiro, r0

		pop r1
		pop r0

		rts

ApagaPersonagem:
		
	push r0
	push r1 

	load r0, PosAnterior
	loadn r1, #' '

	outchar r1, r0

	pop r1
	pop r0

	rts

AtualizaPersonagem:
	
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

	loadn r1, #'l'
	cmp r0, r1
	jeq Atirou1

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

	Atirou1:

		loadn r0, #1
		store FlagTiro, r0 

	Fim:

		pop r2
		pop r1
		pop r0

		rts

;#################################################

LeTecla:

	push r0
	push r1

	LoopLeTecla:

		loadn r1, #255

		inchar r0

		cmp r0, r1
		
		jeq LoopLeTecla

		store Tecla, r0

		pop r0
		pop r1

		rts

;#################################################


AtualizaTiro:
	
	push r0
	push r1
	push r2
	push r3

	load r0, FlagTiro
	loadn r1, #1
	cmp r0 , r1
	jeq Atirou
	jmp NAtirou


	Atirou:

		loadn r0, #40
		load r1, PosAnteriorTiro
		loadn r2, #38
		
		mod r3, r1, r0
		cmp r3, r5
		jeq FimFlagTiro
		
		sub r1, r1, r0

		store PosAnteriorTiro, r1

		sub r1, r1, r0

		store PosNovaTiro, r1 

		jmp FimTiro


	NAtirou:

		loadn r0, #40
		load r1, PosNovaTiro

		sub r1, r1, r0

		store PosNovaTiro, r1
		store PosAnteriorTiro, r1

		jmp FimTiro


	FimFlagTiro:

		loadn r0, #0
		store FlagTiro, r0
		load r1, PosNovaTiro
		loadn r0, #' '
		outchar r0, r1

		Jmp FimTiro


	FimTiro:

		pop r3
		pop r2
		pop r1
		pop r0


PrintTiro:
	
	push r0
	push r1
	push r2

	load r0, FlagTiro
	loadn r1, #1
	cmp r0, r1

	jeq Print
	jmp FimPrintTiro


	Print:


		load r0, PosAnteriorTiro	
		load r1, PosNovaTiro
		loadn r2, #8
		
		outchar r2, r1

	
	FimPrintTiro:

		pop r2
		pop r1
		pop r0

		rts