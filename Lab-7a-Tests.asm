# --------------------------------
# CS106 Practical 7(a) Test Data
# Fibonacci numbers
# --------------------------------

.data

.eqv	NUMTESTS	5	# number of tests
.eqv	NUMMEMARGS	0	# number of arguments in memory
.eqv	MEMARGLOC	0	# location of arguments in memory
.eqv	MEMARGSIZE	0	# size of memory argument
.eqv	NUMREGARGS	1	# number of arguments in $aN registers
.eqv	NUMREGRES	2	# number of results in $vN registers (0: result in memory)
.eqv	ARGFORMAT	1	# decimal integer
.eqv	RESFORMAT	1	# decimal integer
.eqv	FUNTEST	-1	# testing subroutine? (-1 for counter in $v1)
.eqv	CodeToTest	fib

Z_Buffer:	.word		0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

Z_TestStr0:	.asciiz 	"Evaluating fib("
Z_TestStr1:	.asciiz	") ...\n"
Z_TestStrs:	.word 	Z_TestStr0 Z_TestStr1


Z_TestData:			# arguments followed by results

	.word 0 0 1
	.word 1 1 1
	.word 6 8 25
	.word 13 233 753
	.word 19 4181 13529


.include "RunTest.asm"

# --------------------------------
# Counter
# --------------------------------
Counter:

	counter()			# just call macro
	jr	$ra			# return from subroutine
