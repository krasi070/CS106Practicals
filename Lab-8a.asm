# --------------------------------
# CS106 Practical Assignment 8(a)
# Binary tree leaf sum
# --------------------------------

.text

      j     Z_StartTests      # run tests

# ----------------------------------------------------------------
# SumTree
# Input:   a0: binary expression tree
# Returns: v0: sum of numbers in leaves of tree
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

SumTree:
      addi    $sp, $sp, -12      # create stack frame
      sw      $ra, ($sp)         # store ra in stack frame
      sw      $s0, 4($sp)        # store s0 in stack frame
      sw      $s1, 8($sp)        # store s1 in stack frame
      
      lw      $s0, 4($a0)        # s0 = left node
      bnez    $s0, Else          # if (s0 == 0)
      lw      $v0, ($a0)         # v0 = leaf
      j       Done               # jump to Done
Else:
      lw      $s1, 8($a0)        # s1 = right node
      move    $a0, $s0           # a0 = s0 (left node)
      jal     SumTree            # v0 = SumTree(left node)
      move    $s0, $v0           # s0 = SumTree(left node)
      move    $a0, $s1           # a0 = s1 (right node)
      jal     SumTree            # v0 = SumTree(right node)
      add     $v0, $s0, $v0      # v0 = SumTree(left node) + SumTree(right node) 
Done:
      lw      $s1, 8($sp)        # load s1 from stack frame
      lw      $s0, 4($sp)        # load s0 from stack frame
      lw      $ra, ($sp)         # load ra from stack frame
      addi    $sp, $sp, 12       # destroy stack frame
      jr      $ra                # return to caller

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

.include "Lab-8a-Tests.asm"
