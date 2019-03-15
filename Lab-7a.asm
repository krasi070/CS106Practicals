# --------------------------------
# CS106 Practical Assignment 7(a)
# Fibonacci numbers
# --------------------------------

.text

      j     Z_StartTests      # run tests

# ----------------------------------------------------------------
# fib
# Input:   a0: n
# Returns: v0: fib(n)
# Calls Counter subroutine.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

fib:
      addi    $sp, $sp, -12      # create stack frame
      sw      $ra, ($sp)         # store ra in stack frame
      sw      $a0, 4($sp)        # store a0 in stack frame
      sw      $s0, 8($sp)        # store s0 in stack frame
      jal     Counter            # Counter()
      lw      $a0, 4($sp)        # load a0(n) from stack frame
      bgt     $a0, 1, else       # if (a0 <= 1)
      move    $v0, $a0           # v0 = a0
      j       done               # jump to destroying the stack frame
else:
      sub     $a0, $a0, 1        # a0 -= 1
      jal     fib                # fib(n - 1)
      move    $s0, $v0           # s0 = fib(n - 1)
      lw      $a0, 4($sp)        # load a0 from stack frame
      sub     $a0, $a0, 2        # a0 -= 2
      jal     fib                # fib(n - 2)
      add     $v0, $s0, $v0      # v0 = fib(n - 1) + fib(n - 2)
done:
      lw      $s0, 8($sp)        # load s0 from stack frame 
      lw      $ra, ($sp)         # load ra from stack frame
      addi    $sp, $sp, 12       # destroy stack frame 
      jr      $ra                # return to caller

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

.include "Lab-7a-Tests.asm"
