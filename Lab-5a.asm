# --------------------------------
# CS106 Practical Assignment 5(a)
# Multiplication by shifting and adding
# --------------------------------

# sample input data

.data
A:    .half 99 101
.text
      la    $a0, A
      la    $a1, A+2

CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Multiply the 16-bit numbers at the addresses in $a0 and $a1.
# Place the result in $v0.
# Do not use mul or div.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

      li      $v0, 0             # v0 = 0
      lh      $t0, ($a0)         # t0 = multiplicand
      lh      $t1, ($a1)         # t1 = multiplier
WhileLoop:
      and     $t2, $t1, 1        # t2 = least significant bit
      beqz    $t2, EndIf         # if (t1 % 2 == 1)
      addu    $v0, $v0, $t0      # v0 = v0 + t0
EndIf:
      sll     $t0, $t0, 1        # t0 = 2 * t0
      srl     $t1, $t1, 1        # t1 = t1 / 2
      bnez    $t1, WhileLoop     # while (t1 != 0)

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-5a-Tests.asm"
