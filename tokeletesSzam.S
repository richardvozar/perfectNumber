.syntax unified
.cpu cortex-a7
.text
.global is_perfect
is_perfect:
				@ r0-ba erkezik a parameter
				@ r1 lesz a ciklusvaltozo
				@ r2 regiszterben lesz a modulo(r3, r4) == r3 % r4
				@ r4 az osszeg
	push {r4-r11, lr}

	cmp r0, #0		@ (r0 - 0)
	beq _not_perfect_number	@ if (r0 == 0) { goto _not_perfect_number }

	cmp r0, #1		@ (r0 - 1)
	beq _not_perfect_number	@ if (r0 == 1) { goto _not_perfect_number }

	mov r1, #0		@ ciklusvaltozo, 1-tol
	mov r4, #0

_loop:
	add r1, r1, #1
	mov r2, #0		@ modulo torles

	cmp r0, r1		@ (parameter - ciklusvaltozo)
	ble _exit_loop		@ if (r1 < r0) { goto _exit_loop }

	udiv r3, r0, r1		@ r3 := r0 / r1
	mul r2, r1, r3		@ r2 := r1 * r3
	sub r2, r0, r2		@ r2 := r0 - r2 ==> mod(r0, r1)

	cmp r2, #0
	beq _summ

	b _loop


_summ:
	add r4, r4, r1
	b _loop


_perfect_number:
	mov r0, #1
	b _epilogus

_not_perfect_number:
	mov r0, #0
	b _epilogus

_exit_loop:
	cmp r0, r4

	beq _perfect_number

	bne _not_perfect_number

_epilogus:
	pop {r4-r11, pc}

