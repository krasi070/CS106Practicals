# --------------------------------
# CS106 Practical Assignment 5(b)
# Vector dot product by shifting and adding
# --------------------------------

# sample input data

.data
A:    .half     1    2   3  4 5
B:    .half 10000 1000 100 10 1
.text
      la    $a0, A
      la    $a1, B
      li    $a2, 5

CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Calculate the dot product of the halfword vectors at $a0 and $a1.
# The vector length is given in $a2.
# Place the result in $v0.
# Do not use mul or div.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

      li      $t3, 0                  # t3 is the index
      li      $v0, 0                  # v0 = 0
ForLoop:
      bge     $t3, $a2, EndForLoop    # for loop continues while t3 < a2
      sll     $t4, $t3, 1             # t4 = 2 * t3
      add     $t5, $a0, $t4           # t5 = curr address
      add     $t6, $a1, $t4           # t6 = curr address
      lh      $t0, ($t5)              # t0 = multiplicand
      lh      $t1, ($t6)              # t1 = multiplier
WhileLoop:
      and     $t2, $t1, 1             # t2 = least significant bit
      beqz    $t2, EndIf              # if (t1 % 2 == 1)
      addu    $v0, $v0, $t0           # v0 = v0 + t0
EndIf:
      sll     $t0, $t0, 1             # t0 = 2 * t0
      srl     $t1, $t1, 1             # t1 = t1 / 2
      bnez    $t1, WhileLoop          # while (t1 != 0)
      addi    $t3, $t3, 1             # increment index
      j       ForLoop                 # loop back
EndForLoop:

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-5b-Tests.asm"
