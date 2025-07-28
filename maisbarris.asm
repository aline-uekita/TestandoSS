jmp main
;Tubarao
posTubarao: var #10
    static posTubarao + #0, #0 ;inicializa no 0
    static posTubarao + #1, #0 ;inicializa no 0
    static posTubarao + #2, #0 ;inicializa no 0
    static posTubarao + #3, #0 ;inicializa no 0
    static posTubarao + #4, #0 ;inicializa no 0
    static posTubarao + #5, #0 ;inicializa no 0
    static posTubarao + #6, #0 ;inicializa no 0
    static posTubarao + #7, #0 ;inicializa no 0
    static posTubarao + #8, #0 ;inicializa no 0
    static posTubarao + #9, #0 ;inicializa no 0

posAntTubarao: var #10
    static posAntTubarao + #0, #0 ;inicializa no 0
    static posAntTubarao + #1, #0 ;inicializa no 0
    static posAntTubarao + #2, #0 ;inicializa no 0
    static posAntTubarao + #3, #0 ;inicializa no 0
    static posAntTubarao + #4, #0 ;inicializa no 0
    static posAntTubarao + #5, #0 ;inicializa no 0
    static posAntTubarao + #6, #0 ;inicializa no 0
    static posAntTubarao + #7, #0 ;inicializa no 0
    static posAntTubarao + #8, #0 ;inicializa no 0
    static posAntTubarao + #9, #0 ;inicializa no 0

FlagCaindo: var #10

parametroTubarao: var #1 ;Para saber qual Tubarao está caindo

IncRandTubarao: var #10
    static IncRandTubarao + #0, #0 ;inicializa no 0
    static IncRandTubarao + #1, #0 ;inicializa no 0
    static IncRandTubarao + #2, #0 ;inicializa no 0
    static IncRandTubarao + #3, #0 ;inicializa no 0
    static IncRandTubarao + #4, #0 ;inicializa no 0
    static IncRandTubarao + #5, #0 ;inicializa no 0
    static IncRandTubarao + #6, #0 ;inicializa no 0
    static IncRandTubarao + #7, #0 ;inicializa no 0
    static IncRandTubarao + #8, #0 ;inicializa no 0
    static IncRandTubarao + #9, #0 ;inicializa no 0

RandTubarao: var #40
    static RandTubarao + #0, #107
    static RandTubarao + #1, #85
    static RandTubarao + #2, #93
    static RandTubarao + #3, #113
    static RandTubarao + #4, #91
    static RandTubarao + #5, #104
    static RandTubarao + #6, #109
    static RandTubarao + #7, #117
    static RandTubarao + #8, #88
    static RandTubarao + #9, #81
    static RandTubarao + #10, #86
    static RandTubarao + #11, #98
    static RandTubarao + #12, #114
    static RandTubarao + #13, #95
    static RandTubarao + #14, #99
    static RandTubarao + #15, #84
    static RandTubarao + #16, #102
    static RandTubarao + #17, #89
    static RandTubarao + #18, #100
    static RandTubarao + #19, #83
    static RandTubarao + #20, #112
    static RandTubarao + #21, #115
    static RandTubarao + #22, #118
    static RandTubarao + #23, #106
    static RandTubarao + #24, #96
    static RandTubarao + #25, #101
    static RandTubarao + #26, #97
    static RandTubarao + #27, #108
    static RandTubarao + #28, #119
    static RandTubarao + #29, #110
    static RandTubarao + #30, #90
    static RandTubarao + #31, #87
    static RandTubarao + #32, #103
    static RandTubarao + #33, #82
    static RandTubarao + #34, #116
    static RandTubarao + #35, #92
    static RandTubarao + #36, #105
    static RandTubarao + #37, #94
    static RandTubarao + #38, #80
    static RandTubarao + #39, #111

FlagColuna: var #40 ;inicializa no zero == flag desligada

posSimoes: var #1
posAntSimoes: var #1

Msn0: string "BONUS"
Msn1: string "SCORE"

Bonus: var #1

Pontuacao: var #1
    static Pontuacao + #0, #0

;Codigo principal
main:
	loadn r1, #tela4Linha0	    ;Endereco onde comeca a primeira linha do cenario
	loadn r2, #30720  	   ;cor cinza
	call ImprimeTela

	loadn r2, #0                ;inicializa o contador com 0 

	Loopmenu:
		inchar r4
		loadn r1, #13           ;tecla enter
		
		inc r2                  ;faz a soma aleatória para dar o rand

		cmp r4, r1
		jne Loopmenu

		loadn r5, #40           ;limita o valor para ficar entre 0 e 39
		mod r3, r2, r5

		loadn r0, #IncRandTubarao
		storei r0, r3           ;guardo esse valor aleatório no IncRandTubarao[0]

    Restart:
        call Inicializacao

        call ApagaTela
        loadn R1, #tela1Linha0	    ;Endereco onde comeca a primeira linha do cenario!!
        loadn R2, #25600  			;cor azul -> onda
        call ImprimeTela2   		;Rotina de Impresao de Cenario na Tela Inteira
        
        loadn R1, #tela2Linha0	    ;Endereco onde comeca a primeira linha do cenario!!
        loadn R2, #10240            ;cor roxa -> correnteza
        call ImprimeTela2   	    ;Rotina de Impresao de Cenario na Tela Inteira
        
        loadn r0, #1119
        store posSimoes, r0         ;Simoes começa na linha 27, coluna 39
        call DesenhaSimoes

        loadn r0, #1 ;onde inicia a frase
        loadn r1, #Msn1
        loadn r2, #0 ;se quiser add cor 0 é nada
        call ImprimeStr2

        loadn r0, #34 ;onde inicia a frase
        loadn r1, #Msn0
        loadn r2, #0 ;se quiser add cor 0 é nada
        call ImprimeStr2


        loadn r0, #0	
        loadn r2, #0	

        Loop:
            call Placar

            loadn r1, #2
            mod r1, r0, r1
            cmp r1, r2
            ceq MoveSimoes

            loadn r7, #0    ;r7 vai ser meio que um parâmetro
            store parametroTubarao, r7
            loadn r1, #2    ;Começa quando for um múltiplo de 2
            mod r1, r0, r1
            cmp r1, r2 
            ceq MoveTubarao

            loadn r7, #1    ;r7 vai ser meio que um parâmetro
            store parametroTubarao, r7
            loadn r1, #3    ;Começa quando for um múltiplo de 3
            mod r1, r0, r1
            cmp r1, r2 
            ceq MoveTubarao
            
            loadn r7, #2    ;r7 vai ser meio que um parâmetro
            store parametroTubarao, r7
            loadn r1, #4    ;Começa quando for um múltiplo de 4
            mod r1, r0, r1
            cmp r1, r2 
            ceq MoveTubarao
            
            loadn r7, #3    ;r7 vai ser meio que um parâmetro
            store parametroTubarao, r7
            loadn r1, #5    ;Começa quando for um múltiplo de 5
            mod r1, r0, r1
            cmp r1, r2 
            ceq MoveTubarao

            loadn r7, #4    ;r7 vai ser meio que um parâmetro
            store parametroTubarao, r7
            loadn r1, #6    ;Começa quando for um múltiplo de 6
            mod r1, r0, r1
            cmp r1, r2 
            ceq MoveTubarao

            loadn r7, #5    ;r7 vai ser meio que um parâmetro
            store parametroTubarao, r7
            loadn r1, #2    ;Começa quando for um múltiplo de 2
            mod r1, r0, r1
            cmp r1, r2 
            ceq MoveTubarao

            loadn r7, #6    ;r7 vai ser meio que um parâmetro
            store parametroTubarao, r7
            loadn r1, #3    ;Começa quando for um múltiplo de 3
            mod r1, r0, r1
            cmp r1, r2 
            ceq MoveTubarao
            
            loadn r7, #7    ;r7 vai ser meio que um parâmetro
            store parametroTubarao, r7
            loadn r1, #4    ;Começa quando for um múltiplo de 4
            mod r1, r0, r1
            cmp r1, r2 
            ceq MoveTubarao
            
            loadn r7, #8    ;r7 vai ser meio que um parâmetro
            store parametroTubarao, r7
            loadn r1, #5    ;Começa quando for um múltiplo de 5
            mod r1, r0, r1
            cmp r1, r2 
            ceq MoveTubarao

            loadn r7, #9    ;r7 vai ser meio que um parâmetro
            store parametroTubarao, r7
            loadn r1, #6    ;Começa quando for um múltiplo de 6
            mod r1, r0, r1
            cmp r1, r2 
            ceq MoveTubarao

            call Delay

            inc r0 	        ;contador++
            
            jmp Loop
	
    fim:
        call ApagaTela

        loadn r1, #tela6Linha0 ;Endereco onde comeca a primeira linha do cenario
        loadn r2, #30720  	   ;cor cinza
        call ImprimeTela     

        halt

