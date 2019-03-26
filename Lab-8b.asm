# --------------------------------
# CS106 Practical Assignment 8(b)
# Expression evaluation
# --------------------------------

.text

      j     Z_StartTests      # run tests

# ----------------------------------------------------------------
# EvalExpr
# Input:   a0: binary expression tree (0 = add, 1 = sub, 2 = mul, 3 = div)
# Returns: v0: evaluation of expression
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

.data 
OperationCode: .word Adding Subtract Multiply Divide 
   
.text

EvalExpr:
      addi    $sp, $sp, -16                # create stack frame
      sw      $ra, ($sp)                   # store ra in stack frame
      sw      $s0, 4($sp)                  # store s0 in stack frame
      sw      $s1, 8($sp)                  # store s1 in stack frame
      sw      $a0, 12($sp)                 # store a0 in stack frame
      
      lw      $s0, 4($a0)                  # s0 = left node
      bnez    $s0, Else                    # if (s0 == 0)
      lw      $v0, ($a0)                   # v0 = leaf
      j       Done                         # jump to Done
Else:
      lw      $s1, 8($a0)                  # s1 = right node
      move    $a0, $s0                     # a0 = s0 (left node)
      jal     EvalExpr                     # v0 = EvalExpr(left node)
      move    $s0, $v0                     # s0 = EvalExpr(left node)
      move    $a0, $s1                     # a0 = s1 (right node)
      jal     EvalExpr                     # v0 = EvalExpr(right node)
      lw      $a0, 12($sp)                 # load a0 from stack frame
      lw      $t0, ($a0)                   # t0 = value of a0
      sll     $t0, $t0, 2                  # t0 = t0 * 4
      lw      $t0, OperationCode($t0)      # t0 = OperationCode
      jr      $t0                          # jump to correct operation
Adding:
      add     $v0, $s0, $v0                # v0 = EvalExpr(left node) + EvalExpr(right node)
      j       Done                         # skip other operations
Subtract:
      sub     $v0, $s0, $v0                # v0 = EvalExpr(left node) - EvalExpr(right node)
      j       Done                         # skip other operations
Multiply:
      mul     $v0, $s0, $v0                # v0 = EvalExpr(left node) * EvalExpr(right node)
      j       Done                         # skip other operations
Divide:
      div     $v0, $s0, $v0                # v0 = EvalExpr(left node) / EvalExpr(right node)
Done:
      lw      $s1, 8($sp)                  # load s1 from stack frame
      lw      $s0, 4($sp)                  # load s0 from stack frame
      lw      $ra, ($sp)                   # load ra from stack frame
      addi    $sp, $sp, 16                 # destroy stack frame
      jr      $ra                          # return to caller

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

.include "Lab-8b-Tests.asm"
