# --------------------------------
# CS106 Practical Assignment 6(b)
# Centroid of nine points
# --------------------------------

.text

      j     Z_StartTests      # run tests

# ----------------------------------------------------------------
# CentroidOfNinePoints
# Input:   a0 address of array of nine points
# Returns: v0 x-coordinate of the centroid of the points
#          v1 y-coordinate of the centroid of the points
# Calls centroid subroutine.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

CentroidOfNinePoints:
      addi    $sp, $sp, -16       # save 4 bytes in stack frame
      sw      $ra, ($sp)          # store ra in stack frame
      sw      $s0, 4($sp)         # store s0 in stack frame
      sw      $s1, 8($sp)         # store s1 in stack frame
      sw      $s4, 12($sp)        # store s4 in stack frame
      
      li      $s0, 0              # s0(counter) = 0
      move    $s4, $a0            # s4 = a0
      la      $s1, 0x10014000     # s1 = arr to store centroid addresses
Loop:
      add     $a0, $s4, $s0       # a0 = address of first point out of three
      addi    $a1, $a0, 8         # a1 = address of second point out of three
      addi    $a2, $a0, 16        # a2 = address of third point out of three
      jal     centroid            # centroid(a0, a1, a2)
      sw      $v0, ($s1)          # store x centroid in s1
      sw      $v1, 4($s1)         # store y centroid in s1 + 4
      addi    $s1, $s1, 8         # increment s1 for storing next point
      addi    $s0, $s0, 24        # s0 = address of next set of three points
      blt     $s0, 72, Loop       # loop if s0 < 72 (9 * 8)
      
      addi    $a2, $s1, -8        # a2 = third centroid
      addi    $a1, $s1, -16       # a1 = second centroid
      addi    $a0, $s1, -24       # a0 = first centroid
      jal     centroid            # centroid(a0, a1, a2)
      
      lw      $s4, 12($sp)        # load s4 from stack frame
      lw      $s1, 8($sp)         # load s1 from stack frame
      lw      $s0, 4($sp)         # load s0 from stack frame
      lw      $ra, ($sp)          # load ra from stack frame
      addi    $sp, $sp, 16        # move stack pointer to where it was
      jr      $ra                 # return to caller

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

.include "Lab-6b-Tests.asm"