;--------------------------------------------
;               Inicialização
;--------------------------------------------
Inicializacao:
    ;Zera as flags
    push r0
    push r1
    push r2
    push r3

    loadn r0, #FlagCaindo       ;sempre é endereço, não flag
    loadn r2, #10               ;número de flags (como são de 0 - 4, se o r3 == 5, passou do número de flags existentes)
    loadn r1, #0                ;vai ser o 0 que zera as flags
    store posAntSimoes, r1
    loadn r3, #0                ;contador para não passar o número de flags -> qual flag que é
    
    LoopFlagCaindo0:
        storei r0, r1           ;endereço da flag recebe 0

        inc r0      ;vai para o próximo endereço da flag
        inc r3      ;vai para a próxima flag 

        cmp r3, r2
        jne LoopFlagCaindo0
        
    loadn r3, #0                ;contador para não passar o número de flags -> qual flag que é
    loadn r0, #FlagColuna
    loadn r2, #40               ;número de flags (como são de 0 - 5, se o r3 == 6, passou do número de flags existentes)
    LoopFlagColuna0:
        storei r0, r1           ;endereço da flag recebe 0

        inc r0      ;vai para o próximo endereço da flag
        inc r3      ;vai para a próxima flag 

        cmp r3, r2
        jne LoopFlagColuna0

    loadn r0, #Bonus
    loadn r1, #10000
    storei r0, r1

    pop r3
    pop r2
    pop r1
    pop r0
    rts

;--------------------------------------------
;                   Placar
;--------------------------------------------
Placar:
    push r0
    push r7

    load r0, Bonus
    loadn r7, #74
    call ImprimeNumero

    load r0, Pontuacao
    loadn r7, #41
    call ImprimeNumero

    pop r7
    pop r0
    rts
;--------------------------------------------
;                   Placar
;--------------------------------------------
ImprimeNumero:
    ;r0 = valor que vai ser imprimido
    ;r7 = inicio da posição
    push r1
    push r2
    push r3
    push r4
    push r5
    push r6

    ;dezena de milhar
    loadn r1, #10000
    div r2, r0, r1          ;r2 = dezena de milhar
    mul r3, r2, r1
    sub r0, r0, r3          ;r0 = resto

    ;milhar
    loadn r1, #1000
    div r3, r0, r1          ;r3 = milhar
    mul r4, r3, r1
    sub r0, r0, r4          ;r0 = resto

    ;centena
    loadn r1, #100
    div r4, r0, r1          ;r4 = centena
    mul r5, r4, r1
    sub r0, r0, r5          ;r0 = resto

    ;dezena
    loadn r1, #10
    div r5, r0, r1          ;r5 = dezena
    mul r6, r5, r1
    sub r0, r0, r6          ;r0 = unidade

    ;converte o número para tabela ascii
    loadn r6, #'0'
    add r2, r2, r6          ;dezenha de milhar
    add r3, r3, r6          ;milhar
    add r4, r4, r6          ;centena
    add r5, r5, r6          ;dezena
    add r0, r0, r6          ;unidade

    ;imprime na tela
    outchar r2, r7
    inc r7
    outchar r3, r7
    inc r7
    outchar r4, r7
    inc r7
    outchar r5, r7
    inc r7
    outchar r0, r7
    
    pop r6
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    rts
;--------------------------------------------
;               MoveSimoes
;--------------------------------------------	
MoveSimoes:
    push r0
    push r1
    push r2

    load r0, posAntSimoes
    loadn r2, #135                      ;linha 3 coluna 15
    cmp r0, r2
    ceq Venceu

    call Suicidou

	call MoveSimoes_RecalculaPos		;Recalcula Posicao do Simoes

    ;Só apaga e Redesenha se (pos != posAnt), para não ficar piscando o Simões
	load r0, posSimoes
	load r1, posAntSimoes
	cmp r0, r1
	jeq RtsMoveSimoes
	
	;Se Próxima instrucao do Simoes for o chao ou parede, não move
	call ApagaSimoes
	call DesenhaSimoes	

    RtsMoveSimoes:
	
        pop r2
        pop r1
        pop r0
        rts

