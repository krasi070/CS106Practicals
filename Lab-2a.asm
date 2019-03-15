# --------------------------------
# CS106 Practical Assignment 2(a)
# Bitfields: Extracting data
# --------------------------------

# sample input data

.data

A:    .half 0x5555 0x7777 0x3EEF 0x7ACE 0x2BCD 0x1234

.text
CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Data format (16 bits): JPGRYMMMMMMMMxxx
# MMMMMMMM is the magic number.
# Write code to extract the magic number from A[0] into $v0
# and the magic number from A[5] into $v1.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

	lh       $t0, A+0              # to = A[0]         
	and      $v0, $t0, 0x07F8      # v0 = magic numbers from A[0]
	srl      $v0, $v0, 3           # remove trailing zeroes from v0
	lh       $t0, A+10             # t0 = A[5]
	and      $v1, $t0, 0x07f8      # v0 = magic numbers from A[5]
	srl      $v1, $v1, 3           # remove trailing zeroes from v1
	
# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-2a-Tests.asm"
