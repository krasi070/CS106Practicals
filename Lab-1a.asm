# --------------------------------
# CS106 Practical Assignment 1(a)
# a + 2b + 3c
# --------------------------------

# sample input data

.data
A:    .word 100
B:    .word 10
C:    .word 1

.text
CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Write code to evaluate a + 2b + 3c.
# a, b and c are in memory addresses A, B and C.
# Place the result in $v0.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

      # Sample code: This computes a + b
      lw    $v0, A            # v0 = a
      lw    $t0, B            # t0 = b
      lw    $t1, C            # t1 = c
      add   $t0, $t0, $t0     # t0 = t0 + t0 (b + b)
      mul   $t1, $t1, 3       # t1 = t1 * 3 (c * 3)
      add   $t0, $t0, $t1     # t0 = t0 + t1 (2b + 3c)
      add   $v0, $v0, $t0     # v0 = v0 + t0 (a + 2b + 3c)

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-1a-Tests.asm"
