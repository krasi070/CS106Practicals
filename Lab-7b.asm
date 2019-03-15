# --------------------------------
# CS106 Practical Assignment 7(b)
# Integer partitions
# --------------------------------

.text

      j     Z_StartTests      # run tests

# ----------------------------------------------------------------
# partitions
# Input:   a0: n
#          a1: m
# Returns: v0: Number of integer partitions of n with smallest part at least m
# Calls Counter subroutine.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

partitions:
      addi    $sp, $sp, -16       # create stack frame
      sw      $ra, ($sp)          # store ra in stack frame
      sw      $s0, 4($sp)         # store s0(n) in stack frame
      sw      $s1, 8($sp)         # store s1(j = m) in stack frame
      sw      $s2, 12($sp)        # store s2(total) in stack frame
      move    $s0, $a0            # s0 = n
      move    $s1, $a1            # s1 = m
      li      $s2, 1              # s2 = 1
      jal     Counter             # Counter()
loop:
      sll     $t0, $s1, 1         # t0 = 2 * s1
      bgt     $t0, $s0, done      # loop while t0 <= n
      sub     $a0, $s0, $s1       # a0 = s0(n) - s1(j)
      move    $a1, $s1            # a1 = s1(j)
      jal     partitions          # partitions(a0, a1)
      add     $s2, $s2, $v0       # s2(total) += partitions(n - j, j)   
      addi    $s1, $s1, 1         # s1++
      j       loop                # loop back
done:      
      move    $v0, $s2            # v0 = s2(total)
      lw      $s2, 12($sp)        # load s2 from stack frame
      lw      $s1, 8($sp)         # load s1 from stack frame
      lw      $s0, 4($sp)         # load s0 from stack frame
      lw      $ra, ($sp)          # load ra from stack frame
      addi    $sp, $sp, 16        # destroy stack frame
      jr      $ra                 # return to caller   

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

.include "Lab-7b-Tests.asm"