MoveSimoes_RecalculaPos:
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5
    push r6
    push r7

    load r0, posSimoes

    inchar r1 ;lê o teclado

    ;Switch - Case

    ;Case 1
    loadn r2, #'a'
    cmp r1, r2
    jeq MoveSimoes_RecalculaPos_A

    ;Case 2
    loadn r2, #'d'
    cmp r1, r2
    jeq MoveSimoes_RecalculaPos_D

    ;Case 3
    loadn r2, #'w'
    cmp r1, r2
    jeq MoveSimoes_RecalculaPos_W

    ;Case 4
    loadn r2, #'s'
    cmp r1, r2
    jeq MoveSimoes_RecalculaPos_S

    ;Case 5
    loadn r2, #32
    cmp r1, r2
    ;ceq Morreu

    StoreposSimoes:
        store posSimoes, r0

    RtsMoveSimoes_RecalculaPos:
        pop r7
        pop r6
        pop r5
        pop r4
        pop r3
        pop r2
        pop r1
        pop r0
        rts

    ;Move para a esquerda 
    MoveSimoes_RecalculaPos_A:
        inchar r1
        loadn r2, #32
        cmp r2, r1
        jeq Morreu

        ;Verifica se está na parede
        loadn r1, #40
        loadn r2, #0
        mod r1, r0, r1      ;coluna posSimoes atual
        cmp r1, r2          ;Se ele já tiver na coluna 0, não tem mais o que andar
        jeq RtsMoveSimoes_RecalculaPos  

        ;Verifica qual o próximo caracter
        loadn r1, #40
        mod r2, r0, r1     ; r2 = coluna atual
        dec r2             ; r2 = coluna da direita
        div r3, r0, r1     ; r3 = linha atual

        ; calcula deslocamento: linha * 41 + coluna
        loadn r4, #41
        mul r3, r3, r4     ; r3 = linha * 41
        add r3, r3, r2     ; r3 = deslocamento total (linha*41 + coluna)

        loadn r4, #tela0Linha0
        add r3, r4, r3     ; r3 = endereço final

        loadi r6, r3       ; lê caractere da tela

        ; Caso 1: é chão
        loadn r7, #255
        and r6, r6, r7
        loadn r5, #'='
        cmp r6, r5
        jeq RtsMoveSimoes_RecalculaPos

        ; Caso 2: se embaixo for espaço, morre
        loadn r5, #41
        add r4, r3, r5
        loadi r6, r4
        loadn r7, #255
        and r6, r6, r7
        loadn r5, #'='
        cmp r6, r5
        jeq PodeandarA

        loadn r5, #'-'
        cmp r6, r5
        jeq PodeandarA

        call Morreu

        PodeandarA:
            dec r0
            jmp StoreposSimoes
    ;Move para direita
    MoveSimoes_RecalculaPos_D:
        ;Verifica se está na parede
        loadn r1, #40
        loadn r2, #39
        mod r1, r0, r1      ;coluna posSimoes atual
        cmp r1, r2          ;Se ele já tiver na coluna 0, não tem mais o que andar
        jeq RtsMoveSimoes_RecalculaPos  

        ;Verifica qual o próximo caracter
        loadn r1, #40
        mod r2, r0, r1     ; r2 = coluna atual
        inc r2             ; r2 = coluna da direita
        div r3, r0, r1     ; r3 = linha atual

        ; calcula deslocamento: linha * 41 + coluna
        loadn r4, #41
        mul r3, r3, r4     ; r3 = linha * 41
        add r3, r3, r2     ; r3 = deslocamento total (linha*41 + coluna)

        loadn r4, #tela0Linha0
        add r3, r4, r3     ; r3 = endereço final

        loadi r6, r3       ; lê caractere da tela

        ; Caso 1: é chão
        loadn r7, #255
        and r6, r6, r7
        loadn r5, #'='
        cmp r6, r5
        jeq RtsMoveSimoes_RecalculaPos

        ; Caso 2: se embaixo for espaço, morre
        loadn r5, #41
        add r4, r3, r5
        loadi r6, r4
        loadn r7, #255
        and r6, r6, r7
        loadn r5, #'='
        cmp r6, r5
        jeq PodeandarD

        loadn r5, #'-'
        cmp r6, r5
        jeq PodeandarD

        call Morreu

        PodeandarD:
            inc r0
            jmp StoreposSimoes

    ;Move para cima
    MoveSimoes_RecalculaPos_W:
        ;Verifica qual o próximo caracter
            loadn r1, #40
            mod r2, r0, r1     ; r2 = coluna atual
            inc r2             ; r2 = coluna da direita
            div r3, r0, r1     ; r3 = linha atual

            ; calcula deslocamento: linha * 41 + coluna
            loadn r4, #41
            mul r3, r3, r4     ; r3 = linha * 41
            add r3, r3, r2     ; r3 = deslocamento total (linha*41 + coluna)
            loadn r4, #tela0Linha0
            add r3, r4, r3     ; r3 = endereço final
            loadi r6, r3       ; lê caractere da tela com a cor

            loadn r7, #255     
            and r6, r7, r6     ;lê o caractere sem a cor


            loadn r5, #'-'
            cmp r6, r5 
            jne EChaoSubir ;se for vazio, não pode subir

            loadn r4, #2
            sub r3, r3, r4
            loadi r6, r3
            and r6, r6, r7
            cmp r6, r5
            jne RtsMoveSimoes_RecalculaPos 

            jmp PodeSubir

            EChaoSubir:
                loadn r5, #'='
                cmp r6, r5
                jne RtsMoveSimoes_RecalculaPos

                loadn r4, #2
                sub r3, r3, r4
                loadi r6, r3
                and r6, r6, r7
                cmp r6, r5
                jne RtsMoveSimoes_RecalculaPos          

        PodeSubir:
            loadn r2, #40
            sub r0, r0, r2 ;sobe 1 linha
            jmp StoreposSimoes

    MoveSimoes_RecalculaPos_S:
        ;Verifica qual o próximo caracter
            loadn r1, #40
            mod r2, r0, r1     ; r2 = coluna atual
            inc r2             ; r2 = coluna da direita
            div r3, r0, r1     ; r3 = linha atual

            ; calcula deslocamento: linha * 41 + coluna
            loadn r4, #41
            mul r3, r3, r4     ; r3 = linha * 41
            add r3, r3, r2     ; r3 = deslocamento total (linha*41 + coluna)
            loadn r4, #tela0Linha0
            add r3, r4, r3     ; r3 = endereço final do simoes a direita
            loadi r6, r3       ; lê caractere da direita com a cor

            loadn r7, #255     
            and r6, r7, r6     ;lê o caractere direita sem a cor

            ;Vê se tem escada a direita
            loadn r5, #'-'
            cmp r6, r5 
            jne EChaoDescer ;Se não tiver, vê se tem o caracter do chão

            ;Vê se tem escada a esquerda
            loadn r4, #2
            sub r2, r3, r4  ;r2 = endereço do simoes a esquerda
            loadi r6, r2    ;lê o caractere da esquerda com cor
            and r6, r6, r7  ;caractere da esquerda sem cor
            cmp r6, r5
            jne RtsMoveSimoes_RecalculaPos

            ;Verifica se é chão embaixo -> só desce se for vazio
            loadn r4, #40
            add r4, r3, r4  ;r4 = endereço do simoes embaixo
            loadi r6, r4    ;lê o caractere embaixo com cor
            and r6, r6, r7  ;lê o caracter embaixo sem cor
            loadn r5, #'='
            cmp r6, r5
            jeq RtsMoveSimoes_RecalculaPos 

            jmp PodeDescer

            EChaoDescer:
                ;Verifica se é chão a direita
                loadn r5, #'='
                cmp r6, r5
                jne EEscada

                ;Verifica se é chão a esquerda
                loadn r4, #2
                sub r4, r3, r4
                loadi r6, r4
                and r6, r6, r7
                cmp r6, r5
                jne RtsMoveSimoes_RecalculaPos

                jmp PodeDescer

            EEscada:
                loadn r4, #82
                add r4, r3, r4
                loadi r6, r4
                and r6, r6, r7
                loadn r5, #'-'
                cmp r6, r5
                jne RtsMoveSimoes_RecalculaPos

                loadn r4, #80
                add r4, r3, r4
                loadi r6, r4
                and r6, r6, r7
                loadn r5, #'-'
                cmp r6, r5
                jne RtsMoveSimoes_RecalculaPos            

        PodeDescer:
            loadn r2, #40
            add r0, r0, r2 ;sobe 1 linha
            jmp StoreposSimoes

