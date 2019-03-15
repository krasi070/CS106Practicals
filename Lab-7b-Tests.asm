# --------------------------------
# CS106 Practical 7(b) Test Data
# Integer partitions
# --------------------------------

.data

.eqv	NUMTESTS	5	# number of tests
.eqv	NUMMEMARGS	0	# number of arguments in memory
.eqv	MEMARGLOC	0	# location of arguments in memory
.eqv	MEMARGSIZE	0	# size of memory argument
.eqv	NUMREGARGS	2	# number of arguments in $aN registers
.eqv	NUMREGRES	2	# number of results in $vN registers (0: result in memory)
.eqv	ARGFORMAT	1	# decimal integer
.eqv	RESFORMAT	1	# decimal integer
.eqv	FUNTEST	-1	# testing subroutine? (-1 for counter in $v1)
.eqv	CodeToTest	partitions

Z_Buffer:	.word		0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

Z_TestStr0:	.asciiz 	"Evaluating partitions("
Z_TestStr1:	.asciiz	","
Z_TestStr2:	.asciiz	") ...\n"
Z_TestStrs:	.word 	Z_TestStr0 Z_TestStr1 Z_TestStr2


Z_TestData:			# arguments followed by results

	.word 1 1 1 1
	.word 5 1 7 7
	.word 20 3 49 49
	.word 40 5 317 317
	.word 32 1 8349 8349


.include "RunTest.asm"

# --------------------------------
# Counter
# --------------------------------
Counter:

	counter()			# just call macro
	jr	$ra			# return from subroutine
