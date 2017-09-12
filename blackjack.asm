#Virginia Riego del Castillo
	.data
bienvenida:	.asciiz "Bienvenido al Blackjack: 'V cuadrado'.\n"
bienvenida2:	.asciiz "Creado por Virginia Riego.\n"
bienvenida3:	.asciiz "Esperamos que disfruten jugando.\n"
preguntaJugador:.asciiz "Si desea una carta más, por favor pulse 1.\nSi desea plantarse, por favor pulse 2. \n"
coma:		.asciiz ","
saltoDeLinea:	.asciiz "\n"
turnoJugador1:	.asciiz "Comienza el turno del Jugador 1, mucha suerte.\n"
turnoJugador2:	.asciiz "Comienza el turno del Jugador 2, mucha suerte.\n"
imprimirCartas:	.asciiz "Éstas son sus cartas:\n"
imprimirSuma:	.asciiz "La suma de sus cartas es: "
pasarse:	.asciiz "Lo sentimos, se ha pasado de 21.\n"
jugador1_perdido:.asciiz "El jugador 1 ha perdido.\nEnhorabuena jugador 2, has ganado.:)"
jugador2_perdido:.asciiz "El jugador 2 ha perdido.\nEnhorabuena jugador 1, has ganado.:)"
empate:		.asciiz "Los jugadores han empatado."
.align 2
cartas_jugador1: .space 40
cartas_jugador2: .space 40
	.text
	.globl main
	
main:
		#IMPRIMIR BIENVENIDA
	li $v0,4
	la $a0, bienvenida
	syscall
	li $v0,4
	la $a0, bienvenida2
	syscall
	li $v0,4
	la $a0, bienvenida3
	syscall
	li $v0,4
	la $a0, saltoDeLinea
	syscall
	
		#TURNO JUGADOR 1
	li $v0,4
	la $a0, turnoJugador1
	syscall
	#generar carta
	li $a0, 0 #tamaño array
	la $a1, cartas_jugador1
	jal generaCartas
	move $t0, $v0
cartamas:
	#generar carta
	move $a0, $t0
	la $a1, cartas_jugador1
	jal generaCartas
	move $t0, $v0
	#imprimirlas
	li $v0, 4
	la $a0, imprimirCartas
	syscall
	la $a0, coma
	move $a1, $t0
	la $a2, cartas_jugador1
	jal mostrarCartas
	#calcular la suma
	nop
	la $a0, cartas_jugador1
	move $a1, $t0
	jal calcularValor
	move $t2, $v0
	#imprimir la suma 
	li $v0, 4
	la $a0, saltoDeLinea
	syscall
	li $v0, 4
	la $a0, imprimirSuma
	syscall
	move $a0, $t2
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, saltoDeLinea
	syscall
	bgt $t2, 21, haPerdido1
	#preguntar al jugador
	la $a0, preguntaJugador
	jal preguntarJugador
	beq $v0, 1, cartamas
					
		#TURNO JUGADOR 2
	li $v0,4
	la $a0, saltoDeLinea
	syscall
	li $v0,4
	la $a0, turnoJugador2
	syscall
	#generar carta
	li $a0, 0 #tamaño array
	la $a1, cartas_jugador2
	jal generaCartas
	move $t1, $v0
cartamas2:
	#generar carta
	move $a0, $t1
	la $a1, cartas_jugador2
	jal generaCartas
	move $t1, $v0
	#imprimirlas
	li $v0, 4
	la $a0, imprimirCartas
	syscall
	la $a0, coma
	move $a1, $t1
	la $a2, cartas_jugador2
	jal mostrarCartas
	#calcular la suma
	nop
	la $a0, cartas_jugador2
	move $a1, $t1
	jal calcularValor
	move $t3, $v0
	#imprimir la suma 
	li $v0, 4
	la $a0, saltoDeLinea
	syscall
	li $v0, 4
	la $a0, imprimirSuma
	syscall
	move $a0, $t3
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, saltoDeLinea
	syscall
	bgt $t3, 21, haPerdido2
	#preguntar al jugador
	la $a0, preguntaJugador
	jal preguntarJugador
	beq $v0, 1, cartamas2
	#COMPARAR CARTAS JUGADORES
	li $v0,4
	la $a0, saltoDeLinea
	syscall
	beq $t2,$t3, empatar
	bgt $t2, $t3, haPerdido2.1
	bgt $t3, $t2, haPerdido1.1