;--------------------------------------------
;                 Venceu
;--------------------------------------------
Venceu:
    push r0
    push r1
    push r2
    push r3

    call ApagaTela          ;Apago o cenário do jogo

    loadn r1, #tela5Linha0	;Imprimo a tela do vencedor
	loadn r2, #30720 		;cor roxa
	call ImprimeTela

	loadn r2, #0            ;inicializa o contador com 0 

    loadn r0, #'s'
    loadn r3, #'n'

    LoopVenceu:
        inchar r1           ;lê o teclado
        inc r2              ;contador++ 
        
        cmp r1, r3          ;compara se a pessoa digitou 'n'
        jeq fim

        cmp r1, r0          ;compara se a pessoa digitou 's'
        jeq Sim

        jmp LoopVenceu      ;se ela não digitou nada ou digitou algo 'não permitido', volta para o loop

    Sim:
        ;gera o randômico sempre para o Tubarao 0 -> mais rápido
		loadn r5, #6        ;tamanho da tabela de randômicos
		mod r3, r2, r5      ;deixo o valor entre 0 e 5

		loadn r0, #IncRandTubarao   ;endereço do índice do Tubarao[0]
		storei r0, r3               ;guardo o valor aleatório entre 0 e 5, no índice do Tubarao 0

        pop r3
        pop r2
        pop r1
        pop r0

        pop r0 ;desempilha tudo, não vai ter o rts, vai direto no main

        jmp Restart

;--------------------------------------------
;                 Suicidou
;--------------------------------------------
Suicidou:
    push r0
    push r1
    push r2
    push r3
    push r4

    load r0, posAntSimoes
    loadn r1, #0                ;contador
    loadn r2, #10               ;limite do contador
    loadn r3, #posAntTubarao    ;endereço da posAntTubarao[0]
    LoopConfere:
        add r3, r3, r1          ;endereço do posAntTubarao[contador] (podia fazer só o inc r3 também)
        loadi r4, r3            ;para ver qual a posAntTubarao[contador]

        cmp r4, r0              ;compara posAntTubarao x posAntSimoes
        jeq Suicidio

        inc r1

        cmp r1, r2              ;vê se já checou todos os tubarões
        jne LoopConfere 

    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    rts

    Suicidio:
        call ApagaTela

        loadn r1, #telaFinalPLinha0    ;endereco onde comeca a primeira linha do cenario
        loadn r2, #30720  			   ;cor roxa
        call ImprimeTela

        loadn r2, #0                   ;inicializa o contador com 0 

        loadn r0, #'s'
        loadn r3, #'n'

        LoopSuicidio:
            inchar r1                  ;lê o que a pessoa escreveu
        
            inc r2                     ;contador++
        
            cmp r1, r3      ;se ele digitou 'n'
            jeq fim

            cmp r1, r0      ;se ele digitou 's'
            jeq SimS

            jmp LoopSuicidio           ;se ele não digitou/digitou outra coisa

        SimS:
            ;gera o randômico sempre para o Tubarao 0 -> mais rápido
            loadn r5, #40       ;tamanho da tabela de randômicos
            mod r3, r2, r5      ;deixo o valor entre 0 e 39

            loadn r0, #IncRandTubarao   ;endereço do índice do Tubarao[0]
            storei r0, r3               ;guardo o valor aleatório entre 0 e 5, no índice do Tubarao 0

            pop r3
            pop r2
            pop r1
            pop r0

            pop r0 ;desempilha tudo, não vai ter o rts, vai direto no main

            jmp Restart

;--------------------------------------------
;            Desenha e Apaga Simoes 
;--------------------------------------------
DesenhaSimoes:
    push r0
    push r1
    push r2

    load r0, posSimoes
    loadn r2, #1024             ;cor rosa -> Simões
    loadn r1, ':'               ;caractere do Simões
    add r1, r1, r2              ;Simões + cor 

    outchar r1, r0

    store posAntSimoes, r0 ;Se o Simoes anda, a posAntSimoes é atualizada quando é desenhado

    pop r2
    pop r1
    pop r0
    rts

