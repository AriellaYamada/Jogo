;------------- TRABALHO 1 - JOGO --------------

telai0  : string "                                        "
telai1  : string "                                        "
telai2  : string "                                        "
telai3  : string "                                        "
telai4  : string "                                        "
telai5  : string "                                        "
telai6  : string "                                        "
telai7  : string "                                        "
telai8  : string "     _____         _   _                "
telai9  : string "    |  |  |_ _ ___| |_|_|___ ___        "
telai10 : string "    |     | | |   |  _| |   | . |       "
telai11 : string "    |__|__|___|_|_|_| |_|_|_|_  |       "
telai12 : string "                            |___|       "
telai13 : string "                                        "
telai14 : string "        _____ _ _                       "
telai15 : string "       |  _  | |_|___ ___ ___           "
telai16 : string "       |     | | | -_|   |_ -|          "
telai17 : string "       |__|__|_|_|___|_|_|___|          "
telai18 : string "                                        "
telai19 : string "                                        "
telai20 : string "                                        "
telai21 : string "                                        "
telai22 : string "                                        "
telai23 : string "                                        "
telai24 : string "                                        "
telai25 : string "                                        "
telai26 : string "                                        "
telai27 : string "                                        "
telai28 : string "                                        "
telai29 : string "                                        "

telaf0  : string "                                        "
telaf1  : string "                                        "
telaf2  : string "                                        "
telaf3  : string "                                        "
telaf4  : string "                                        "
telaf5  : string "                                        "
telaf6  : string "                                        "
telaf7  : string "                                        "
telaf8  : string "     _____                              "
telaf9  : string "    |   __|___ _____ ___                "
telaf10 : string "    |  |  | .'|     | -_|               "
telaf11 : string "    |_____|__,|_|_|_|___|               "
telaf12 : string "                                        "
telaf13 : string "                                        "
telaf14 : string "        _____                           "
telaf15 : string "       |     | _ _ ___ ___              "
telaf16 : string "       |  |  || | | -_|  _|             "
telaf17 : string "       |_____|\\_/|___|_|               "
telaf18 : string "                                        "
telaf19 : string "                                        "
telaf20 : string "                                        "
telaf21 : string "                                        "
telaf22 : string "                                        "
telaf23 : string "                                        "
telaf24 : string "                                        "
telaf25 : string "                                        "
telaf26 : string "                                        "
telaf27 : string "                                        "
telaf28 : string "                                        "
telaf29 : string "                                        "
                                                      
; _____         _   _                        
;|  |  |_ _ ___| |_|_|___ ___   
;|     | | |   |  _| |   | . |  
;|__|__|___|_|_|_| |_|_|_|_  |  
;                        |___|                         
                                                      
; _____ _ _             
;|  _  | |_|___ ___ ___ 
;|     | | | -_|   |_ -|
;|__|__|_|_|___|_|_|___|
                                          
; _____                  _____             
;|   __|___ _____ ___   |     |_ _ ___ ___ 
;|  |  | .'|     | -_|  |  |  | | | -_|  _|
;|_____|__,|_|_|_|___|  |_____|\_/|___|_|  
                    

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

static Contador + #0, #0

strLifes : string "Lifes "

Invader : var #1
Charecter : var #1

static Invader + #0, #519
static Charecter + #0, #1033

Vidas: var #1
QtdInvaders: var #1

static Vidas + #0, #3
static QtdInvaders + #0, #20

Tiro_Invader : string ":"
Pos_Invaders : var #20
MinPos_Invaders : var #20
MaxPos_Invaders : var #20
Dir_Invaders : var #20
FlagTiro_Invaders: var #20
Tiro_Invaders : var #20
rand_StonePos : var #10

static rand_StonePos + #0, #84
static rand_StonePos + #1, #146
static rand_StonePos + #2, #235
static rand_StonePos + #3, #328
static rand_StonePos + #4, #462
static rand_StonePos + #5, #557
static rand_StonePos + #6, #573
static rand_StonePos + #7, #750
static rand_StonePos + #8, #806
static rand_StonePos + #9, #902