haPerdido1:
	li $v0, 4
	la $a0, pasarse
	syscall
	li $v0, 4
	la $a0, jugador1_perdido
	syscall
	j finPrograma

haPerdido2:
	li $v0, 4
	la $a0, pasarse
	syscall
	li $v0, 4
	la $a0, jugador2_perdido
	syscall
	j finPrograma
	
haPerdido1.1:
	li $v0, 4
	la $a0, jugador1_perdido
	syscall
	j finPrograma
	
haPerdido2.1:
	li $v0, 4
	la $a0, jugador2_perdido
	syscall
	j finPrograma
	
empatar: 
	li $v0, 4
	la $a0, empate
	syscall
	j finPrograma
	
finPrograma:
	li $v0, 10
	syscall	
	
generaCartas:
	move $t0, $a0
	move $t1, $a1
	li $a0, 1
	li $a1,13
	li $v0, 42
	syscall
	addi $a0, $a0, 1
	move $t4, $t0
	mul $t0, $t0,4
	add $t1, $t1, $t0
	sw $a0, ($t1)
	addi $v0, $t4, 1
	jr $ra

mostrarCartas:
	move $a3, $a0 #coma
	lw $a0, ($a2)
	li $v0,1
	syscall
	bucleComa:
		beq $a1,1, salirImpresion
		addi $a1, $a1, -1	
		li $v0, 4
		move $a0, $a3
		syscall
		addi $a2, $a2, 4
		lw $a0, ($a2)
		li $v0,1
		syscall
		j bucleComa
	
	salirImpresion:
		jr $ra


calcularValor:
	li $a3, 0 #inicializar la suma
	buclesuma:
		beqz $a1, salirsuma	
		lw $a2, ($a0) #leer la carta
		addi $sp, $sp, -4
		sw $ra, ($sp)
		jal cambiarCarta
		lw $ra, ($sp)
		addi $sp, $sp, 4
		move $a2, $v0
		add $a3, $a3, $a2 #sumar valor de la carta
		addi $sp, $sp, -4
		sw $ra, ($sp)
		jal masde21
		lw $ra, ($sp)
		addi $sp, $sp, 4
		move $a3, $v0		
		addi $a0, $a0, 4 #apuntar a la siguiente carta
		addi $a1, $a1, -1 #restar una carta leida
		j buclesuma
		
	salirsuma:
		move $v0, $a3
		jr $ra
	masde21:
		bgt $a3, 21, comprobar
		move $v0, $a3
		jr $ra
	comprobar:
		beq $a2, 11, restar
		move $v0, $a3
		jr $ra
	restar:
		addi $a3, $a3, -10
		move $v0, $a3
		jr $ra

cambiarCarta: #recibe en $a2 el valor de la carta y devuelve en $v1
	li $v0, 0
	beq $a2, 11, cambiarA10
	beq $a2, 12, cambiarA10
	beq $a2, 13, cambiarA10
	beq $a2, 1, cambiarA11
	move $v0, $a2
	jr $ra
	cambiarA10:
			li $v0, 10
			jr $ra
	cambiarA11:
			li $v0, 11
			jr $ra

preguntarJugador: #entra en $a0 la pregunta y sale en $v0 la respuesta ( 1 carta, 2 plantarse)
	li $v0, 4
	syscall
	li $v0,5
	syscall
	beq $v0,1, salir
	beq $v0,2, salir
	beqz $v0, salir
	j preguntarJugador
	
salir:	jr $ra