ApagaSimoes:
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5

    load r0, posAntSimoes

	loadn r1, #tela0Linha0	    ;Endereço do cenário tela1 + tela2
	add r2, r1, r0	            ;r2 = endereço tela0Linha0 + posAntSimoes

	loadn r4, #40
	div r3, r0, r4	            ;r3 = linha posAntSimoes
	add r2, r2, r3	            ;r2 = endereço tela0Linha0 + posAntSimoes + posAnt/40
	
	loadi r5, r2	            ;vê o que tinha no cenário

    outchar r5, r0              ;desenha o que tinha antes -> sem o Simoes

    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    rts

;-------------------------------------------
;                 MoveTubarao
;-------------------------------------------
MoveTubarao:

    call PosicaoInicialTubarao
    call CairTubarao

    rts

PosicaoInicialTubarao:
    push r0
    push r1
    push r2
    push r3
    push r4

    load r0, parametroTubarao       ;vê qual Tubarao que está caindo [0 a 9]
    loadn r3, #FlagCaindo           ;r3 = endereço da FlagCaindo[0]
    add r3, r3, r0                  ;r3 = endereço da FlagCaindo[parametroTubarao]
    loadi r2, r3                    ;r2 = valor da FlagCaindo[parametroTubarao] 
        
    loadn r4, #0
    cmp r2, r4                      ;Cmp se FlagTubarao == 0, se sim, ele tem que cair
    jeq VaiCair

    jmp RtsPosicaoInicialTubarao

    VaiCair:

        call AcharIncRandTubarao 
        
        load r0, parametroTubarao
        loadn r3, #IncRandTubarao
        add r3, r3, r0
        loadi r1, r3               ;r1 = IncRandTubarao[parametroTubarao]
        
        loadn r4, #RandTubarao     ;r4 = endereço base da tabela
        add r4, r4, r1             ;r4 = endereço de RandTubarao[IncRandTubarao[parametroTubarao]]
        loadi r2, r4               ;r2 = RandTubarao[IncRandTubarao[parametroTubarao]] (posição inicial)
        
        loadn r4, #posTubarao
        add r4, r4, r0             ;r4 = endereço posTubarao[parametroTubarao]
        storei r4, r2              ;guarda a posição inicial no endereço posTubarao[parametroTubarao] 

        loadn r4, #FlagCaindo
        add r4, r4, r0             ;endereço da FlagCaindo[parametroTubarao]
        loadn r0, #1
        storei r4, r0              ;FlagCaindo[parametroTubarao] == 1 porque o Tubarao já começou a cair
        
        inc r1                     ;aumenta o índice IncRandTubarao[parametroTubarao] (ex: 0 para 1)

        loadn r0, #40
        cmp r1, r0                 ;Compara se o índice já chegou no fim da tabela
        jne StoreIncTubarao

        ;ZeraIndice:
        loadn r1, #0

        StoreIncTubarao:
            storei r3, r1          ;Ele armazena o novo índice no r3 -> endereço IncRandTubarao[parametroTubarao]

        RtsPosicaoInicialTubarao:
            pop r4
            pop r3
            pop r2
            pop r1
            pop r0
            rts          

CairTubarao:
    push r0
    push r1
    push r2
    push r3
    push r4

    loadn r0, #0
    loadn r3, #posTubarao
    load r4, parametroTubarao
    add r3, r3, r4          ;r3 == ENDEREÇO posTubarao [parametroTubarao] -> não vou mexer mais no r3!! 
    loadi r2, r3            ;r2 == posTubarao[parametroTubarao]

    ;tem que apagar primeiro, pois eu atualizo a posAntTubarao no desenhaTubarao, ou seja, ele ia desenhar e apagar logo em seguida
    call ApagaTubarao

    loadn r1, #40
    add r0, r2, r1          ;Tubarao desce uma linha

    ;Comparação se chegou no chão:
        div r4, r0, r1
        loadn r1, #29
        cmp r4, r1
        jeq Nochao

    call DesenhaTubarao
    storei r3, r0           ;posTubarao[parametroTubarao] == r0 já na próxima linha

    ;Vejo se colidiu com o mário:
        load r0, posAntSimoes
        cmp r0, r2
        ceq Morreu
    
    jmp RtsCairTubarao

    Nochao:
        loadn r0, #0
        load r1, parametroTubarao
        loadn r3, #FlagCaindo      ;r3 = endereço da FlagCaindo[0]
        add r3, r3, r1             ;r3 = endereço da FlagCaindo[parametroTubarao]
        storei r3, r0              ;zera a FlagCaindo[parametroTubarao]

        call ZerarFlag             ;zera a FlagColuna

    RtsCairTubarao:
        pop r4
        pop r3
        pop r2
        pop r1
        pop r0
        rts

AcharIncRandTubarao:
    push r0
    push r1
    push r2
    push r3
    push r4

    load r1, parametroTubarao        ;para saber qual Tubarao vai cair
    loadn r0, #IncRandTubarao        ;Endereço do vetor dos índices
    add r0, r0, r1                   ;r0 == Endereço IncRandTubarao[parametroTubarao]
    loadi r2, r0                     ;r2 == IncRandTubarao[parametroTubarao]

    LoopFlags: ;Até achar a flag livre
        loadn r1, #FlagColuna
        add r1, r1, r2               ;endereço da FlagColuna[r2]
        loadi r3, r1                 ;valor da flag (0 ou 1)

        loadn r4, #0
        cmp r3, r4
        jeq RtsAcharIncRandTubarao   ;se a flag está desligada, rts

        inc r2                       ;incrementa o índice do Tubarao

        ;vê se precisa zerar o índice:
            loadn r1, #40
            cmp r1, r2
            jne LoopFlags            ;39 é o fim da tabela, se chegou no 40, precisa zerar

        ;zera o índice:
            loadn r2, #0
            jmp LoopFlags

    RtsAcharIncRandTubarao:
        storei r0, r2 ;r0 tem o endereço do IncRandTubarao[parametroTubarao]

        call LigarFlag ;Assim que eu acho qual coluna ele vai cair, pode ligar a FlagColuna

        pop r4
        pop r3
        pop r2
        pop r1
        pop r0
        rts

LigarFlag:
    push r0
    push r1
    push r2

    loadn r0, #IncRandTubarao
    load r1, parametroTubarao
    add r0, r0, r1
    loadi r2, r0        ;valor do índice(0 a 39) do IncRandTubarao[parametroTubarao]

    loadn r1, #FlagColuna
    add r1, r1, r2      ;Endereço FlagColuna[IncRandTubarao[parametroTubarao]]

    loadn r0, #1
    storei r1, r0       ;Flag Ligada!

    pop r2
    pop r1
    pop r0
    rts