static Pos_Invaders + #0, #83
static Pos_Invaders + #1, #85
static Pos_Invaders + #2, #145
static Pos_Invaders + #3, #147
static Pos_Invaders + #4, #234
static Pos_Invaders + #5, #236
static Pos_Invaders + #6, #327
static Pos_Invaders + #7, #329
static Pos_Invaders + #8, #461
static Pos_Invaders + #9, #463
static Pos_Invaders + #10, #556
static Pos_Invaders + #11, #558
static Pos_Invaders + #12, #572
static Pos_Invaders + #13, #574
static Pos_Invaders + #14, #749
static Pos_Invaders + #15, #751
static Pos_Invaders + #16, #805
static Pos_Invaders + #17, #807
static Pos_Invaders + #18, #901
static Pos_Invaders + #19, #903

static MinPos_Invaders + #0, #81
static MinPos_Invaders + #1, #85
static MinPos_Invaders + #2, #143
static MinPos_Invaders + #3, #147
static MinPos_Invaders + #4, #232
static MinPos_Invaders + #5, #236
static MinPos_Invaders + #6, #325
static MinPos_Invaders + #7, #329
static MinPos_Invaders + #8, #459
static MinPos_Invaders + #9, #463
static MinPos_Invaders + #10, #554
static MinPos_Invaders + #11, #558
static MinPos_Invaders + #12, #570
static MinPos_Invaders + #13, #574
static MinPos_Invaders + #14, #747
static MinPos_Invaders + #15, #751
static MinPos_Invaders + #16, #803
static MinPos_Invaders + #17, #807
static MinPos_Invaders + #18, #899
static MinPos_Invaders + #19, #903

static MaxPos_Invaders + #0, #83
static MaxPos_Invaders + #1, #87
static MaxPos_Invaders + #2, #145
static MaxPos_Invaders + #3, #149
static MaxPos_Invaders + #4, #233
static MaxPos_Invaders + #5, #238
static MaxPos_Invaders + #6, #327
static MaxPos_Invaders + #7, #331
static MaxPos_Invaders + #8, #461
static MaxPos_Invaders + #9, #465
static MaxPos_Invaders + #10, #556
static MaxPos_Invaders + #11, #560
static MaxPos_Invaders + #12, #572
static MaxPos_Invaders + #13, #576
static MaxPos_Invaders + #14, #749
static MaxPos_Invaders + #15, #753
static MaxPos_Invaders + #16, #805
static MaxPos_Invaders + #17, #809
static MaxPos_Invaders + #18, #901
static MaxPos_Invaders + #19, #905

static Dir_Invaders + #0, #0 ;esq
static Dir_Invaders + #1, #1 ;dir
static Dir_Invaders + #2, #0
static Dir_Invaders + #3, #1
static Dir_Invaders + #4, #0
static Dir_Invaders + #5, #1
static Dir_Invaders + #6, #0
static Dir_Invaders + #7, #1
static Dir_Invaders + #8, #0
static Dir_Invaders + #9, #1
static Dir_Invaders + #10, #0
static Dir_Invaders + #11, #1
static Dir_Invaders + #12, #0
static Dir_Invaders + #13, #1
static Dir_Invaders + #14, #0
static Dir_Invaders + #15, #1
static Dir_Invaders + #16, #0
static Dir_Invaders + #17, #1
static Dir_Invaders + #18, #0
static Dir_Invaders + #19, #1

static FlagTiro_Invaders + #0, #0
static FlagTiro_Invaders + #1, #0
static FlagTiro_Invaders + #2, #0
static FlagTiro_Invaders + #3, #0
static FlagTiro_Invaders + #4, #0
static FlagTiro_Invaders + #5, #0
static FlagTiro_Invaders + #6, #0
static FlagTiro_Invaders + #7, #0
static FlagTiro_Invaders + #8, #0
static FlagTiro_Invaders + #9, #0
static FlagTiro_Invaders + #10, #0
static FlagTiro_Invaders + #11, #0
static FlagTiro_Invaders + #12, #0
static FlagTiro_Invaders + #13, #0
static FlagTiro_Invaders + #14, #0
static FlagTiro_Invaders + #15, #0
static FlagTiro_Invaders + #16, #0
static FlagTiro_Invaders + #17, #0
static FlagTiro_Invaders + #18, #0
static FlagTiro_Invaders + #19, #0

