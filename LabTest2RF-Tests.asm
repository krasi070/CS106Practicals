# --------------------------------
# CS106 Practical Test 2
# --------------------------------

.data

.eqv	NUMTESTS	5	# number of tests
.eqv	NUMMEMARGS	0	# number of arguments in memory
.eqv	MEMARGLOC	0	# location of arguments in memory
.eqv	MEMARGSIZE	0	# size of memory argument
.eqv	NUMREGARGS	1	# number of arguments in $aN registers
.eqv	NUMREGRES	1	# number of results in $vN registers (0: result in memory)
.eqv	ARGFORMAT	1	# decimal integer
.eqv	RESFORMAT	1	# decimal integer
.eqv	FUNTEST	1	# testing subroutine?
.eqv	CodeToTest	beta

Z_Buffer:	.word		0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

Z_TestStr0:	.asciiz 	"Evaluating beta("
Z_TestStr1:	.asciiz	") ...\n"
Z_TestStrs:	.word 	Z_TestStr0 Z_TestStr1


Z_TestData:			# arguments followed by results

	.word 0 3
	.word 4 7
	.word 8 43
	.word 3 9
	.word 9 144


.include "RunTest.asm"
