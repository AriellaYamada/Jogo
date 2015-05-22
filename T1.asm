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

		;loadn r1, #10
		;loadn r2, #0
		;mod r1, r0, r1
		;cmp r1, r2

		;jeq LoopPersonagem

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

		load r0, Tecla
		loadn r1, #255
		cmp r0, r1
		jeq LoopMain

		call ApagaPersonagem

		call AtualizaPersonagem

		call PrintPersonagem

		jmp LoopMain

	;LoopAlien:

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
	jmp Fimtiro


	Atirou:

		loadn r0, #40
		load r1, PosAnteriorTiro
		
		sub r1, r1, r0

		store PosNovaTiro, r1 

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