static Tiro_Invaders + #0, #1200
static Tiro_Invaders + #1, #1200
static Tiro_Invaders + #2, #1200
static Tiro_Invaders + #3, #1200
static Tiro_Invaders + #4, #1200
static Tiro_Invaders + #5, #1200
static Tiro_Invaders + #6, #1200
static Tiro_Invaders + #7, #1200
static Tiro_Invaders + #8, #1200
static Tiro_Invaders + #9, #1200
static Tiro_Invaders + #10, #1200
static Tiro_Invaders + #11, #1200
static Tiro_Invaders + #12, #1200
static Tiro_Invaders + #13, #1200
static Tiro_Invaders + #14, #1200
static Tiro_Invaders + #15, #1200
static Tiro_Invaders + #16, #1200
static Tiro_Invaders + #17, #1200
static Tiro_Invaders + #18, #1200
static Tiro_Invaders + #19, #1200

;------------- inicio --------------

main:
	
	loadn r0, #0
	loadn r1, #strLifes
	call ImprimeString
	loadn r0, #6
	load r1, Vidas
	loadn r2, #1328
	add r2, r2, r1
	outchar r2, r0
	
	loadn r0, #1140
	loadn r1, #9
	loadn r2, #0
	loadn r3, #16

	outchar r1, r0

	store PosAnterior, r0
	store PosNova, r0
	store Contador, r2
	store ContadorFim, r3

	call PrintInvaders
	call PrintStones

	LoopMain:

		load r0, Contador
		loadn r1, #65530
		cmp r0, r1
		jeq EstouroContador

		call VerificaFim
		call AtualizaInvaders
		;call AtualizaTiroInvaders

		loadn r1, #2
		loadn r2, #0
		mod r1, r0, r1
		cmp r1, r2

		jeq LoopPersonagem

		loadn r1, #3
		loadn r2, #0
		mod r1, r0, r1
		cmp r1, r2

		jeq LoopAlien

		loadn r1, #5
		loadn r2, #0
		mod r1, r0, r1
		cmp r1, r2

		;jeq LoopTiro
		
		load r0, ContadorFim
		cmp r0, r3

		jeq LoopFim

		call Delay

		load r0, Contador
		inc r0

		jmp LoopMain
	
	LoopFim:
		
		halt

	LoopPersonagem:

		call LeTecla

		load r0, Tecla
		loadn r1, #255
		cmp r0, r1
		jeq LoopMain

		call ApagaPersonagem

		call AtualizaPersonagem

		call PrintPersonagem

		jmp LoopMain

	LoopAlien:

		call AtualizaInvaders

		jmp LoopMain

	LoopTiro:

		call LeTecla

		load r0, Tecla
		loadn r1, #255
		cmp r0, r1

		jeq LoopMain

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

PrintStones:

	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6


	loadn r0, #rand_StonePos
	loadn r1, #10 	; numero de pedras na tela
	loadn r2, #0	; contador
	loadn r5, #39

	For_PrintStones: 

		cmp r2, r1
		jeq Fim_PrintStones
		loadi r3, r0
		;Imprime a primeira pos da pedra
		loadn r4, #6 ;Carrega o "desenho" da pedra
		loadn r6, #256 ;Carrega a cor da pedra
		add r4, r4, r6
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
		load r1, Charecter

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

	MoveUP:

		loadn r0, #40
		load r1, PosAnterior
		load r2, PosNova

		sub r2, r1, r0

		store PosNova, r2
		store PosAnteriorTiro, r2

		jmp Fim

	MoveDOWN:

		loadn r0, #40
		load r1, PosAnterior
		load r2, PosNova

		add r2, r1 , r0

		store PosNova, r2
		store PosAnteriorTiro, r2

		jmp Fim

	MoveRIGHT:

		loadn r0, #1
		load r1, PosAnterior
		load r2, PosNova

		add r2, r1 , r0

		store PosNova, r2
		store PosAnteriorTiro, r2

		jmp Fim

	MoveLeft:

		loadn r0, #1
		load r1, PosAnterior
		load r2, PosNova

		sub r2, r1, r0

		store PosNova, r2
		store PosAnteriorTiro, r2

		jmp Fim
		
	Fim:

		pop r2
		pop r1
		pop r0

		rts

