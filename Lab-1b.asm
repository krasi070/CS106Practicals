# --------------------------------
# CS106 Practical Assignment 1(b)
# ax^2 + bx + c
# --------------------------------

# sample input data

.data
A:    .word 100
B:    .word 10
C:    .word 1
.text
      li    $a0, 3

CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Write code to evaluate ax^2 + bx + c.
# a, b and c are in memory addresses A, B and C.
# x is in register $a0.
# Place the result in $v0.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

      lw    $v0, A            # v0 = a 
      lw    $t0, B            # t0 = b
      lw    $t1, C            # t1 = c
      mul   $v0, $v0, $a0     # v0 = v0 * a0 (a * x)
      mul   $v0, $v0, $a0     # v0 = v0 * a0 (a * x * x)
      mul   $t0, $t0, $a0     # t0 = t0 * a0 (b * x)
      add   $v0, $v0, $t0     # v0 = v0 + t0 (a * x * x + b * x)
      add   $v0, $v0, $t1     # v0 = v0 + t1 (ax**2 + bx + c)

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-1b-Tests.asm"
