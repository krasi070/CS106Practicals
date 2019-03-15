# --------------------------------
# CS106 Practical 6(b) Test Data
# Centroid of nine points
# --------------------------------

.data

.eqv	NUMTESTS	5	# number of tests
.eqv	NUMMEMARGS	0	# number of arguments in memory
.eqv	MEMARGLOC	0	# location of arguments in memory
.eqv	MEMARGSIZE	0	# size of memory argument
.eqv	NUMREGARGS	1	# number of arguments in $aN registers
.eqv	NUMREGRES	2	# number of results in $vN registers (0: result in memory)
.eqv	ARGFORMAT	999	# array of nine points
.eqv	RESFORMAT	1	# decimal integer
.eqv	FUNTEST	1	# testing subroutine?
.eqv	CodeToTest	CentroidOfNinePoints

Z_Buffer:	.word		0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

Z_TestStr0:	.asciiz 	"Input: "
Z_TestStr1:	.asciiz	"\n"
Z_TestStrs:	.word 	Z_TestStr0 Z_TestStr1


Z_TestData:			# arguments followed by results

	.word	Z_Test1 
	.word 14 17
	.word	Z_Test2 
	.word 0 15
	.word	Z_Test3 
	.word -4 1
	.word	Z_Test4 
	.word -40 -21
	.word	Z_Test5 
	.word -8 23

Z_Test1:	.word	 99   0   0  30  30   0    10  10  20  75 -30  30     0  22 -30  2   27 -15
Z_Test2:	.word  10  98  20  20 -39  30     0  20 -30   0  18 -17    -4  -3  10  -8  15   2
Z_Test3:	.word   0  20 -97   0  27 -17     5  -5  10 -10  15  0     20 -30 -60  33  40  20
Z_Test4:	.word  20 -30 -60 -96  40  20   -50  90 -90  50 -90 -90   -60 -60 -60 -12 -12 -60
Z_Test5:	.word   5 -5   10 -10  95   0    70 -30 -60  10  40  20   -50  90 -90  50 -90  90

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
