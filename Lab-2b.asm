# --------------------------------
# CS106 Practical Assignment 2(b)
# Bitfields: Modifying data
# --------------------------------

# sample input data

.data

A:    .half 0x5555 0x7777 0x3EEF 0x7ACE 0x2BCD 0x1234

.text
CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Data format (16 bits): JPGRYMMMMMMMMxxx
# MMMMMMMM is the magic number.
# Write code to load A[1] and change its magic number to PG0YPG1Y.
# Place the modified A[1] in $v0.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

	lh       $v0, A+2              # v0 = A[1]
	and      $t0, $v0, 0x6800      # t0 = extracted PG0Y flags
	srl      $t0, $t0, 8           # t0 = PG0Y flags placed in least significant magic number bits
	sll      $t1, $t0, 4           # t1 = PG0Y flags placed in most significant magic number bits
	or       $t0, $t0, $t1         # t0 = t0 + t1 
	or       $t0, $t0, 0x0010      # set the second least signifact bit in magic number
	and      $v0, $v0, 0xF807      # changed magic number flag to zeroes
	or       $v0, $v0, $t0         # placed modified magic number flag

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-2b-Tests.asm"