ZerarFlag:
    push r0
    push r1
    push r2
    push r3
    
    loadn r0, #IncRandTubarao
    load r1, parametroTubarao
    add r0, r0, r1
    loadi r2, r0        ;valor do índice do IncRandTubarao[parametroTubarao]

    ;como IncRandTubarao sempre aponta já para a próxima coluna
    ;confere primeiro, se é zero, caso não seja: r2--
    loadn r3, #0
    cmp r2, r3
    jne SubIncRandTubarao

    loadn r2, #39       ;como os índices são ciclicos, antes de 0 é 39

    jmp DesligaFlag

    SubIncRandTubarao:
        dec r2

    DesligaFlag:
        loadn r1, #FlagColuna
        add r1, r1, r2  ;endereço FlagColuna[IncRandTubarao[parametroTubarao]]

        loadn r0, #0
        storei r1, r0   ;Flag Desligada!

        pop r3
        pop r2
        pop r1
        pop r0
        rts

;--------------------------------------------
;                 Morreu
;--------------------------------------------
Morreu:
    push r0
    push r1
    push r2
    push r3

    call ApagaTela

    loadn r1, #telaFinalPLinha0	    ;endereco onde comeca a primeira linha do cenario
	loadn r2, #30720  			    ;cor roxa
	call ImprimeTela

	loadn r2, #0                    ;inicializa o contador com 0 

    loadn r0, #'s'
    loadn r3, #'n'

    LoopMorreu:
        inchar r1                   ;lê o que a pessoa escreveu
    
        inc r2                      ;contador++
    
        cmp r1, r3                  ;se ele digitou 'n'
        jeq fim

        cmp r1, r0                  ;se ele digitou 's'
        jeq SimM

        jmp LoopMorreu              ;se ele não digitou/digitou outra coisa

    SimM:
        ;gera o randômico sempre para o Tubarao 0 -> mais rápido
		loadn r5, #40               ;tamanho da tabela de randômicos
		mod r3, r2, r5              ;deixo o valor entre 0 e 39

		loadn r0, #IncRandTubarao   ;endereço do índice do Tubarao[0]
		storei r0, r3               ;guardo o valor aleatório entre 0 e 5, no índice do Tubarao 0

        pop r3
        pop r2
        pop r1
        pop r0

        pop r0                      ;desempilha tudo, não vai ter o rts, vai direto no main

        jmp Restart

;-------------------------------------------
;          Desenha e Apaga Tubarao
;-------------------------------------------
DesenhaTubarao:
    push r0
    push r1
    push r2
    push r3
    push r4

    loadn r0, #posTubarao
    load r1, parametroTubarao
    add r0, r1, r0          ;r0 = endereço do posTubarao[parametroTubarao]
    loadi r2, r0            ;r2 = valor do posTubarao[parametroTubarao]

    loadn r3, #'t'
    loadn r4, #131072     ;Cor cinza -> tubarão
    add r3, r3, r4
    outchar r3, r2

    ;Atualiza o posAntTubarao
    loadn r0, #posAntTubarao
    add r0, r0, r1          ;endereço posAntTubarao[parametroTubarao]
    storei r0, r2           ;guardo o valor do posTubarao[parametroTubarao] no endereço do posAntTubarao[parametroTubarao]
    
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    rts

ApagaTubarao:
    push r0
    push r1
    push r2
    push r3
    push r4
    push r5
    push r6
    push r7

    loadn r0, #posAntTubarao
    load r1, parametroTubarao
    add r0, r1, r0
    loadi r2, r0            ;r2 = posAntTubarao[parametroTubarao]
    load r6, posAntSimoes

	loadn r1, #tela0Linha0	;endereço do cenário (tela1 + tela2)
	add r0, r1, r2	        ;r2 = tela0Linha0 + posAntTubarao
	loadn r4, #40
	div r3, r2, r4	        ;r3 = linha do posAntTubarao
	add r0, r0, r3	        ;r0 = endereço tela0Linha0 + posAntTubarao + linha do posAntTubarao
	
	loadi r5, r0	        ;vê o que tinha nesse endereço

    cmp r6, r2              ;compara se o simões estava antes, para não apagar ele
    jne ApagaTubarao_Skip
        loadn r7, #1024     ;cor rosa
        loadn r5, #':'
        add r5, r7, r5      ;simões fica rosa

    ApagaTubarao_Skip:
    outchar r5, r2         ;redesenha o que tinha antes -> sem o Tubarao

    pop r7
    pop r6
    pop r5
    pop r4
    pop r3
    pop r2
    pop r1
    pop r0
    rts
;--------------------------------------------
;                 Delay 
;--------------------------------------------		
Delay:
    push r0
    push r1

    loadn r1, #15

    DelayVolta2:
        loadn r0, #1000

    DelayVolta1:
        dec r0
        jnz DelayVolta1
        dec r1
        jnz DelayVolta2

        pop r1
        pop r0
        rts

;--------------------------------------------
;             Imprime Tela
;--------------------------------------------
ImprimeTela:
	;r1 = endereco onde comeca a primeira linha do Cenario
	;r2 = cor do Cenario para ser impresso

	push r0	
	push r1	
	push r2	
	push r3	
	push r4
	push r5

	loadn R0, #0  	; posicao inicial tem que ser o comeco da tela!
	loadn R3, #40  	; Incremento da posicao da tela!
	loadn R4, #41  	; incremento do ponteiro das linhas da tela
	loadn R5, #1200 ; Limite da tela!
	
   ImprimeTela_Loop:
		call ImprimeStr
		add r0, r0, r3  	; incrementaposicao para a segunda linha na tela -->  r0 = R0 + 40
		add r1, r1, r4  	; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 porcausa do /0 !!) --> r1 = r1 + 41
		cmp r0, r5			; Compara r0 com 1200
		jne ImprimeTela_Loop	; Enquanto r0 < 1200

	pop r5	
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
				
