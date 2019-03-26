# --------------------------------
# CS106 Practical 8(a) Test Data
# Binary tree leaf sum
# --------------------------------

.data

.eqv	NUMTESTS	5	# number of tests
.eqv	NUMMEMARGS	0	# number of arguments in memory
.eqv	MEMARGLOC	0	# location of arguments in memory
.eqv	MEMARGSIZE	0	# size of memory argument
.eqv	NUMREGARGS	1	# number of arguments in $aN registers
.eqv	NUMREGRES	1	# number of results in $vN registers (0: result in memory)
.eqv	ARGFORMAT	124	# binary expression tree
.eqv	RESFORMAT	1	# decimal integer
.eqv	FUNTEST	1	# testing subroutine?
.eqv	CodeToTest	SumTree

Z_Buffer:	.word		0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

Z_TestStr0:	.asciiz 	"Evaluating "
Z_TestStr1:	.asciiz	" ...\n"
Z_TestStrs:	.word 	Z_TestStr0 Z_TestStr1 


Z_TestData:			# arguments followed by results

	.word Z_TestNodeA 
	.word 50
	.word Z_TestNodeB 
	.word -27
	.word Z_TestNodeC 
	.word 87
	.word Z_TestNodeD
	.word 0
	.word Z_TestNodeE
	.word 122

Z_TestInt3:		.word 3 0 0
Z_TestInt13:	.word 13 0 0
Z_TestInt37:	.word 37 0 0
Z_TestInt99:	.word 99 0 0
Z_TestInt111:	.word 111 0 0
Z_TestIntNeg77:	.word -77 0 0
Z_TestIntNeg186:	.word -186 0 0

Z_TestNodeA:	.word 0 Z_TestInt13 Z_TestInt37
Z_TestNodeB:	.word 0 Z_TestIntNeg77 Z_TestNodeA
Z_TestNodeC:	.word 0 Z_TestNodeB Z_TestNodeC1
Z_TestNodeC1:	.word 0 Z_TestInt111 Z_TestInt3
Z_TestNodeD:	.word 0 Z_TestNodeD1 Z_TestNodeD2
Z_TestNodeD1: 	.word 0 Z_TestNodeB Z_TestInt99
Z_TestNodeD2:	.word 0 Z_TestNodeC1 Z_TestIntNeg186
Z_TestNodeE:	.word 0 Z_TestNodeA Z_TestNodeD1

.include "RunTest.asm"
