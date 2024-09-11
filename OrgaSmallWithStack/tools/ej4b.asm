; Usando la instruccion ADDE10S, implementar la funcion sumE10S que toma un par de arreglos
; de numeros en notacion exceso 10 y suma los elementos entre si. El resultado de cada operacion
; se almacena en ambos arreglos por cada elemento sumado.
;     sumE10S(*p,*t,size)
;         for i=0; i<size; i++
;             r = sumExceso10Sat(p[i], t[i])
;             p[i] = r
;             t[i] = r

main:
	SET R7, 0xFF	;stack
	SET R0, p		;p
	SET R1, t		;t
	SET R2, 0x10	;size

	CALL |R7|, sumE10S

halt:
	JMP halt

sumE10S:
	SET R3, 0x00 ; contador
	SET R4, 0x01 ; 1
	PUSH |R7|, R0
	PUSH |R7|, R1
	PUSH |R7|, R2
	PUSH |R7|, R3
	PUSH |R7|, R4
	loop:
		CMP R3, R2 
		JZ return
		LOAD R5, [R0]
		LOAD R6, [R1]
		ADDE10S R5, R6
		STR [R0], R5
		STR [R1], R5
		ADD R3, R4
		ADD R0, R4
		ADD R1, R4
		JMP loop

	return:
		POP |R7|, R0
		POP |R7|, R1
		POP |R7|, R2
		POP |R7|, R3
		POP |R7|, R4
		RET |R7|


p:
DB 0x01
DB 0x02
DB 0x04
DB 0x08
DB 0x03
DB 0x03
DB 0xA1
DB 0xC0
DB 0xFF
DB 0x40
DB 0x55
DB 0xCC
DB 0xBD
DB 0x45
DB 0x9A
DB 0xEE

t:
DB 0x01
DB 0x01
DB 0x34
DB 0x02
DB 0x03
DB 0x23
DB 0xAA
DB 0xCF
DB 0x0F
DB 0x4F
DB 0x50
DB 0x0C
DB 0xC0
DB 0x54
DB 0x88
DB 0xA0