;--------------------------------------------
;             Imprime String 
;--------------------------------------------
ImprimeStr:	 
    ;r0 = Posicao da tela que o primeiro caractere da mensagem será impresso 
    ;r1 = endereco onde comeca a mensagem
    ;r2 = cor da mensagem

	push r0	
	push r1	
	push r2	
	push r3	
	push r4
	
	loadn r3, #'\0'	; Criterio de parada

   ImprimeStr_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr_Sai
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		jmp ImprimeStr_Loop
	
   ImprimeStr_Sai:	
	pop r4	
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
;--------------------------------------------
;               Imprime Tela 2
;--------------------------------------------
ImprimeTela2:
	;r1 = endereco onde comeca a primeira linha do Cenario
	;r2 = cor do Cenario para ser impresso

	push r0	
	push r1	
	push r2	
	push r3	
	push r4
	push r5	
	push r6	

	loadn r0, #0  	        ;posicao inicial tem que ser o comeco da tela
	loadn r3, #40  	        ;incremento da posicao da tela
	loadn r4, #41  	        ;incremento do ponteiro das linhas da tela
	loadn r5, #1200         ;limite da tela
	loadn r6, #tela0Linha0	;endereco onde comeca a primeira linha do cenario
	
   ImprimeTela2_Loop:
		call ImprimeStr2
		add r0, r0, r3  	;incrementa posicao para a segunda linha na tela (r0 = r0 + 40)
		add r1, r1, r4  	;incrementa o ponteiro para o comeco da proxima linha na memoria (40 + '/0') (r1 = r1 + 41)
		add r6, r6, r4  	;incrementa o ponteiro para o comeco da proxima linha na memoria (40 + '/0') (r1 = r1 + 41)
		cmp r0, r5			;compara r0 com 1200
		jne ImprimeTela2_Loop	

	pop r6	
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
				
;--------------------------------------------
;             Imprime String 2
;--------------------------------------------
ImprimeStr2: 
    ;r0 = Posicao da tela que o primeiro caractere da mensagem será impresso  
    ;r1 = endereco onde comeca a mensagem
    ;r2 = cor da mensagem. 
	
    push r0	
	push r1	
	push r2	
	push r3	
	push r4
	push r5	; protege o r5 na pilha para ser usado na subrotina
	push r6	; protege o r6 na pilha para ser usado na subrotina
	
	
	loadn r3, #'\0'	; Criterio de parada
	loadn r5, #' '	; Espaco em Branco

   ImprimeStr2_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr2_Sai
		cmp r4, r5		; If (Char == ' ')  vai Pula outchar do espaco para na apagar outros caracteres
		jeq ImprimeStr2_Skip
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
   		storei r6, r4
        
   ImprimeStr2_Skip:
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		inc r6
		jmp ImprimeStr2_Loop
	
   ImprimeStr2_Sai:	
	pop r6	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
;--------------------------------------------
;                 Apaga Tela
;--------------------------------------------
ApagaTela:
	push r0
	push r1
	
	loadn r0, #1200		; apaga as 1200 posicoes da Tela
	loadn r1, #' '		; com "espaco"
	
	   ApagaTela_Loop:	;;label for(r0=1200;r3>0;r3--)
		dec r0
		outchar r1, r0
		jnz ApagaTela_Loop
 
	pop r1
	pop r0
	rts	
	
;--------------------------------------------
;                   TELAS
;--------------------------------------------
;Endereço das telas desenhadas (STR2 - 1+2)
tela0Linha0  : string "                                        "
tela0Linha1  : string "                                        "
tela0Linha2  : string "                                        "
tela0Linha3  : string "                                        "
tela0Linha4  : string "                                        "
tela0Linha5  : string "                                        "
tela0Linha6  : string "                                        "
tela0Linha7  : string "                                        "
tela0Linha8  : string "                                        "
tela0Linha9  : string "                                        "
tela0Linha10 : string "                                        "
tela0Linha11 : string "                                        "
tela0Linha12 : string "                                        "
tela0Linha13 : string "                                        "
tela0Linha14 : string "                                        "
tela0Linha15 : string "                                        "
tela0Linha16 : string "                                        "
tela0Linha17 : string "                                        "
tela0Linha18 : string "                                        "
tela0Linha19 : string "                                        "
tela0Linha20 : string "                                        "
tela0Linha21 : string "                                        "
tela0Linha22 : string "                                        "
tela0Linha23 : string "                                        "
tela0Linha24 : string "                                        "
tela0Linha25 : string "                                        "
tela0Linha26 : string "                                        "
tela0Linha27 : string "                                        "
tela0Linha28 : string "                                        "
tela0Linha29 : string "                                        "	

;Tela 01: Chão
tela1Linha0  : string "                                        "
tela1Linha1  : string "                                        "
tela1Linha2  : string "                                        "
tela1Linha3  : string "              ()                        "
tela1Linha4  : string "        ==================              "
tela1Linha5  : string "                                        "
tela1Linha6  : string "                                        "
tela1Linha7  : string "   ==================================   "
tela1Linha8  : string "                                        "
tela1Linha9  : string "                                        "
tela1Linha10 : string "   ==================================   "
tela1Linha11 : string "                                        "
tela1Linha12 : string "                                        "
tela1Linha13 : string "   ==================================   "
tela1Linha14 : string "                                        "
tela1Linha15 : string "                                        "
tela1Linha16 : string "   ==================================   "
tela1Linha17 : string "                                        "
tela1Linha18 : string "                                        "
tela1Linha19 : string "   ==================================   "
tela1Linha20 : string "                                        "
tela1Linha21 : string "                                        "
tela1Linha22 : string "   ==================================   "
tela1Linha23 : string "                                        "
tela1Linha24 : string "                                        "
tela1Linha25 : string "   ==================================   "
tela1Linha26 : string "                                        "
tela1Linha27 : string "                                        "
tela1Linha28 : string "========================================"
tela1Linha29 : string "                                        "

;Tela 02: Escadas
tela2Linha0  : string "                                        "
tela2Linha1  : string "                                        "
tela2Linha2  : string "                                        "
tela2Linha3  : string "                                        "
tela2Linha4  : string "                                        "
tela2Linha5  : string "          - -                           "
tela2Linha6  : string "          - -                           "
tela2Linha7  : string "                                        "
tela2Linha8  : string "                          - -           "
tela2Linha9  : string "                          - -           "
tela2Linha10 : string "                                        "
tela2Linha11 : string "      - -                               "
tela2Linha12 : string "      - -                               "
tela2Linha13 : string "                                        "
tela2Linha14 : string "                                  - -   "
tela2Linha15 : string "                                  - -   "
tela2Linha16 : string "                                        "
tela2Linha17 : string "                      - -               "
tela2Linha18 : string "                      - -               "
tela2Linha19 : string "                                        "
tela2Linha20 : string "     - -                                "
tela2Linha21 : string "     - -                                "
tela2Linha22 : string "                                        "
tela2Linha23 : string "                              - -       "
tela2Linha24 : string "                              - -       "
tela2Linha25 : string "                                        "
tela2Linha26 : string "   - -                                  "
tela2Linha27 : string "   - -                                  "
tela2Linha28 : string "                                        "
tela2Linha29 : string "                                        "

