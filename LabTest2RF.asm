# --------------------------------
# CS106 Practical Test 2
# --------------------------------

.text

      j     Z_StartTests      # run tests

# ----------------------------------------------------------------
# beta
# Input:   a0: n
# Returns: v0: beta(n)
# beta(0) = 3,                    if n <= 1
# beta(n) = 3 * beta(n - 2) - 5,  if n > 1 is even
# beta(n) = n * beta(n - 3),      otherwise
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

beta:
      addi    $sp, $sp, -8      # create stack frame
      sw      $ra, ($sp)        # store ra in stack frame
      sw      $a0, 4($sp)       # store a0 in stack frame
      
      ble     $a0, 1, else      # if (n <= 1)
      andi    $t0, $a0, 1       # t0 = t0 % 2 == 0 ? 0 : 1
      bnez    $t0, odd          # if (n % 2 == 0)
      sub     $a0, $a0, 2       # a0 -= 2
      jal     beta              # v0 = beta(n - 2)
      mul     $v0, $v0, 3       # v0 = v0 * 3
      sub     $v0, $v0, 5       # v0 -= 5
      j       done              # go to destroy stack frame
odd: 
      sub     $a0, $a0, 3       # a0 -= 3
      jal     beta              # beta(n - 3)
      lw      $a0, 4($sp)       # load a0 from stak frame
      mul     $v0, $v0, $a0     # v0 = v0 * n
      j       done              # go to destroy stack frame
else:      
      li      $v0, 3            # v0 = 3
done:
      lw      $ra, ($sp)        # load ra from stack frame
      addi    $sp, $sp, 8       # destroy stack frame
      jr      $ra               # return to caller

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

.include "LabTest2RF-Tests.asm"
