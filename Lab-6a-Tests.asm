# --------------------------------
# CS106 Practical 6(a) Test Data
# Centroid of a triangle
# --------------------------------

.data

.eqv	NUMTESTS	5	# number of tests
.eqv	NUMMEMARGS	0	# number of arguments in memory
.eqv	MEMARGLOC	0	# location of arguments in memory
.eqv	MEMARGSIZE	0	# size of memory argument
.eqv	NUMREGARGS	1	# number of arguments in $aN registers
.eqv	NUMREGRES	1	# number of results in $vN registers (0: result in memory)
.eqv	ARGFORMAT	333	# array of three points
.eqv	RESFORMAT	0	# Boolean
.eqv	FUNTEST	1	# testing subroutine?
.eqv	CodeToTest	IsCentroidInFirstQuadrant

Z_Buffer:	.word		0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

Z_TestStr0:	.asciiz 	"Input: "
Z_TestStr1:	.asciiz	"\n"
Z_TestStrs:	.word 	Z_TestStr0 Z_TestStr1


Z_TestData:			# arguments followed by results

	.word	Z_Test1 1
	.word	Z_Test2 1
	.word	Z_Test3 0
	.word	Z_Test4 0
	.word	Z_Test5 1

Z_Test1:	.word	0 0 0 30 30 0
Z_Test2:	.word 10 10 20 20 -30 30
Z_Test3:	.word 0 20 -30 0 27 -17
Z_Test4:	.word 5 -5 10 -10 15 0
Z_Test5:	.word 20 -30 -60 10 40 20

.include "RunTest.asm"

# --------------------------------
# centroid
# given points at addresses in a0, a1 and a2
# places x and y coords of centroid in v0 and v1
# --------------------------------
centroid:
	
	# this deliberately uses a lot of registers
	lw	$t0, ($a0)		# load x coordinate
	lw	$t1, ($a1)
	lw	$t2, ($a2)
	lw	$t5, 4($a0)		# load y coordinate
	lw	$t6, 4($a1)
	lw	$t7, 4($a2)
	add	$t3, $t0, $t1	# calculate x coordinate
	add	$t4, $t3, $t2
	move	$a0, $t4
	div	$a1, $a0, 3
	move  $v0, $a1
	add	$t8, $t5, $t6	# calculate y coordinate
	add	$t9, $t8, $t7
	move	$a2, $t9	
	div	$a3, $a2, 3
	move  $v1, $a3
	PrintString("Centroid calculated to be (")
	PrintInt($v0)
	PrintString(",")
	PrintInt($v1)
	PrintString(").  ")
	jr	$ra			# return from subroutine