;Tela menu:
tela4Linha0 : string "                                        "
tela4Linha1 : string "                                        "
tela4Linha2 : string "                                        "
tela4Linha3 : string "                                        "
tela4Linha4 : string "      PRESSIONE ENTER PARA INICIAR      "
tela4Linha5 : string "      E RECUPERAR O BARCO DO SIMOES     "
tela4Linha6 : string "                                        "
tela4Linha7 : string "                                        "
tela4Linha8 : string "                   l                    "
tela4Linha9 : string "                   |l                   "
tela4Linha10 : string "                   | l                  "
tela4Linha11 : string "                  y|  l                 "
tela4Linha12 : string "                 y||   l                "
tela4Linha13 : string "                y ||    l               "
tela4Linha14 : string "               y  ||     l              "
tela4Linha15 : string "              y   ||      l             "
tela4Linha16 : string "             y    ||       l            "
tela4Linha17 : string "            y     ||        l           "
tela4Linha18 : string "           y      ||         l          "
tela4Linha19 : string "          y_______||          l         "
tela4Linha20 : string "                  ||___________l        "
tela4Linha21 : string "                  ||                    "
tela4Linha22 : string "         _________||____________        "
tela4Linha23 : string "         l                     y        "
tela4Linha24 : string "          l       SIMOES      y         "
tela4Linha25 : string "           l_________________y          "
tela4Linha26 : string "                                        "
tela4Linha27 : string "                                        "
tela4Linha28 : string "                                        "
tela4Linha29 : string "                                        "


;Tela Venceu:
tela5Linha0 : string "                                        "
tela5Linha1 : string "                                        "
tela5Linha2 : string "               VOCE VENCEU              "
tela5Linha3 : string "                                        "
tela5Linha4 : string "        AGORA ESTA PRONTO PARA O        "
tela5Linha5 : string "              ATAQUE ZUMBI              "
tela5Linha6 : string "                                        "
tela5Linha7 : string "                   l                    "
tela5Linha8 : string "                   |l                   "
tela5Linha9 : string "                   | l                  "
tela5Linha10 : string "                  y|  l                 "
tela5Linha11 : string "                 y||   l                "
tela5Linha12 : string "                y ||    l               "
tela5Linha13 : string "               y  ||     l              "
tela5Linha14 : string "              y   ||      l             "
tela5Linha15 : string "             y    ||       l            "
tela5Linha16 : string "            y  S  ||        l           "
tela5Linha17 : string "           y      ||         l          "
tela5Linha18 : string "          y_______||    O     l         "
tela5Linha19 : string "           y l    ||__ y|l ____l        "
tela5Linha20 : string "          | S |   ||    |               "
tela5Linha21 : string "         __l_y____||___y_l______        "
tela5Linha22 : string "         l                     y        "
tela5Linha23 : string "          l       SIMOES      y         "
tela5Linha24 : string "           l_________________y          "
tela5Linha25 : string "                                        "
tela5Linha26 : string "                                        "
tela5Linha27 : string "   GOSTARIA DE JOGAR NOVAMENTE? <s/n>   "
tela5Linha28 : string "                                        "
tela5Linha29 : string "                                        "

;Tela Perdeu
telaFinalPLinha0  : string "                                        "
telaFinalPLinha1  : string "                                        "
telaFinalPLinha2  : string "                                        "
telaFinalPLinha3  : string "         O TUBARAO TE PEGOU EM          "
telaFinalPLinha4  : string "                                        "
telaFinalPLinha5  : string "                                        "
telaFinalPLinha6  : string "               GAME OVER                "
telaFinalPLinha7  : string "                                        "
telaFinalPLinha8  : string "      QUER TENTAR NOVAMENTE? <s/n>      "
telaFinalPLinha9  : string "                                        "
telaFinalPLinha10 : string "                                        "
telaFinalPLinha11 : string "                                        "
telaFinalPLinha12 : string "                                        "
telaFinalPLinha13 : string "                                        "
telaFinalPLinha14 : string "        ____                            "
telaFinalPLinha15 : string "       yx  xl       _____               "
telaFinalPLinha16 : string "       l __ y      y    y               "
telaFinalPLinha17 : string "        l__y      y     l               "
telaFinalPLinha18 : string "         y|l      |      y              "
telaFinalPLinha19 : string "        y | l     |      l              "
telaFinalPLinha20 : string "       y  |  l    |       |             "
telaFinalPLinha21 : string "          |       |       |             "
telaFinalPLinha22 : string "         y l      |       |             "
telaFinalPLinha23 : string "        y   l     |       |             "
telaFinalPLinha24 : string "       y     l     l______y             "
telaFinalPLinha25 : string "                                        "
telaFinalPLinha26 : string "                                        "
telaFinalPLinha27 : string "                                        "
telaFinalPLinha28 : string "                                        "
telaFinalPLinha29 : string "                                        "

;Tela Final:
tela6Linha0 : string "                                        "
tela6Linha1 : string "                                        "
tela6Linha2 : string "                                        "
tela6Linha3 : string "        OBRIGADO POR TER JOGADO!        "
tela6Linha4 : string "                                        "
tela6Linha5 : string "                                        "
tela6Linha6 : string "                                        "
tela6Linha7 : string "                   l                    "
tela6Linha8 : string "                   |l                   "
tela6Linha9 : string "                   | l                  "
tela6Linha10 : string "                  y|  l                 "
tela6Linha11 : string "                 y||   l                "
tela6Linha12 : string "                y ||    l               "
tela6Linha13 : string "               y  ||     l              "
tela6Linha14 : string "              y   ||      l             "
tela6Linha15 : string "             y    ||       l            "
tela6Linha16 : string "            y  S  ||        l           "
tela6Linha17 : string "           y      ||         l          "
tela6Linha18 : string "          y_______||    O     l         "
tela6Linha19 : string "           y l    ||__ y|l ____l        "
tela6Linha20 : string "   _      | S |   ||    |               "
tela6Linha21 : string "   |l    __l_y____||___y_l______        "
tela6Linha22 : string "   | l   l                     y        "
tela6Linha23 : string "   y  l   l       SIMOES      y         "
tela6Linha24 : string "===========l_________________y=========="
tela6Linha25 : string "                                        "
tela6Linha26 : string "                                        "
tela6Linha27 : string "                                        "
tela6Linha28 : string "                                        "
tela6Linha29 : string "                                        "
