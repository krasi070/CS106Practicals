# --------------------------------
# CS106 Practical Assignment 6(a)
# Centroid of a triangle
# --------------------------------

.text

      j     Z_StartTests      # run tests

# ----------------------------------------------------------------
# IsCentroidInFirstQuadrant
# Input:   a0 address of array of three points
# Returns: v0 nonzero if the centroid of the points is in the first quadrant
# Calls centroid subroutine.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

IsCentroidInFirstQuadrant:
      addi    $sp, $sp, -12       # save 4 bytes in stack frame
      sw      $ra, ($sp)          # store ra in stack frame
      sw      $s0, 4($sp)         # store s0 in stack frame
      sw      $s1, 8($sp)         # store s1 in stack frame
      
      addi    $a1, $a0, 8         # a1 = second point
      addi    $a2, $a0, 16        # a2 = third point
      jal     centroid            # centroid(a0, a1, a2)
      sge     $s0, $v0, 0         # s0 = v0 >= 0 ? 1 : 0
      sge     $s1, $v1, 0         # s1 = v1 >= 0 ? 1 : 0
      and     $v0, $s0, $s1       # if in first quadrant v0 = 1, else v0 = 0      
      
      lw      $s1, 8($sp)         # load s1 from stack frame
      lw      $s0, 4($sp)         # load s0 from stack frame
      lw      $ra, ($sp)          # load ra from stack frame
      addi    $sp, $sp, 12        # move stack pointer to where it was
      jr      $ra                 # return to caller

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

.include "Lab-6a-Tests.asm"