;#################################################

LeTecla:

	push r0
	
	inchar r0

	store Tecla, r0

	pop r0

	rts

;#################################################


AtualizaTiro:
	
	push r0
	push r1
	push r2
	push r3

	load r0, Tecla
	loadn r1, #'l' 
	
	cmp r0, r1
	jeq Atirou
	jmp FimTiro


	Atirou:

		loadn r0, #40
		load r1, PosAnteriorTiro
		
		sub r1, r1, r0

		store PosNovaTiro, r1 

		jmp FimTiro


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
	push r7

	loadn r0, #Pos_Invaders
	loadn r1, #21
	loadn r2, #MinPos_Invaders
	loadn r3, #MaxPos_Invaders
	loadn r4, #Dir_Invaders

	LoopAtualizaInvaders:
		dec r1
		jz FimAtualizaInvaders
		loadi r5, r0	
		loadn r6, #' '	
		outchar r6, r5	;Apaga invader
		loadi r7, r4
		loadn r6, #0
		cmp r6, r7				;Verifica para onde estava andando
		jeq MovInv_Esquerda		;Se estava indo para a esquerda, mantém
		jmp MocInv_Direita  	;Se estarava indo para a direita, mantém

		MovInv_Esquerda:
			loadi r6, r2
			cmp r5, r6			;Verifica se esta na posição minima
			jeq MocInv_Direita 	;Se na posição min, então anda para a direita
			loadn r7, #0		;Grava a direção para qual esta andando
			storei r4, r7
			dec r5				;Calcula nova posição
			jmp Imprime_Novo

		MocInv_Direita:
			loadi r6, r3
			cmp r5, r6 			;Verifica se esta na posição maxima
			jeq MovInv_Esquerda	;Se esta na posição maxima, então anda para a esquerda
			loadn r7, #1
			storei r4, r7		;Armazena a direção para qual vai andar
			inc r5				;Calcula nova posição
			jmp Imprime_Novo	

		Imprime_Novo:

			storei r0, r5
			load r6, Invader
			outchar r6, r5
			inc r0
			inc r2
			inc r3
			inc r4
			call VerificaTiro_Invader
			jmp LoopAtualizaInvaders


	FimAtualizaInvaders:	

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

VerificaTiro_Invader:

	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7

	loadn r0, #FlagTiro_Invaders
	loadn r2, #21
	loadn r3, #2
	loadn r5, #Tiro_Invaders
	loadn r6, #1200

	sub r2, r2, r1
	add r0, r0, r2
	add r5, r5, r2
	loadi r4, r0

	cmp r4, r2
	jeq ZeraFlagTiro
	inc r4
	jmp EndVerificaTiro_Invader

	ZeraFlagTiro:
		loadn r4, #0
		loadi r7, r5
		cmp r7, r6
		jle EndVerificaTiro_Invader
		loadn r1, #Pos_Invaders
		add r1, r1, r2
		loadi r7, r1
		storei r5, r7
		jmp EndVerificaTiro_Invader

	EndVerificaTiro_Invader:

		storei r0, r4
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

AtualizaTiroInvaders:

	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6

	loadn r0, #Tiro_Invaders
	loadn r1, #21
	loadn r2, #40
	loadn r3, #1200
	load r4, Tiro_Invader
	loadn r5, #' '
	dec r0

	LoopAtualizaTiroInvaders:
		inc r0
		dec r1
		jz FimLoopAtualizaTiroInvaders
		loadi r6, r0
		cmp r3, r6
		jeg LoopAtualizaTiroInvaders
		outchar r4, r6
		add r6, r6, r2
		outchar r4, r6
		storei r0, r6
		jmp LoopAtualizaTiroInvaders

	FimLoopAtualizaTiroInvaders:

		pop r6
		pop r5
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		rts


;#################################################

VerificaFim:

	push r0
	push r1
	push r2
	push r3
	push r4

	load r0, PosNova
	loadn r1, #Pos_Invaders
	load r2, PosNovaTiro
	loadn r3, #21

	LoopVerificaFim:
		dec r3
		jz FimVerificaFim
		loadi r4, r1	;Verifica se o Personagem esta na mesma posição de um Invader
		cmp r0, r4
		jeq PerdeVida	;Caso esteja, perde uma vida
		cmp r2, r4		;Verifica se o tiro do personagem atingiu um Invader
		jeq MataInvader	;Caso esteja, o Invader morre
		inc r1
		jmp LoopVerificaFim

	FimVerificaFim:

		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		rts

;#################################################

PerdeVida:

	push r0

	load r0, Vidas	
	dec r0			;Decrementa o numero de vidas
	jz FimPerdeu	;Caso não hajam mais vidas, o jogo acaba
	store Vidas, r0	;Armazena a nova quantidade de vidas

	pop r0
	rts

;#################################################

MataInvader:
	
	push r0
	push r1
	push r2
	push r3 
	push r4

	load r0, QtdInvaders
	loadn r1, #Dir_Invaders
	loadn r2, #21
	sub r2, r2, r3			;Encontra o Invader que foi assassinado
	add r1, r1, r2			;Encontra a posição no vetor do Invader que foi morto
	loadn r4, #2 	
	storei r1, r4			;Atualiza a condição do Invader

	dec r0					;Decrementa a quantidade de Invaders vivos
	jz FimGanhou			;Caso não hajam mais Invaders vivos, o jogo acaba
	store QtdInvaders, r0	;Atualiza quantidade de Invaders vivos

	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts


;#################################################

FimGanhou:

	push r0
	push r1

	loadn r0, #0
	loadn r1, #telai0

	call ImprimeTela

	pop r1
	pop r0

	halt

;#################################################

FimPerdeu:

	push r0
	push r1

	loadn r0, #0
	loadn r1, #telaf0

	call ImprimeTela

	pop r1
	pop r0

	halt

;#################################################

ImprimeString:
	
	push r0
	push r1
	push r2  
	push r3  

	loadn r2, #'\0'

LoopPercorre:
	
	loadi r3, r1  
	cmp r3, r2  		
	jeq SaiLoop  
	outchar r3, r0	
	inc r0
	inc r1
	jmp LoopPercorre

SaiLoop:
	
	pop r3
	pop r2
	pop r1
	pop r0
	rts

;#################################################

ApagaTela:

	push r0
	push r1

	loadn r0, #1199
	loadn r1, #' '

LoopApagarTela:

	outchar r1, r0
	dec r0
	jnz LoopApagarTela
	outchar r1, r0
		
	pop r1	
	pop r0

	rts

;#################################################

ImprimeTela:					
	
	call ApagaTela
	push r0				
	push r1
	push r2
	push r3				
	push r4			
	push r5 
	
	loadn r3, #1199
	loadn r5, #'\0'

LoopImprime:	
	
	loadi r4, r1
	cmp r4, r3
	jeg SaiImprime
	cmp r4, r5
	jeq IncR1	
	outchar r4, r0
	inc r0
	inc r1
	jmp LoopImprime

IncR1:

	inc r1
	jmp LoopImprime


SaiImprime:	

	pop r5
	pop r4				
	pop r3
	pop r2
	pop r1
	pop r0

	rts	